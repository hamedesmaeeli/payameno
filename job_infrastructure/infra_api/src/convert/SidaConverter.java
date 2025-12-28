package convert;

import finance.data.Course;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;

import java.math.RoundingMode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import java.util.BitSet;
import java.util.Date;



import org.basa.tejarat.ftms.core.datatime.IranianDate;

import registration.data.Base;
import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.Registration;
import registration.data.SalaryParam;
import registration.data.Student;
import registration.data.StudentStatus;

import registration.process.RegistrationManager;

import transaction.TransactionManagement;

public class SidaConverter {
    public SidaConverter() {
     
    }
    public void importStudentsFromSida() {
        String maharatComment = "\u0645\u0647\u0627\u0631\u062a";
        String amookhtehComment ="\u0648\u0627\u062d\u062f\u0020\u0622\u0645\u0648\u062e\u062a\u0647";
        // Read loaded data from database Table
        ArrayList<Registration> registrations = new ArrayList<Registration>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        RegistrationManager rm = new RegistrationManager();
        try {
          statement = connection.createStatement();
          ResultSet result =  statement.executeQuery("select * from sida_students_registers");  
          Registration registration;
          Student student;  
          while(result.next()) {
              student = new Student();
              student.setStudentCode(result.getBigDecimal("student_code"));
              student.setNationalId(result.getString("student_code"));
              student.setName(result.getString("student_name"));
              student.setFamily(result.getString("student_family"));
              student.setFatherName(result.getString("student_father_name"));
              student.setDateOfBirth(new IranianDate(result.getInt("birth_year"),result.getInt("birth_month"),result.getInt("birth_day")).getDate());
              student.setStudentStatus(new StudentStatus(new BigDecimal(1),""));
              student.setOrganization(new Organization(new BigDecimal(1),""));
              if(!rm.isStudentCodeExists(student.getStudentCode()))
                 rm.createNewStudent(student);
              
              if(!rm.isStudentRegister(student))
              {
                  registration = new Registration();
                  registration.setStudent(student);
                  registration.setTerm(rm.getCurrentTerm());
                  registration.setRegDate(new Date());
                  registration.setField(new Field(result.getBigDecimal("field_id"),""));
                  registration.setNumberOfActionalUnits(0);
                  registration.setNumberOfTheoryUnits(result.getInt("units_active_counts"));
                  registration.setLevel(new Level(result.getBigDecimal("level_id"),""));
                  Base base =  new Base();
                  base.setId(new BigDecimal(4)); //dahaom
                  registration.setBase(base);
                  SalaryParam salaryParam = new SalaryParam();
                  salaryParam.setTerm(rm.getCurrentTerm());
                  salaryParam.setLevel(new Level(result.getBigDecimal("level_id"),""));
                  
                  salaryParam = rm.getSalaryParam(salaryParam);
                  System.out.println(" in method theorical "+salaryParam.getTheorySalary() );
                  if (registration.getNumberOfTheoryUnits()<8) {
                      registration.setFixShahriye(salaryParam.getFixSalary().divide(new BigDecimal(2)));
                    }
                  else{
                  registration.setFixShahriye(salaryParam.getFixSalary());
                  }
                  registration.setOffAmount(new BigDecimal(0));
                  registration.setOffComment("");
                  String otherSalaryComment ="";
                  BigDecimal otherShahriyeAmount = new BigDecimal(0);
                  int numberOfNoneActiveUnits = result.getInt("units_none_active_counts");
               
                  if(numberOfNoneActiveUnits > 0) {
                      BigDecimal mult = this.divideAndRound(salaryParam.getTheorySalary(),3);
                      BigDecimal noneActiveUnitsPrice =  mult.multiply(new BigDecimal(numberOfNoneActiveUnits));
                      otherSalaryComment = otherSalaryComment+ " "+numberOfNoneActiveUnits+" "+amookhtehComment;
                      otherShahriyeAmount = otherShahriyeAmount.add(noneActiveUnitsPrice);
                  }
                  registration.setOtherShahriyAmount(otherShahriyeAmount);
                  registration.setOtherSalaryComment(otherSalaryComment);
                  
                  registration.setTheoryShahriye(salaryParam.getTheorySalary());
                  registration.setActionalShahriye(salaryParam.getActionSalary());
                  registration.setTotalShahriye(this.calculateRegistrationPrice(registration));
                  int skillsUnitCounts = result.getInt("units_skils_counts");
                    
                  if(skillsUnitCounts>0){
                    if((numberOfNoneActiveUnits+registration.getNumberOfTheoryUnits())>0) {
                        registration.setOtherShahriyAmount(registration.getOtherShahriyAmount().add(salaryParam.getFixSalary()));
                        registration.setTotalShahriye(registration.getTotalShahriye().add(salaryParam.getFixSalary()));
                        registration.setOtherSalaryComment(registration.getOtherSalaryComment()+" "+maharatComment);
                    }
                    else {
                        
                        registration.setTotalShahriye(salaryParam.getFixSalary());
                        registration.setFixShahriye(new BigDecimal(0));
                        registration.setOtherShahriyAmount(salaryParam.getFixSalary());
                        registration.setOtherSalaryComment(maharatComment);
                    }
                  }
                  
                Registration rm1 =  rm.registerStudent(registration);
            //    System.out.println(result.getString(2));
                  
               //entekhab vahed
              Statement statement1 = connection.createStatement();
              ResultSet result2=  statement1.executeQuery("SELECT sida_students_vaheds.*, reg_course.ID FROM sida_students_vaheds INNER JOIN reg_course ON sida_students_vaheds.course_code = reg_course.`code` where student_code =  "+ student.getStudentCode() );
              Course course ;
               
               while(result2.next()) {
                    course = new Course();
                    
                    course.setCourseId(result2.getBigDecimal("ID"));
                      System.out.println("course ID "+ course.getCourseId());
                    rm.addCourseToRegistration(rm1,course);
                  }      
              }
          }
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }   
    }
    public BigDecimal calculateRegistrationPrice(Registration registration) {
       BigDecimal total = new BigDecimal("0");
       
       BigDecimal mulActionShahriye   =new BigDecimal (registration.getNumberOfActionalUnits());
       mulActionShahriye  = mulActionShahriye.multiply(registration.getActionalShahriye());
       
       BigDecimal mulTheoryShahriye = new BigDecimal(registration.getNumberOfTheoryUnits());
       mulTheoryShahriye =   mulTheoryShahriye.multiply(registration.getTheoryShahriye());
       
       total = total.add(registration.getFixShahriye());
       
       total = total.add(mulActionShahriye);
       
       total = total.add(mulTheoryShahriye);
       
       total = total.add(registration.getOtherShahriyAmount());
       
       total = total.subtract(registration.getOffAmount()); 
        return total;
    }
    public void importSidaEntekhabVahed() {
        
    }
    public  BigDecimal divideAndRound(BigDecimal amount, int divisor) {
            if (divisor == 0) {
                throw new IllegalArgumentException("مقسوم‌علیه نمی‌تواند صفر باشد");
            }
            BigDecimal result = amount.divide(BigDecimal.valueOf(divisor),0,RoundingMode.HALF_UP);
            
            BigDecimal hundredTousand =  new BigDecimal("50000");
            
            BigDecimal  divided = result.divide(hundredTousand, 0, RoundingMode.HALF_UP);
            
           return divided.multiply(hundredTousand);
            
        }
    public void importImages() {
                Connection conn = null;
                PreparedStatement checkStmt = null;
                PreparedStatement insertStmt = null;
                String folderPath = "C:/images/students";
                try {
                    conn = TransactionManagement.getInstance().getConnection();
                    conn.setAutoCommit(false);

                    String checkSql = "SELECT COUNT(*) FROM reg_student_image WHERE st_code = ?";
                    checkStmt = conn.prepareStatement(checkSql);

                    String insertSql = "INSERT INTO reg_student_image (st_code, st_image) VALUES (?, ?)";
                    insertStmt = conn.prepareStatement(insertSql);

                    File folder = new File(folderPath);
                    File[] files = folder.listFiles();

                    if (files != null) {
                        for (File file : files) {
                            if (file.isFile()) {
                                try {
                                    String fileName = file.getName();
                                    long stCode = Long.parseLong(fileName.split("\\.")[0]);

                                    // بررسی وجود رکورد
                                    checkStmt.setLong(1, stCode);
                                    ResultSet rs = checkStmt.executeQuery();
                                    rs.next();
                                    int count = rs.getInt(1);
                                    InputStream inputStream = new FileInputStream(file);    
                                    if (count == 0) {
                                        try  {
                                            insertStmt.setLong(1, stCode);
                                            insertStmt.setBlob(2, inputStream);
                                            insertStmt.executeUpdate();
                                            System.out.println("Inserted image for student: " + stCode);
                                        }
                                        catch(Exception e) {
                                            e.printStackTrace();
                                        }
                                    } else {
                                        System.out.println("Image already exists for student: " + stCode);
                                    }
                                } catch (NumberFormatException nfe) {
                                    System.err.println("Filename is not a valid student code: " + file.getName());
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }

                    conn.commit();
                    System.out.println("Process completed!");

                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (checkStmt != null) checkStmt.close();
                        if (insertStmt != null) insertStmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            }
    
}
