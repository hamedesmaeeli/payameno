package registration.process;


import com.sun.corba.se.impl.ior.StubIORImpl;

//import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import finance.data.Account;
import finance.data.AccountBank;
import finance.data.Bank;
import finance.data.Check;

import finance.data.CheckStatus;
import finance.data.Course;
import finance.data.Factor;
import finance.data.FactorType;
import finance.data.RecievePayType;

import finance.data.RecievementPayment;

import finance.process.AccountManager;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

import java.io.IOException;

import java.io.InputStream;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.math.BigInteger;

import java.sql.Blob;
import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.Map;

import org.apache.xerces.impl.dv.util.Base64;

import registration.data.Base;
import registration.data.CourseField;
import registration.data.DanaCourseExam;
import registration.data.DanaCourseStudent;
import registration.data.DanaRegUnit;
import registration.data.DanaRegisterStudent;
import registration.data.Field;
import registration.data.IdentifierChar;
import registration.data.Level;
import registration.data.Organization;
import registration.data.PaymentStep;
import registration.data.Registration;
import registration.data.RegistrationCheck;
import registration.data.RegistrationPayment;
import registration.data.SalaryParam;
import registration.data.School;
import registration.data.Student;
import registration.data.StudentStatus;
import registration.data.Term;

import registration.data.DanaStudent;


import registration.data.ExamCourse;
import registration.data.ExamTime;

import test.FarsiCalendarConversion;

import transaction.TransactionManagement;
import transaction.Utilty;

import transaction.access.AccessDbManage;

public class RegistrationManager {
    public RegistrationManager() { 
    }
    public void createNewStudent(Student student) {
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
        //create new student
        //create new account in finanace and relationships
        try {
            PreparedStatement pre =  connection.prepareStatement("insert into reg_student (name,famili,national_code,identifier_code,identifier_serial,identifier_char,student_code,father_name,date_of_birth,description,status_id,org_unit_id,created_date,last_modified,address,mobile,phone,archive_code,diplom_madrak,pish_madrak) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            pre.setString(1,student.getName());
            pre.setString(2, student.getFamily());
            pre.setString(3, student.getNationalId());
            pre.setString(4, student.getIdentifierCode());
            pre.setString(5, student.getIdentifierSerial());
            pre.setInt(6, student.getIdentifierChar());
            pre.setBigDecimal(7, student.getStudentCode());
            pre.setString(8, student.getFatherName());
            pre.setDate(9, Utilty.convertDateUtilToSQL(student.getDateOfBirth()));
            pre.setString(10, student.getDescription());
            pre.setBigDecimal(11, student.getStudentStatus().getStatusId());
            pre.setBigDecimal(12, student.getOrganization().getId());
            pre.setDate(13,Utilty.convertDateUtilToSQL(new java.util.Date())); // current date time
            pre.setDate(14,Utilty.convertDateUtilToSQL(new java.util.Date())); // current date time
            pre.setString(15, student.getAddress());
            pre.setString(16, student.getMobile());
            pre.setString(17,student.getPhone());
            pre.setString(18, student.getArchiveCode());
            pre.setString(19, student.getDiplomMadrak());
            pre.setString(20, student.getPishMadrak());
            pre.executeUpdate();
           
           
           
            //create Account 
            Account account = new Account();
            account.setCreate_date(new java.util.Date());
            account.setName(student.getName() + " "+ student.getFamily());
            account.setPersonMobile(student.getMobile());
            account.setPhone(student.getPhone());
            account.setPersonName(student.getName() + " "+ student.getFamily());
            account.setFisrtPayable(new BigDecimal("0"));//for first , student with 0
          
            account.setAddress(student.getAddress());
            
            AccountManager am = new AccountManager();
            account =  am.createAccount(account);          
             pre =  connection.prepareStatement("insert into reg_student_account (st_id,acc_id,create_date) values(?,?,?)");
             pre.setBigDecimal(1, student.getStudentCode());
             pre.setBigDecimal(2, account.getId());
             pre.setDate(3, Utilty.convertDateUtilToSQL(new java.util. Date()));
             pre.executeUpdate();
             
             connection.close();
       
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public ArrayList<StudentStatus> getAllStudentStatus() {
        ArrayList<StudentStatus> studentStatuses = new ArrayList<StudentStatus>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_student_status");
          StudentStatus studentStatus;
          while(result.next()) {
              studentStatus = new StudentStatus();
              studentStatus.setStatusId(result.getBigDecimal(1));
              studentStatus.setName(result.getString(2));
              studentStatuses.add(studentStatus);
        //      System.out.println(result.getString(2));
          
          }
            connection.close();
            return studentStatuses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentStatuses;
    }
    public ArrayList<Organization> getAllOrganization() {
        ArrayList<Organization> organizations = new ArrayList<Organization>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;


        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_organization");
          Organization organization;
          while(result.next()) {
              organization = new Organization();
              organization.setId(result.getBigDecimal(1));
              organization.setName(result.getString(2));
              organizations.add(organization);
          //    System.out.println(result.getString(2));
          
          }
            connection.close();
            return organizations;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return organizations;
    }
    public ArrayList<IdentifierChar> getAllIdentiferChars() {
        ArrayList<IdentifierChar> identifierChars = new ArrayList<IdentifierChar>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;


        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_identifier_code");
          IdentifierChar identifierChar;
          while(result.next()) {
              identifierChar = new IdentifierChar();
              identifierChar.setId(result.getInt(1));
              identifierChar.setName(result.getString(2));
              identifierChars.add(identifierChar);
          //    System.out.println(result.getString(2));
          
          }
            connection.close();
            return identifierChars;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return identifierChars;
    }
    public BigDecimal generateStudentCode(String serial, int identifierChar) { 
        //serial , id and character
        String code = identifierChar+serial;
        return  new BigDecimal(code);
    }
    public boolean isStudentCodeExists(BigDecimal st_code) {
        //select from db
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
           ResultSet result = statement.executeQuery("select * from reg_student where student_code = "+st_code);
           if(result.next()) {
            return true;   
           }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean isStudentNatinalCodeExist(int natinalCode) {
        //select from db
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
           ResultSet result = statement.executeQuery("select * from reg_student where national_code = "+natinalCode);
           if(result.next()) {
            return true;   
           
           }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean isStudentNatinalCodeExist(String natinalCode) {
        //select from db
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
           ResultSet result = statement.executeQuery("select * from reg_student where national_code = '"+natinalCode+"'");
           if(result.next()) {
        //    System.out.println("isStudentNatinalCodeExist + exists national");
            return true;   
           
           }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public void editStudent(Student student) {
        //edit status , organization , description, fatherName,date of birth,last modified 
        //mobile , phone , address , archive code
        //select from db
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          
           statement = connection.createStatement();
           PreparedStatement pre =  connection.prepareStatement("update reg_student set name = ?,famili =?,national_code=?,father_name=?,date_of_birth=?,description=?,status_id=?,org_unit_id=?,last_modified=?,address=?,mobile=?,phone=?,archive_code=?,diplom_madrak=?,pish_madrak=? where student_code = "+student.getStudentCode());
          
     //       System.out.println("update reg_student set name = ?,famili =?,national_code=?,father_name=?,date_of_birth=?,description=?,status_id=?,org_unit_id=?,last_modified=?,address=?,mobile=?,phone=?,archive_code=? where student_code = "+student.getStudentCode());
            pre.setString(1,student.getName());
            pre.setString(2, student.getFamily());
            pre.setString(3, student.getNationalId());
            pre.setString(4, student.getFatherName());
            pre.setDate(5, Utilty.convertDateUtilToSQL(student.getDateOfBirth()));
            pre.setString(6, student.getDescription());
            pre.setBigDecimal(7, student.getStudentStatus().getStatusId());
            pre.setBigDecimal(8, student.getOrganization().getId());
            pre.setDate(9,Utilty.convertDateUtilToSQL(new java.util.Date())); // current date time
            pre.setString(10, student.getAddress());
            pre.setString(11, student.getMobile());
            pre.setString(12,student.getPhone());
            pre.setString(13, student.getArchiveCode());
            pre.setString(14, student.getDiplomMadrak());
            pre.setString(15, student.getPishMadrak());
            //pre.setString(14, student.getMadrakCode());
            pre.executeUpdate();
           connection.close();
        
          AccountManager am = new AccountManager();
          Account account = this.getAccountFromStudent(student);
          account.setName(student.getName()+" "+student.getFamily());
          account.setPersonMobile(student.getMobile());
          account.setPersonName(student.getName()+" "+student.getFamily());
          account.setPhone(student.getPhone());   
          am.updateAccount(account);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Registration> getAllStudentRegistrations(Student student) {
        ArrayList<Registration> registrations = new ArrayList<Registration>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_registration where st_id="+student.getStudentCode());
          Registration registration;
          while(result.next()) {
              registration = new Registration();
              registration.setId(result.getBigDecimal(1));
              registration.setRegDate(Utilty.convertDateSQLToUtil(result.getDate(2)));
              registration.setStudent(student);
              registration.setField(this.getFieldFromFieldId(result.getBigDecimal(4)));
              registration.setTerm(this.getTermFromTermId(result.getBigDecimal(5)));
              registration.setLevel(this.getLevelFromLevelId(result.getBigDecimal(6))); 
              registration.setNumberOfTheoryUnits(result.getDouble(7));
              registration.setNumberOfActionalUnits(result.getInt(8));
              registration.setFixShahriye(result.getBigDecimal(9));
              registration.setTheoryShahriye(result.getBigDecimal(11));
              registration.setActionalShahriye(result.getBigDecimal(10));
              registration.setOtherSalaryComment(result.getString(12));
              registration.setOtherShahriyAmount(result.getBigDecimal(13));
              registration.setTotalShahriye(result.getBigDecimal(14));
              registration.setOffAmount(result.getBigDecimal(15));
              registration.setOffComment(result.getString(16));
              registration.setCurrentAccounting(this.getStudentAccoutingInRegistration(registration));
              registration.setTotalPayments(this.getStudentPaymentsInRegistration(registration));
              registrations.add(registration);
           //   System.out.println(result.getString(2));
          
          }
            connection.close();
            return registrations;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrations;

    }
    public Registration getRegistrationFromStudentAndTerm(Student student,Term term) {
        
        Registration registration =null; 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_registration where st_id="+student.getStudentCode()+" and term_id ="+term.getId());
          
          if(result.next()) {
              registration = new Registration();
              registration.setId(result.getBigDecimal(1));
              registration.setRegDate(Utilty.convertDateSQLToUtil(result.getDate(2)));
              registration.setStudent(student);
              registration.setField(this.getFieldFromFieldId(result.getBigDecimal(4)));
              registration.setTerm(term);
              registration.setLevel(this.getLevelFromLevelId(result.getBigDecimal(6))); 
              registration.setNumberOfTheoryUnits(result.getDouble(7));
              registration.setNumberOfActionalUnits(result.getInt(8));
              registration.setFixShahriye(result.getBigDecimal(9));
              registration.setTheoryShahriye(result.getBigDecimal(11));
              registration.setActionalShahriye(result.getBigDecimal(10));
              registration.setOtherSalaryComment(result.getString(12));
              registration.setOtherShahriyAmount(result.getBigDecimal(13));
              registration.setTotalShahriye(result.getBigDecimal(14));
              registration.setOffAmount(result.getBigDecimal(15));
              registration.setOffComment(result.getString(16));
              registration.setBase(this.getBaseFromBaseId(result.getBigDecimal(17)));//
          }
            connection.close();
            return registration;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registration;
    }
    public Registration getRegistrationRegId(BigDecimal regId) {
        
        Registration registration =null; 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_registration where id = "+regId);
          
          if(result.next()) {
              registration = new Registration();
              registration.setId(result.getBigDecimal(1));
              registration.setRegDate(Utilty.convertDateSQLToUtil(result.getDate(2)));
              registration.setStudent(this.getStudentfromStCode(result.getBigDecimal("st_id")));
              registration.setField(this.getFieldFromFieldId(result.getBigDecimal(4)));
              registration.setTerm(this.getTermFromTermId(result.getBigDecimal("term_id")));
              registration.setLevel(this.getLevelFromLevelId(result.getBigDecimal(6))); 
              registration.setNumberOfTheoryUnits(result.getDouble(7));
              registration.setNumberOfActionalUnits(result.getInt(8));
              registration.setFixShahriye(result.getBigDecimal(9));
              registration.setTheoryShahriye(result.getBigDecimal(11));
              registration.setActionalShahriye(result.getBigDecimal(10));
              registration.setOtherSalaryComment(result.getString(12));
              registration.setOtherShahriyAmount(result.getBigDecimal(13));
              registration.setTotalShahriye(result.getBigDecimal(14));
              registration.setOffAmount(result.getBigDecimal(15));
              registration.setOffComment(result.getString(16));
              registration.setBase(this.getBaseFromBaseId(result.getBigDecimal(17)));//
          }
            connection.close();
            return registration;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registration;
    }
    
    public boolean deleteStudent(Student student) {
        //to do
        AccountManager am = new AccountManager();                                         
                                                 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
         statement.executeUpdate("delete from reg_student_account where st_id = "+student.getStudentCode());
         statement.executeUpdate("delete from reg_student where student_code = "+student.getStudentCode());
               
         //am.deletePayForAccount(paymentStep.getReceivementPaymentFinance());
          result =1; 
        } catch (SQLException e) {
                e.printStackTrace();
        }
                
        return false;
    }
    public ArrayList<Student> searchStudents(Boolean  isRegInCurrentTerm,Field field,Level level,Organization organization,StudentStatus studentStatus) {
         
        //if field ,level, organization,studentStatus is null returned all
        
        ArrayList<String> whereStrings = new ArrayList<String>();
        String whereClouse ="";
        if(field.getId().compareTo(new BigDecimal(-1))!=0 ) {
            if(isRegInCurrentTerm)
            whereStrings.add("field_id = "+field.getId());
        }
        if(level.getId().compareTo(new BigDecimal(-1))!=0) {
            if(isRegInCurrentTerm)
            whereStrings.add("level_id= "+level.getId());
        }
        if(organization.getId().compareTo(new BigDecimal(-1))!= 0 ) {
            whereStrings.add("org_unit_id = "+organization.getId());
        }
        if(studentStatus.getStatusId(). compareTo(new BigDecimal(-1))!=0) {
            whereStrings.add("status_id = "+studentStatus.getStatusId());
        }
        if(whereStrings.size()>0) {
            whereClouse = "where "+whereStrings.get(0);
            for(int i=1;i<whereStrings.size();i++) {
                whereClouse = whereClouse+ " and "+ whereStrings.get(i);    
            }
        }       
        ArrayList<Student> students = new ArrayList<Student>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
            ResultSet result;
          String sql;
          if(isRegInCurrentTerm) {
              if(whereStrings.size()>0) {
                  //there is where
                  whereClouse = whereClouse + " and reg_term_is_current=1";
                  sql = "select * from registration_view "+whereClouse;
                  result= statement.executeQuery("select * from registration_view "+whereClouse);   
              }
              else{
                  whereClouse ="where reg_term_is_current=1";
                  sql = "select * from registration_view "+whereClouse;
                  result= statement.executeQuery("select * from registration_view "+whereClouse);   
              }
                       }
          else  { //isRegInCurrentTerm ==2 = 3
              sql = "select * from student_view "+whereClouse;
              result = statement.executeQuery("select * from student_view "+whereClouse);
          }
          System.out.println("sql = "+sql);  
          Student student;
      //  this.writeToLog(new java.util.Date()+"****"+sql);
            
          while(result.next()) {
              student = new Student();
              student.setName(result.getString("name"));
              student.setFamily(result.getString("famili"));
              student.setStudentCode(result.getBigDecimal("student_code"));
              student.setStudentStatus(new StudentStatus(result.getBigDecimal("status_id"),result.getString("status_name")));
              student.setOrganization(new Organization(result.getBigDecimal("org_unit_id"),result.getString("org_name")));
              student.setLastLevel(new Level(result.getBigDecimal("level_id"),result.getString("level_name")));
              student.setLastField(new Field(result.getBigDecimal("field_id"),result.getString("field_name")));
              student.setNationalId(result.getString("national_code"));
              student.setIdentifierCode(result.getString("identifier_code"));
              student.setIdentifierSerial(result.getString("identifier_serial"));
              student.setIdentifierChar(result.getInt("identifier_char"));
              student.setFatherName(result.getString("father_name"));
              student.setDateOfBirth(Utilty.convertDateSQLToUtil(result.getDate("date_of_birth")));
              student.setDescription(result.getString("description"));
              student.setCreated_date(Utilty.convertDateSQLToUtil(result.getDate("created_date")));
              student.setLastModified(Utilty.convertDateSQLToUtil(result.getDate("last_modified")));
              student.setAddress(result.getString("address"));
              student.setMobile(result.getString("mobile"));
              student.setPhone(result.getString("phone"));
              student.setArchiveCode(result.getString("archive_code"));
              student.setDiplomMadrak(result.getString("diplom_madrak"));
              student.setPishMadrak(result.getString("pish_madrak"));
              students.add(student);
       //       System.out.println(result.getString(2));
          }
            connection.close();
            return students;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    public BigDecimal getCurrentAccounting (BigDecimal stId) {
           Student student = new Student();
           student.setStudentCode(stId);
          return this.getCurrentAccounting(student);
        }
    public BigDecimal getCurrentAccounting (Student student) {
           
           AccountManager am = new AccountManager();
           return am.getCurrentAccounting(this.getAccountFromStudent(student));
           //get students account from database and calculate accounts accounting
          
        }
    public void setPayForStudent(PaymentStep paymentStep) {
         AccountManager accountManager = new AccountManager();
         RecievementPayment recievementPayment = paymentStep.getReceivementPaymentFinance();
         recievementPayment =  accountManager.setPayForAccount(recievementPayment);
         
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("insert into reg_reg_payment(create_date,reg_id,finance_id,next_payment) values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
              pre.setDate(1, Utilty.convertDateUtilToSQL(paymentStep.getCreateDate()));
              pre.setBigDecimal(2,paymentStep.getRegistration().getId());
              pre.setBigDecimal(3, recievementPayment.getId());
              pre.setDate(4, Utilty.convertDateUtilToSQL(paymentStep.getNextPayment())); 
              pre.executeUpdate();
          } catch (SQLException e) {
              e.printStackTrace();
          }
    }
    public int deletePaymentStep(PaymentStep paymentStep) {
        AccountManager am = new AccountManager();
        
                                                 
                                                 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from reg_reg_payment where id = "+paymentStep.getPaymentStepId());
        
          am.deletePayForAccount(paymentStep.getReceivementPaymentFinance());
          result =1; 
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;
                      
    }
    public Registration registerStudent(Registration registration) {
        //register student in database
        Connection connection = TransactionManagement.getInstance().getConnection();
         //create new student
         //create new account in finanace and relationships
         try {
             PreparedStatement pre =  connection.prepareStatement("insert into reg_registration (reg_date,st_id,field_id,term_id,level_id,theory_units,actional_units,fix_salary,theory_salary,actional_salary,other_salary_comment,other_salary_amount,total_salary,off_amount,off_comment,base_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
             pre.setDate(1,Utilty.convertDateUtilToSQL(new java.util.Date()));
             pre.setBigDecimal(2, registration.getStudent().getStudentCode());
             pre.setBigDecimal(3, registration.getField().getId());
             pre.setBigDecimal(4, registration.getTerm().getId());
             pre.setBigDecimal(5, registration.getLevel().getId());
      //       System.out.println("theoryUnits is reg :"+registration.getNumberOfTheoryUnits());
             pre.setDouble(6, registration.getNumberOfTheoryUnits());
             pre.setInt(7, registration.getNumberOfActionalUnits());
             pre.setBigDecimal(8, registration.getFixShahriye());
             pre.setBigDecimal(9, registration.getTheoryShahriye());
             pre.setBigDecimal(10, registration.getActionalShahriye());
             pre.setString(11, registration.getOtherSalaryComment());
             pre.setBigDecimal(12, registration.getOtherShahriyAmount());
             pre.setBigDecimal(13, registration.getTotalShahriye());
             pre.setBigDecimal(14, registration.getOffAmount());
             pre.setString(15, registration.getOffComment());
             pre.setBigDecimal(16, registration.getBase().getId());
             pre.executeUpdate();
             
             ResultSet rs = pre.getGeneratedKeys();
             rs.next();
             registration.setId(rs.getBigDecimal(1));
             
             //create Factor
              Factor factor = new Factor();
              factor.setAccount(this.getAccountFromStudent(registration.getStudent()));
              factor.setCreateDate(new java.util.Date());
              //factor.setDescription(description);
              factor.setFactorType(new FactorType(new BigDecimal("1"),""));//set bigDecimal for hazine sabte naam 
              factor.setAmount(registration.getTotalShahriye().negate());
              
              AccountManager accountManager = new AccountManager();
              factor = accountManager.createFactor(factor);
            
              //create factor _ receiveable 
              
              PreparedStatement   pre1 =  connection.prepareStatement("insert into reg_receivable(finance_factor_id,create_date,reg_id) values(?,?,?)");
              pre1.setBigDecimal(1, factor.getId() );
              pre1.setDate(2, Utilty.convertDateUtilToSQL(new java.util.Date()));
              pre1.setBigDecimal(3,registration.getId() );
              pre1.executeUpdate();
             
              
              connection.close();
              
        return registration;
         } catch (SQLException e) {
             e.printStackTrace();
         }
        return registration;
        //update student field and level in database
        //call calculateRegistrationPrice and create finnace document 
    }
    
    public Registration editRegisterStudent(Registration registration) {
        //register student in database
        Connection connection = TransactionManagement.getInstance().getConnection();
         //create new student
         //create new account in finanace and relationships
         try {
             PreparedStatement pre =  connection.prepareStatement("update reg_registration set theory_units=?,actional_units=?,fix_salary=?,theory_salary=?,actional_salary=?,other_salary_comment=?,other_salary_amount=?,total_salary=?,off_amount=?,off_comment=?,field_id=?,level_id=?,base_id=? where id="+registration.getId());
             pre.setDouble(1, registration.getNumberOfTheoryUnits());
             
             pre.setInt(2, registration.getNumberOfActionalUnits());
             pre.setBigDecimal(3, registration.getFixShahriye());
             pre.setBigDecimal(4, registration.getTheoryShahriye());
             pre.setBigDecimal(5, registration.getActionalShahriye());
             pre.setString(6, registration.getOtherSalaryComment());
             pre.setBigDecimal(7, registration.getOtherShahriyAmount());
             pre.setBigDecimal(8, registration.getTotalShahriye());
             pre.setBigDecimal(9, registration.getOffAmount());
             pre.setString(10, registration.getOffComment());
             pre.setBigDecimal(11,registration.getField().getId());
             pre.setBigDecimal(12,registration.getLevel().getId());
             pre.setBigDecimal(13,registration.getBase().getId());
             pre.executeUpdate();
            
                                        
              //update Factor
              Factor factor = this.getFactorFromRegistrations(registration); 
              factor.setAmount(registration.getTotalShahriye().negate());
              
              AccountManager accountManager = new AccountManager();
              factor = accountManager.updateFactor(factor);
            
             
             connection.close();
        return registration;
         } catch (SQLException e) {
             e.printStackTrace();
         }
        return registration;
    }
    public Factor getFactorFromRegistrations(Registration registration) {       
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from register_factor_view where reg_id ="+registration.getId());
          Factor factor =null;
          if(result.next()) {
              factor= new Factor();
              Account account = new Account();
            //TODO 
              account.setId(result.getBigDecimal("account_person_id"));
              factor.setAccount(account);
              factor.setAmount(result.getBigDecimal("amount"));
              factor.setDescription(result.getString("description"));
              FactorType factorType = new FactorType(result.getBigDecimal("type_id"),"");
              factor.setFactorType(factorType);
              factor.setId(result.getBigDecimal("finance_factor_id"));
              factor.setCreateDate(result.getDate("create_date"));
          }
            connection.close();
            return factor;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<Field> getAllFields() {
        ArrayList<Field> fields = new ArrayList<Field>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_field where is_active=1");
          Field filed;
          while(result.next()) {
              filed= new Field();
              filed.setId(result.getBigDecimal(1));
              filed.setName(result.getString(2));
              filed.setIsActive(result.getBoolean(3));
              filed.setCode(result.getString(4));
              fields.add(filed);
           //   System.out.println(result.getString(2));
          }
            connection.close();
            return fields;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fields;
    }
    public ArrayList<Field> getFieldsForTransfor(Field field) {
        ArrayList<Field> fields = new ArrayList<Field>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_field where is_active=1 and id <> "+field.getId());
          Field filed;
          while(result.next()) {
              filed= new Field();
              filed.setId(result.getBigDecimal(1));
              filed.setName(result.getString(2));
              filed.setIsActive(result.getBoolean(3));
              filed.setCode(result.getString(4));
              fields.add(filed);
           //   System.out.println(result.getString(2));
          }
            connection.close();
            return fields;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fields;
    }
    public ArrayList<Level> getAllLevels() {
        ArrayList<Level> levels = new ArrayList<Level>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_level");
          Level level;
          while(result.next()) {
              level= new Level();
              level.setId(result.getBigDecimal(1));
              level.setName(result.getString(2));
              levels.add(level);
          //    System.out.println(result.getString(2));
          }
            connection.close();
            return levels;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return levels;
    }
    
    public ArrayList<Base> getAllbases() {
        ArrayList<Base> bases = new ArrayList<Base>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_base_level");
          Base base;
          while(result.next()) {
              base= new Base();
              base.setId(result.getBigDecimal(1));
              base.setName(result.getString(2));
              bases.add(base);
          //    System.out.println(result.getString(2));
          }
            connection.close();
            return bases;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bases;
    }
    
    public SalaryParam getSalaryParam(SalaryParam salaryParam) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_salary_param where term_id = "+salaryParam.getTerm().getId()+" and level_id = "+salaryParam.getLevel().getId());
        
          if(result.next()) {
              
              salaryParam.setFixSalary(result.getBigDecimal("fix_salary"));
              salaryParam.setActionSalary(result.getBigDecimal("action_salary"));
              salaryParam.setTheorySalary(result.getBigDecimal("theory_salary"));
              salaryParam.setUnitRate(result.getInt("ac_th_rate"));    
          }
            else {
              SalaryParam sp = new SalaryParam();
              sp.setTerm(salaryParam.getTerm());
              sp.setLevel(salaryParam.getLevel());
              salaryParam = sp;
          }
            connection.close();
            return salaryParam;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salaryParam; 
        
    }
    public void setSalaryParam(SalaryParam salaryParam) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_salary_param where term_id = "+salaryParam.getTerm().getId()+" and level_id = "+salaryParam.getLevel().getId());
          PreparedStatement pre;
          if(result.next()) {  
           //   System.out.println("update reg_salary_param set fix_salary=? ,action_salary=?,theory_salary=? where term_id =" +salaryParam.getTerm().getId()+" and level_id = "+salaryParam.getLevel().getId());
               pre = connection.prepareStatement("update reg_salary_param set fix_salary=? ,action_salary=?,theory_salary=? where term_id =" +salaryParam.getTerm().getId()+" and level_id = "+salaryParam.getLevel().getId());
              pre.setBigDecimal(1, salaryParam.getFixSalary());
              pre.setBigDecimal(2, salaryParam.getActionSalary());
              pre.setBigDecimal(3, salaryParam.getTheorySalary());
              pre.executeUpdate();
          }
            else {
              pre = connection.prepareStatement("insert into reg_salary_param(fix_salary,action_salary,theory_salary,term_id,level_id) values (?,?,?,?,?)");
              pre.setBigDecimal(1, salaryParam.getFixSalary());
              pre.setBigDecimal(2, salaryParam.getActionSalary());
              pre.setBigDecimal(3, salaryParam.getTheorySalary());
              pre.setBigDecimal(4, salaryParam.getTerm().getId());
              pre.setBigDecimal(5, salaryParam.getLevel().getId());
              pre.executeUpdate();
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
    public RegistrationCheck createRegistrationCheck(RegistrationCheck registrationCheck) {
        //create finance check for account of student in finance database
        //assign created check to registration
        AccountManager am = new AccountManager();
        registrationCheck.setCheck(am.createNewCheck(registrationCheck.getCheck()));
        
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("insert into reg_reg_check(create_date,reg_id,finance_check_id) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
              pre.setDate(1, Utilty.convertDateUtilToSQL(registrationCheck.getCreateDate()));
              pre.setBigDecimal(2, registrationCheck.getRegistartion().getId());
              pre.setBigDecimal(3, registrationCheck.getCheck().getId());
              
              pre.executeUpdate();
              ResultSet rs = pre.getGeneratedKeys();
              rs.next();
              registrationCheck.setId(rs.getBigDecimal(1));
         //     System.out.println("id = "+ rs.getBigDecimal(1));
              return registrationCheck;
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }
    public int deleteRegistrationCheck(RegistrationCheck registrationCheck){
     //TODO
        AccountManager am = new AccountManager();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
          statement = connection.createStatement();
          statement.executeUpdate("delete from reg_reg_check where id = "+registrationCheck.getId());
          am.deleteCheck(registrationCheck.getCheck());
          
          result =1; 
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;
        }
    
        public ArrayList<RegistrationCheck> getRegistrationChecks(Registration registration) {
        
        ArrayList<RegistrationCheck> registrationChecks = new ArrayList<RegistrationCheck>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_check_v where reg_id="+registration.getId());
       //   System.out.println("select * from reg_check_v where reg_id="+registration.getId());
          RegistrationCheck registrationCheck;
          Check check;
          Account account;
          AccountBank accountBank;  
          while(result.next()) {
              registrationCheck = new RegistrationCheck();
              registrationCheck.setRegistartion(registration);
              registrationCheck.setId(result.getBigDecimal("id"));
              registrationCheck.setCreateDate(Utilty.convertDateSQLToUtil(result.getDate("create_date")));
              check = new Check();
              
              check.setAmount(result.getBigDecimal("amount"));
              check.setBankBranch(result.getString("bank_branch"));
              check.setCheckDate(Utilty.convertDateSQLToUtil(result.getDate("check_date"))); 
              check.setCreatedDate(Utilty.convertDateSQLToUtil(result.getDate("created_date")));
              check.setDescription(result.getString("description"));
              check.setForHow(result.getString("for_how"));
              check.setId(result.getBigDecimal("finance_check_id"));
              check.setNumber(result.getString("number"));
              check.setBank(new Bank(result.getBigDecimal("bank_id"),result.getString("bank_name")));
              check.setCheckStatus(new CheckStatus(result.getBigDecimal("status_id"),result.getString("status_name")));
              account = new Account();
              account.setId(result.getBigDecimal("account_id"));
              account.setName(result.getString("account_name"));
              account.setCreate_date(Utilty.convertDateSQLToUtil(result.getDate("b_acc_create_date")));
              account.setFax(result.getString("fax"));
              account.setFisrtPayable(result.getBigDecimal("fisrt_payable"));
              account.setPersonMobile(result.getString("person_mobile"));
              account.setPersonName(result.getString("person_name"));
              account.setPhone(result.getString("phone"));
              account.setAddress(result.getString("address"));
              check.setAccount(account);
              
              accountBank = new AccountBank();
              accountBank.setName(result.getString("bank_account_name"));
              accountBank.setId(result.getBigDecimal("bank_account_id"));
              accountBank.setFirstAmount(result.getBigDecimal("first_amount"));
              accountBank.setIsCash(result.getBoolean("is_cash"));
              accountBank.setBank(new Bank(result.getBigDecimal("bank_account_b_id"),result.getString("bank_account_b_name")));
              check.setAccountBank(accountBank);
              registrationCheck.setCheck(check);
              registrationChecks.add(registrationCheck);
          }
            connection.close();
            return registrationChecks;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrationChecks;
    }
    public ArrayList<PaymentStep> getRegistrationPaymentSteps(Registration registration) {
        ArrayList<PaymentStep> paymentSteps = new ArrayList<PaymentStep>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_pay_rec_v where reg_id = "+registration.getId());
          PaymentStep paymentStep;
          RecievementPayment receivementPaymentFinance;   
          Account  account ;
          AccountBank accountBank ;
          while(result.next()) {
              paymentStep = new PaymentStep();
              paymentStep.setCreateDate(Utilty.convertDateSQLToUtil(result.getDate("reg_pay_date")));
              paymentStep.setNextPayment(Utilty.convertDateSQLToUtil(result.getDate("next_payment")));
              paymentStep.setPaymentStepId(result.getBigDecimal("id"));
              paymentStep.setRegistration(registration);
              receivementPaymentFinance = new RecievementPayment();
              
              account = new Account();
              account.setId(result.getBigDecimal("account_person_id"));
              account.setName(result.getString("account_name"));
              account.setCreate_date(Utilty.convertDateSQLToUtil(result.getDate("create_date")));
              account.setFax(result.getString("fax"));
              account.setFisrtPayable(result.getBigDecimal("fisrt_payable"));
              account.setPersonMobile(result.getString("person_mobile"));
              account.setPersonName(result.getString("person_name"));
              account.setPhone(result.getString("phone"));
              account.setAddress(result.getString("address"));
              receivementPaymentFinance.setAccount(account);
              
              
              accountBank = new AccountBank();
              accountBank.setName(result.getString("b_a_name"));
              accountBank.setId(result.getBigDecimal("account_bank_id"));
              accountBank.setFirstAmount(result.getBigDecimal("first_amount"));
              accountBank.setIsCash(result.getBoolean("is_cash"));
              accountBank.setBank(new Bank(result.getBigDecimal("bank_id"),result.getString("bank_name")));
              
              receivementPaymentFinance.setAccountBank(accountBank);
              receivementPaymentFinance.setAmount(result.getBigDecimal("amount"));
              receivementPaymentFinance.setCode(result.getString("code"));
              receivementPaymentFinance.setDescription(result.getString("description"));
              receivementPaymentFinance.setEventDate(Utilty.convertDateSQLToUtil(result.getDate("event_date")));
              receivementPaymentFinance.setId(result.getBigDecimal("finance_id"));
              receivementPaymentFinance.setRecievePayType(new RecievePayType(result.getBigDecimal("receive_pay_type_id"),result.getString("rec_pay_type_name")));
              
              paymentStep.setReceivementPaymentFinance(receivementPaymentFinance);
              
              paymentSteps.add(paymentStep);
          }
            connection.close();
            return paymentSteps;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentSteps;
    }
   
   public int deleteRegistration(Registration registraion) {
       //if registration has any checks or payments the deletion can not be complete
       
       //by deletion of registration, finance factor will be delete 
       if(this.getRegistrationChecks(registraion).size()!=0 
          ||
           this.getRegistrationPaymentSteps(registraion).size() !=0 ) {
        return 0;   
       }
       else {
           
           AccountManager am = new AccountManager();
           Factor factor = this.getFactorFromRegistrations(registraion);
           
           Connection connection = TransactionManagement.getInstance().getConnection();
           Statement statement;
           try {
            statement = connection.createStatement();
            
             statement.executeUpdate("delete from reg_receivable where finance_factor_id="+factor.getId()+" and reg_id="+registraion.getId()); 
             statement.executeUpdate("delete from reg_registration where id = "+registraion.getId());
             am.deleteFactor(factor);
           return 1;
           } catch (SQLException e) {
                   e.printStackTrace();
           }
           return -1;          
       }
       
       
   }
   public Student getStudentfromStCode(BigDecimal stCode) {
       
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
           ResultSet result;
         
             result = statement.executeQuery("select * from student_view  where student_code = "+stCode);
         
         Student student;
         if(result.next()) {
             student = new Student();
             student.setStudentCode(stCode);
             student.setName(result.getString("name"));
             student.setFamily(result.getString("famili"));
         //    student.setStudentCode(result.getBigDecimal("student_code"));
             student.setStudentStatus(new StudentStatus(result.getBigDecimal("status_id"),result.getString("status_name")));
             student.setOrganization(new Organization(result.getBigDecimal("org_unit_id"),result.getString("org_name")));
             student.setLastLevel(new Level(result.getBigDecimal("level_id_last"),result.getString("level_name")));
             student.setLastField(new Field(result.getBigDecimal("field_id_last"),result.getString("field_name")));
             student.setNationalId(result.getString("national_code"));
             student.setIdentifierCode(result.getString("identifier_code"));
             student.setIdentifierSerial(result.getString("identifier_serial"));
             student.setIdentifierChar(result.getInt("identifier_char"));
             student.setFatherName(result.getString("father_name"));
             student.setDateOfBirth(Utilty.convertDateSQLToUtil(result.getDate("date_of_birth")));
             student.setDescription(result.getString("description"));
             student.setCreated_date(Utilty.convertDateSQLToUtil(result.getDate("created_date")));
             student.setLastModified(Utilty.convertDateSQLToUtil(result.getDate("last_modified")));
             student.setAddress(result.getString("address"));
             student.setMobile(result.getString("mobile"));
             student.setPhone(result.getString("phone"));
             student.setArchiveCode(result.getString("archive_code"));
             student.setDiplomMadrak(result.getString("diplom_madrak"));
             student.setPishMadrak(result.getString("pish_madrak"));
         //    System.out.println(result.getString(2));
             
             return student;
         }
           connection.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
       
       return null;
      
           
   }
    public Student getStudentfromNationalCode(String nationalCode) {
        
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
            ResultSet result;
          
              result = statement.executeQuery("select * from student_view  where national_code = "+nationalCode);
          
          Student student;
          if(result.next()) {
              student = new Student();
              student.setStudentCode(result.getBigDecimal("student_code"));
              student.setName(result.getString("name"));
              student.setFamily(result.getString("famili"));
          //    student.setStudentCode(result.getBigDecimal("student_code"));
              student.setStudentStatus(new StudentStatus(result.getBigDecimal("status_id"),result.getString("status_name")));
              student.setOrganization(new Organization(result.getBigDecimal("org_unit_id"),result.getString("org_name")));
              student.setLastLevel(new Level(result.getBigDecimal("level_id_last"),result.getString("level_name")));
              student.setLastField(new Field(result.getBigDecimal("field_id_last"),result.getString("field_name")));
              student.setNationalId(nationalCode);
              student.setIdentifierCode(result.getString("identifier_code"));
              student.setIdentifierSerial(result.getString("identifier_serial"));
              student.setIdentifierChar(result.getInt("identifier_char"));
              student.setFatherName(result.getString("father_name"));
              student.setDateOfBirth(Utilty.convertDateSQLToUtil(result.getDate("date_of_birth")));
              student.setDescription(result.getString("description"));
              student.setCreated_date(Utilty.convertDateSQLToUtil(result.getDate("created_date")));
              student.setLastModified(Utilty.convertDateSQLToUtil(result.getDate("last_modified")));
              student.setAddress(result.getString("address"));
              student.setMobile(result.getString("mobile"));
              student.setPhone(result.getString("phone"));
              student.setArchiveCode(result.getString("archive_code"));
              student.setDiplomMadrak(result.getString("diplom_madrak"));
              student.setPishMadrak(result.getString("pish_madrak"));
            
          //    System.out.println(result.getString(2));
              
              return student;
          }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
       
            
    }
   
   public Field getFieldFromFieldId(BigDecimal fieldId) {
       Field field = new Field();
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select * from reg_field where id = "+fieldId);
        
        if(result.next()) {
             field = new Field();
             field.setId(result.getBigDecimal(1));
             field.setName(result.getString(2));       
         }
           connection.close();
           return field;
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return field;
   }
   public Term getTermFromTermId(BigDecimal termId) {
       Term term = new Term();
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select * from reg_term where id = "+termId);
         
        if(result.next()) {
            //TODO if from and to date is null do'nt set
             term = new Term();
             term.setId(result.getBigDecimal(1));
             term.setName(result.getString(2));  
             term.setFromDate(Utilty.convertDateSQLToUtil( result.getDate(3)));
             term.setToDate(Utilty.convertDateSQLToUtil(result.getDate(4)));
             term.setIsCurrent(result.getBoolean(5));
             term.setYear(result.getInt(6));
             term.setDore(result.getInt(7));
         }
           connection.close();
           return term;
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return term;
   }
    public Base getBaseFromBaseId(BigDecimal baseId) {
        Base base = new Base();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_base_level where base_id = "+baseId);
          
         if(result.next()) {
             //TODO if from and to date is null do'nt set
              base = new Base();
              base.setId(result.getBigDecimal(1));
              base.setName(result.getString(2));  
                        }
            connection.close();
            return base;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return base;
    }
  
    public ArrayList<Term> getAllTerms() {
        ArrayList<Term> terms = new ArrayList<Term>();
        Term term ;
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_term ");
          
         while(result.next()) {
             //TODO if from and to date is null do'nt set
              term = new Term();
              term.setId(result.getBigDecimal(1));
              term.setName(result.getString(2));  
              term.setFromDate(Utilty.convertDateSQLToUtil( result.getDate(3)));
              term.setToDate(Utilty.convertDateSQLToUtil(result.getDate(4)));
              term.setIsCurrent(result.getBoolean(5));
              
              term.setYear(result.getInt(6));
              term.setDore(result.getInt(7));
              terms.add(term);
          }
            connection.close();
            return terms;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return terms;
    }
   public Level getLevelFromLevelId(BigDecimal levelId) {
       Level level = new Level();
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select * from reg_level where id = "+levelId);
         
        if(result.next()) {
             level = new Level();
             level.setId(result.getBigDecimal(1));
             level.setName(result.getString(2));  
            
         }
           connection.close();
           return level;
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return level;
   }
   public Account getAccountFromStudent(Student student) {
       Account account = new Account();
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select * from account_student_view  where st_id = "+student.getStudentCode());      
         if(result.next()) {
             account = new Account();
             account.setId(result.getBigDecimal("acc_id"));
             account.setName(result.getString("name"));
             account.setPersonName(result.getString("person_name"));
             account.setPersonMobile(result.getString("person_mobile"));
             account.setPhone(result.getString("phone"));
             account.setAddress(result.getString("address"));
             account.setCreate_date(Utilty.convertDateSQLToUtil(result.getDate("acc_create_date")));
             account.setFax(result.getString("fax"));
             account.setFisrtPayable(result.getBigDecimal("fisrt_payable"));
         }
           connection.close();
           return account;
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return account;
   }
   public boolean isStudentRegister(Student student) {
      boolean returnStatus = false;
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select * from st_current_term_v  where student_code = "+student.getStudentCode());      
         if(result.next()) {
             returnStatus = true;
         }
           connection.close();
           
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return returnStatus;
   }
   public Term getCurrentTerm() {
       Term term =null ;
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_term  where is_current= "+1);      
          if(result.next()) {
              term = new Term(result.getBigDecimal(1),result.getString(2), Utilty.convertDateSQLToUtil( result.getDate(3)),Utilty.convertDateSQLToUtil( result.getDate(4)),result.getInt(6),result.getInt(7));
                       }
            connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return term;
   }
   
   public BigDecimal getStudentAccoutingInRegistration(BigDecimal regId)
   {
       Registration r = new Registration();
       r.setId(regId);
    
       return this.getStudentAccoutingInRegistration(r);
     }
   
   public BigDecimal getStudentAccoutingInRegistration(Registration registration) {
       //sum of the checks without retured
       //sum of the payments
       registration.getTotalShahriye();
       
       BigDecimal totalReceivePayAmount = new BigDecimal("0");
       BigDecimal totalWaitingChecksAmount = new BigDecimal("0");
       BigDecimal totalAccounting = new BigDecimal("0");
       BigDecimal totalAccountingAll = new BigDecimal("0");
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
           statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("SELECT Sum(amount) as all_amount FROM reg_check_v WHERE reg_id = "+registration.getId()+" AND status_id <> '1'");
         if(result.next()) {
             if(result.getBigDecimal(1)!=null)      
             totalWaitingChecksAmount = result.getBigDecimal(1);
       
         }
         result=  statement.executeQuery("SELECT Sum(amount) AS all_amount FROM reg_pay_rec_v WHERE reg_id =  "+registration.getId());  
       System.out.println("sql ====="+"SELECT Sum(amount) AS all_amount FROM reg_pay_rec_v WHERE reg_id =  "+registration.getId());
         if(result.next()) {
              if(result.getBigDecimal(1)!=null)
               totalReceivePayAmount = result.getBigDecimal(1);
          }
           //only return checks
           System.out.println("next row"+totalReceivePayAmount);
         totalAccounting =totalAccounting.add(totalReceivePayAmount);
         totalAccounting =totalAccounting.add(totalWaitingChecksAmount); 
         System.out.println("next row2 "+totalAccounting);
         
         
        result=  statement.executeQuery("SELECT total_salary FROM reg_registration WHERE id =  "+registration.getId()); 
        if(result.next()) {
               if(result.getBigDecimal(1)!=null)      
               totalAccountingAll = result.getBigDecimal(1);
           
           } 
        
        totalAccounting =totalAccounting.subtract(totalAccountingAll);
           
           System.out.println("next row3 "+totalAccounting);
         System.out.println("totalAccunting = "+totalAccounting);
         
         
           connection.close();
         return totalAccounting;
           
       } catch (SQLException e) {
           System.out.println("there is an error");
           e.printStackTrace();
      
       }
       return totalAccounting;
   }
   public BigDecimal getStudentPaymentsInRegistration(Registration registration) {
        //sum of the checks without retured
        //sum of the payments
        registration.getTotalShahriye();
        
        BigDecimal totalReceivePayAmount = new BigDecimal("0");
        BigDecimal totalWaitingChecksAmount = new BigDecimal("0");
        BigDecimal totalAccounting = new BigDecimal("0");
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("SELECT Sum(amount) as all_amount FROM reg_check_v WHERE reg_id = "+registration.getId()+" AND status_id <> '1'");
          if(result.next()) {
              if(result.getBigDecimal(1)!=null)      
              totalWaitingChecksAmount = result.getBigDecimal(1);
          }
          result=  statement.executeQuery("SELECT Sum(amount) AS all_amount FROM reg_pay_rec_v WHERE reg_id =  "+registration.getId());  
          if(result.next()) {
               if(result.getBigDecimal(1)!=null)
                totalReceivePayAmount = result.getBigDecimal(1);
           }
            //only return checks
          
           connection.close();

          
          totalAccounting =totalAccounting.add(totalReceivePayAmount);
          totalAccounting =totalAccounting.add(totalWaitingChecksAmount); 
          
       
         
          return totalAccounting;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalAccounting;
    }
   public BigDecimal getCountOfTodayRegistrations() {
       BigDecimal count = new BigDecimal(0);
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       try {
         statement = connection.createStatement();
         ResultSet result=  statement.executeQuery("select  count( id) from   reg_registration where reg_registration.reg_date = CURDATE()");
         
        if(result.next()) {
            count = result.getBigDecimal(1);
         }
           connection.close();
          
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return count;
   }
    public BigDecimal getCountOfTermRegistrations(Term term) {
        BigDecimal count = new BigDecimal(0);
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select  count( id) from   reg_registration where term_id ="+term.getId());
          
         if(result.next()) {
             count = result.getBigDecimal(1);
          }
            connection.close();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public BigDecimal getCountOfCurrentTermRegistrations() {
        
        BigDecimal count = new BigDecimal(0);
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select  count( id) from   reg_registration where term_id ="+this.getCurrentTerm().getId());
          
         if(result.next()) {
             count = result.getBigDecimal(1);
          }
            connection.close();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public BigDecimal getCountOfActiveStudents() {
        
        BigDecimal count = new BigDecimal(0);
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select count(student_code)  from reg_student where reg_student.status_id = 1");
          
         if(result.next()) {
             count = result.getBigDecimal(1);
          }
            connection.close();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public BigDecimal getCountOfAllStudents() {
        
        BigDecimal count = new BigDecimal(0);
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select count(student_code)  from reg_student ");
          
         if(result.next()) {
             count = result.getBigDecimal(1);
          }
            connection.close();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
   public Term createTerm(Term term) {
       
        Connection connection = TransactionManagement.getInstance().getConnection();
        PreparedStatement statement;
        try {
          if(term.getIsCurrent())
          {
          statement = connection.prepareStatement("update reg_term set is_current = 0",Statement.RETURN_GENERATED_KEYS);
          statement.executeUpdate();
          } 
          if(term.getId() == null)
          {
          statement = connection.prepareStatement("insert into reg_term (name,from_date,to_date,is_current,year,dore) values(?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);   
          statement.setString(1, term.getName());
          statement.setDate(2, Utilty.convertDateUtilToSQL(term.getFromDate()));
          statement.setDate(3, Utilty.convertDateUtilToSQL(term.getToDate()));
          statement.setBoolean(4, term.getIsCurrent()); 
          statement.setInt(5, term.getYear());
          statement.setInt(6, term.getDore());
          statement.executeUpdate();
          ResultSet rs = statement.getGeneratedKeys();
          rs.next();
          term.setId(rs.getBigDecimal(1));
          }else {
              statement = connection.prepareStatement("insert into reg_term (id,name,from_date,to_date,is_current,year,dore) values(?,?,?,?,?,?,?)");   
              statement.setBigDecimal(1, term.getId());
              statement.setString(2, term.getName());
              statement.setDate(3, Utilty.convertDateUtilToSQL(term.getFromDate()));
              statement.setDate(4, Utilty.convertDateUtilToSQL(term.getToDate()));
              statement.setBoolean(5, term.getIsCurrent());  
              statement.setInt(6, term.getYear());
              statement.setInt(7, term.getDore());
              statement.executeUpdate();
                    }
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return term;
   }
   public Term updateTerm(Term term) {
       Connection connection = TransactionManagement.getInstance().getConnection();
       PreparedStatement statement;
       try {
         if(term.getIsCurrent())
         {
         statement = connection.prepareStatement("update reg_term set is_current = 0",Statement.RETURN_GENERATED_KEYS);
         statement.executeUpdate();
         } 
         statement = connection.prepareStatement("update reg_term set name =? ,from_date =?, to_date=? ,is_current=? ,year=? , dore=? where id = "+term.getId(),Statement.RETURN_GENERATED_KEYS);   
         statement.setString(1, term.getName());
         statement.setDate(2, Utilty.convertDateUtilToSQL(term.getFromDate()));
         statement.setDate(3, Utilty.convertDateUtilToSQL(term.getToDate()));
         statement.setBoolean(4, term.getIsCurrent());  
           statement.setInt(5, term.getYear());
           statement.setInt(6, term.getDore());
         statement.executeUpdate();
        // ResultSet rs = statement.getGeneratedKeys();
        // rs.next();
        // term.setId(rs.getBigDecimal(1));  
         connection.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return term;
   }
   public int delete(Term term) {
       Connection connection = TransactionManagement.getInstance().getConnection();
       Statement statement;
       int result=0;
       try {
        statement = connection.createStatement();
         statement.executeUpdate("delete from reg_term where id = "+term.getId());
         result =1; 
       } catch (SQLException e) {
               e.printStackTrace();
       }
       return result;
   }
   public void editOrganization(Organization organization) {
       Connection connection = TransactionManagement.getInstance().getConnection();
       PreparedStatement statement;
       try {
         
         statement = connection.prepareStatement("update reg_organization set name =?  where id = "+organization.getId());   
         statement.setString(1, organization.getName());
         statement.executeUpdate();
        // ResultSet rs = statement.getGeneratedKeys();
        // rs.next();
        // term.setId(rs.getBigDecimal(1));  
         connection.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
   }
    public Organization createOrganization(Organization organization) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        PreparedStatement statement;
        try {
          
          statement = connection.prepareStatement("insert into reg_organization (name) values(?)",Statement.RETURN_GENERATED_KEYS);   
          statement.setString(1, organization.getName());
          statement.executeUpdate();
          ResultSet rs = statement.getGeneratedKeys();
          rs.next();
          organization.setId(rs.getBigDecimal(1));
              connection.close();
          
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return organization;
    }
   public void setArray(ArrayList<Student> students) {
   }
   public void testObject(Field field) {
   }
   public void writeToLog(String stream) {
               try {
                       BufferedWriter 
                       out = new BufferedWriter(new FileWriter
                       ("c://payameno.txt",true));
                       out.write(stream);
                        out.newLine();
                       out.close();
                       BufferedReader in = new BufferedReader
                       (new FileReader("c://payameno.txt"));
                       String str;
                       while ((str = in.readLine()) != null) {
                          System.out.println(str);
                       }
                    } catch (IOException e) {
                   e.printStackTrace();
        }

    }
    public ArrayList<School> getAllSchool() {
        ArrayList<School> schools = new ArrayList<School>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_school");
          School school;
          while(result.next()) {
              school = new School();
              school.setId(result.getBigDecimal("school_id"));
              school.setDbName(result.getString("school_db_name"));
              school.setDbService(result.getString("school_db_service"));
              school.setDescription(result.getString("school_description"));
              school.setHost(result.getString("school_host"));
              schools.add(school);
        //      System.out.println(result.getString(2));
          
          }
            connection.close();
            return schools;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schools;
    }
    public School createSchool(School school) {
        School schoolRet =null;
        Connection connection = TransactionManagement.getInstance().getConnection();
        PreparedStatement statement;
        try {
          
          statement = connection.prepareStatement("insert into reg_school (school_id,school_description,school_db_service,school_db_name,school_host) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);   
          statement.setBigDecimal(1, school.getId());
            statement.setString(2,school.getDescription());
            statement.setString(3, school.getDbService());
            statement.setString(4, school.getDbName());
            statement.setString(5, school.getHost());
          statement.executeUpdate();
            schoolRet = school; 
              connection.close();
          
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
       return schoolRet;
    }
    public int deleteSchool(School school) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from reg_school where school_id = "+school.getId());
          result =1; 
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;
    }
    public School updateSchool(School school) {
        School schoolRet =null;
        Connection connection = TransactionManagement.getInstance().getConnection();
        PreparedStatement statement;
        try {
          statement = connection.prepareStatement("update reg_school set school_description =? ,school_db_service =?, school_db_name=? ,school_host=?  where school_id = "+school.getId(),Statement.RETURN_GENERATED_KEYS);   
              statement.setString(1,school.getDescription());
              statement.setString(2, school.getDbService());
              statement.setString(3, school.getDbName());
              statement.setString(4, school.getHost());
          statement.executeUpdate();
         // ResultSet rs = statement.getGeneratedKeys();
         // rs.next();
         // term.setId(rs.getBigDecimal(1));  
          connection.close();
            schoolRet = school;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schoolRet;
    }
    public ArrayList<Student> getNoPicsStudents(School school,Term term) {
        ArrayList<Student> noPicStudents = new ArrayList<Student>();
        Student student;
     Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
     try{
        Statement createStatement = con.createStatement();
        ResultSet result=
         createStatement.executeQuery("SELECT     Students.StudentCode, Students.FirstName, Students.LastName, Students.FatherName,Students.NationalCode, Histories.Timeyear, Histories.TimeDore, \n" + 
         "                      CONVERT(VARCHAR(50), Students.StudentCode) + '_' + Students.FirstName + '_' + Students.LastName AS FULLName\n" + 
         "FROM         Students INNER JOIN\n" + 
         "                      Histories ON Students.StudentCode = Histories.StudentCode\n" + 
         "WHERE     (Students.StudentCode NOT IN\n" + 
         "                          (SELECT     StudentCode\n" + 
         "                             FROM         StudentPhotos)) AND (Histories.Timeyear =  "+term.getYear()+") AND (Histories.TimeDore = "+term.getDore()+") AND (Students.StudentCode IN\n" + 
         "                          (SELECT     StudentCode\n" + 
         "                             FROM         CourseScores\n" + 
         "                             WHERE     (TimeYear = "+term.getYear()+") AND (TimeDore = "+term.getDore()+")))\n" + 
         "ORDER BY Students.LastName");
        Student maliStudent;
        while(result.next()) {
            student = new Student();
            student.setStudentCode(result.getBigDecimal("StudentCode"));
            student.setFamily(result.getString("LastName"));
            student.setName(result.getString("FirstName"));
            student.setNationalId(result.getString("NationalCode"));
            maliStudent =this.getStudentfromStCode(student.getStudentCode()); 
            if(maliStudent!=null) {
                student.setMobile(maliStudent.getMobile());
              //  student.setOrganization(maliStudent.getOrganization());
            }
            //getDataFromStudent
            
            noPicStudents.add(student);
        System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
         
                   
             
      //  String name = String.valueOf(result.getBigDecimal("StudentCode"));
               }
      
         con.close();
     }
         catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
        return noPicStudents;
    }
    public Boolean hasStudentPic(Student student) {
        Boolean hasPic = false;
        Connection con =  TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = con.createStatement();
            ResultSet result = statement.executeQuery("select * from reg_student_image where st_code = "+student.getStudentCode()); 
            if(result.next()) {
                hasPic = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hasPic;
    }
    public void  transferPicsStudents(School school) {  
        Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        Connection con2 =  TransactionManagement.getInstance().getConnection();
        try{
        Statement createStatement = con.createStatement();
        ResultSet result=createStatement.executeQuery("SELECT * from StudentPhotos ");
        PreparedStatement statement;    
        Student maliStudent;
        while(result.next()) {
            System.out.println("StudentCode = "+result.getBigDecimal("StudentCode"));
            maliStudent =this.getStudentfromStCode(result.getBigDecimal("StudentCode")); 
            if(maliStudent!=null) {
                            if(!this.hasStudentPic(maliStudent))
              {          
                     //  student.setMobile(maliStudent.getMobile());
              //  student.setOrganization(maliStudent.getOrganization());
              statement = con2.prepareStatement("insert into reg_student_image(st_code,st_image) values(?,?)",Statement.RETURN_GENERATED_KEYS);
              statement.setBigDecimal(1,maliStudent.getStudentCode());
              statement.setBlob(2, result.getBlob("StudentPhoto"));
              statement.executeUpdate();
            //    System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
              } 
            }
            //getDataFromStudent
            con.close();  
                   //  String name = String.valueOf(result.getBigDecimal("StudentCode"));
               }
         con2.close();
     }
         catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
    }
    
    public int createDanaStudent(School school,DanaStudent danaStudent) {
        Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        PreparedStatement statement;
       int returned =-1;
        try {
         statement = con.prepareStatement("insert into Students (StudentCode,FirstName,LastName,NationalCode,FatherName,IDno,IssuePlace,BirthDate,Nationality,Religion,BirthPlace,Sex,Telephone,StudentType,IsTransfered,StudentState,SchoolCode,SeriID,SerialID,RadifID) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            
          statement.setBigDecimal(1, danaStudent.getStudentCode());
          statement.setString(2, danaStudent.getFirstName());
          statement.setString(3, danaStudent.getLastName());
          statement.setBigDecimal(4,danaStudent.getNactionalCode());
          statement.setString(5, danaStudent.getFatherName());
          statement.setString(6, danaStudent.getIDno()); 
          statement.setString(7,danaStudent.getIssuePlace());
          statement.setInt(8, danaStudent.getBirthDate());
          statement.setInt(9, 1);  
          statement.setInt(10, 1); 
          statement.setString(11, danaStudent.getBirthPalce());
          statement.setInt(12, danaStudent.getSex());
          statement.setString(13, danaStudent.getTelephone());
          statement.setInt(14,1);
          statement.setInt(15, 1);
          statement.setInt(16, 1);
          statement.setInt(17, school.getId().toBigInteger().intValue()); 
          statement.setInt(18, danaStudent.getSeriId()); 
          statement.setInt(19, danaStudent.getSerialId()); 
          statement.setInt(20, danaStudent.getRadifId()); 
          statement.executeUpdate();
          con.close();
          returned =1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
                return returned;
    }
    public ArrayList<DanaRegisterStudent>  getDanaRegisteredStudents(School school,Term term) {
          ArrayList<DanaRegisterStudent> danaRegisteredStudents = new ArrayList<DanaRegisterStudent>();
         DanaRegisterStudent danaRegisterStudent;
         Connection conSql=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        
         //step1 : insert into access db , registerd students in term in school dana
         //step2 : insert into access db , entekhab vahed in term in school dana
         //step3 : download  student images
         //step4: create a packaged zip file and return 
                  
        
         //step1 : insert into access db , registerd students in term in school dana
          Statement sqlStatement;
          

        try {
            sqlStatement = conSql.createStatement();
            
         ResultSet result=   sqlStatement.executeQuery("SELECT     Students.StudentCode , Students.FirstName, Students.LastName, Students.FatherName,Students.NationalCode,Students.IDno,Students.IssuePlace,Students.BirthDate,Students.BirthPlace,Students.Sex,Students.Telephone,Students.SeriID,Students.SerialID,Students.RadifID,Students.Address, Histories.Timeyear , \n" + 
            "                      Histories.TimeDore , Histories.MajorCode, Majors.Name, 'img/' + CONVERT(VARCHAR(50), Students.StudentCode) \n" + 
            "                      + '.jpg' AS image_name\n" + 
            "FROM         Students INNER JOIN\n" + 
            "                      Histories ON Students.StudentCode = Histories.StudentCode INNER JOIN\n" + 
            "                      Majors ON Histories.MajorCode = Majors.MajorCode\n" + 
            "WHERE     (Histories.Timeyear = "+term.getYear()+") AND (Histories.TimeDore = "+term.getDore()+")\n" + 
            "ORDER BY Students.LastName");
            while(result.next()) {
                        //        accessStatement = conAccess.prepareStatement("insert into register_students(st_code,st_name,st_family,father_name,year,term,major_code,major_name,image_name) values (?,?,?,?,?,?,?,?,?)");
                danaRegisterStudent = new DanaRegisterStudent();
                System.out.println(result.getBigDecimal("StudentCode"));
                System.out.println(result.getString("LastName"));
                                danaRegisterStudent.setStudentCode(result.getBigDecimal("StudentCode"));
                                danaRegisterStudent.setFirstName(result.getString("FirstName") );
                                danaRegisterStudent.setLastName(result.getString( "LastName"));
                                danaRegisterStudent.setFatherName(result.getString( "FatherName"));
                                danaRegisterStudent.setTimeyear(result.getString( "Timeyear"));
                                danaRegisterStudent.setTimeDore(result.getString( "TimeDore"));
                                danaRegisterStudent.setMajorCode( result.getInt("MajorCode"));
                                danaRegisterStudent.setMajorName(result.getString( "Name"));
                                danaRegisterStudent.setImageName(result.getString( "image_name"));
                                danaRegisterStudent.setNactionalCode(result.getBigDecimal("NationalCode"));
                                danaRegisterStudent.setIDno(result.getString("IDno"));
                                danaRegisterStudent.setIssuePlace(result.getString("IssuePlace"));
                                danaRegisterStudent.setBirthDate(result.getInt("BirthDate"));
                                danaRegisterStudent.setBirthPlace(result.getString("BirthPlace"));
                                danaRegisterStudent.setSex(result.getInt("Sex"));
                                danaRegisterStudent.setAddress(result.getString("Address"));
                                danaRegisterStudent.setTelephone(result.getString("Telephone"));
                                danaRegisterStudent.setSerialId(result.getInt("SerialID"));
                                danaRegisterStudent.setRadifId(result.getInt("RadifID"));
                                danaRegisterStudent.setSeriId(result.getInt("SeriID"));
                             
                                danaRegisteredStudents.add(danaRegisterStudent); 
                
                            }
            conSql.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danaRegisteredStudents;
                             }
    
    public ArrayList<DanaRegUnit>  getDanaRegUnits(School school,Term term) {
          ArrayList<DanaRegUnit> danaRegUnits = new ArrayList<DanaRegUnit>();
         DanaRegUnit danaRegUnit;
         Connection conSql=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        
         
         //step1 : insert into access db , registerd students in term in school dana
         //step2 : insert into access db , entekhab vahed in term in school dana
         //step3 : download  student images
         //step4: create a packaged zip file and return 
                  
        
         //step1 : insert into access db , registerd students in term in school dana
          Statement sqlStatement;
          

        try {
            sqlStatement = conSql.createStatement();
            
         ResultSet result=   sqlStatement.executeQuery("SELECT     CourseScores.StudentCode, CourseScores.CourseCode, CourseScores.TimeDore, CourseScores.TimeYear, CourseScores.SchoolCode\n" + 
         "FROM         CourseScores INNER JOIN\n" + 
         "                      Courses ON CourseScores.CourseCode = Courses.CourseCode\n" + 
         "WHERE     (CourseScores.TimeDore = "+term.getDore()+") AND (CourseScores.TimeYear = "+term.getYear()+")\n" + 
         "ORDER BY CourseScores.StudentCode");
            while(result.next()) {
                        //        accessStatement = conAccess.prepareStatement("insert into register_students(st_code,st_name,st_family,father_name,year,term,major_code,major_name,image_name) values (?,?,?,?,?,?,?,?,?)");
                danaRegUnit = new DanaRegUnit();
                System.out.println(result.getBigDecimal("StudentCode"));
                System.out.println(result.getBigDecimal("CourseCode"));
                                danaRegUnit.setStCod(result.getBigDecimal("StudentCode"));
                                danaRegUnit.setCourseCode(result.getBigDecimal("CourseCode") );
                                danaRegUnit.setYear(result.getInt( "TimeYear"));
                                danaRegUnit.setTerm(result.getInt( "TimeDore"));
                                danaRegUnit.setSchoolCode(result.getBigDecimal( "SchoolCode"));
                                danaRegUnits.add(danaRegUnit);           
                            }
            conSql.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danaRegUnits;
                             }
    public ArrayList<Student> getDanaUnGraguatedStudents(School school) {
        ArrayList<Student> noPicStudents = new ArrayList<Student>();
        Student student;
     Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
     try{
        Statement createStatement = con.createStatement();
        ResultSet result=
         createStatement.executeQuery("SELECT     CourseCode, Name, Units\n" + 
         "FROM         Courses\n" + 
         "WHERE     (CourseCode IN\n" + 
         "                          (SELECT     CourseCode\n" + 
         "                             FROM         CourseScores\n" + 
         "                             WHERE     (TimeYear = 94) AND (TimeDore = 4)))\n");
         
         
         
      ArrayList<Student> allStudentsInDb = this.searchStudents(false, new Field(new BigDecimal(-1),""), new Level(new BigDecimal(-1),""), new Organization(new BigDecimal(-1),""), new StudentStatus(new BigDecimal(-1),""));  
      System.out.println("allStudents count = "+allStudentsInDb.size());
      Map<String,Student> studentsMap = new HashMap<String,Student>();
     for(int i=0;i<allStudentsInDb.size();i++) {
         studentsMap.put(allStudentsInDb.get(i).getNationalId(),allStudentsInDb.get(i));
     }
        Student maliStudent;
        while(result.next()) {
            student = new Student();
            student.setStudentCode(result.getBigDecimal("StudentCode"));
            student.setFamily(result.getString("LastName"));
            student.setName(result.getString("FirstName"));
           student.setNationalId(result.getString("NationalCode"));
           // maliStudent =this.getStudentfromNationalCode(student.getNationalId()); 
           maliStudent= studentsMap.get(student.getNationalId()); 
            if(maliStudent!=null) {
                student.setMobile(maliStudent.getMobile());
                student.setStudentStatus(maliStudent.getStudentStatus());
                student.setFatherName(maliStudent.getFatherName());
                student.setOrganization(maliStudent.getOrganization());
              //  student.setOrganization(maliStudent.getOrganization());
            }
            //getDataFromStudent
            
            noPicStudents.add(student);
        System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
         
                   
             
      //  String name = String.valueOf(result.getBigDecimal("StudentCode"));
               }
      
         con.close();
     }
         catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
        return noPicStudents;
    }
    public ArrayList<DanaCourseExam>  getDanaExamCourse(School school,Term term) {
          ArrayList<DanaCourseExam> danaCourseExamList = new ArrayList<DanaCourseExam>();
         DanaCourseExam danaCourseExam;
         Connection conSql=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        
         
         //step1 : insert into access db , registerd students in term in school dana
         //step2 : insert into access db , entekhab vahed in term in school dana
         //step3 : download  student images
         //step4: create a packaged zip file and return 
                  
        
         //step1 : insert into access db , registerd students in term in school dana
          Statement sqlStatement;
          

        try {
            sqlStatement = conSql.createStatement();
            
         ResultSet result=   sqlStatement.executeQuery("SELECT     CourseCode, Name, Units\n" + 
         "FROM         Courses \n" + 
         "                      where CourseCode IN (select CourseCode from CourseScores \n" + 
         "WHERE     (CourseScores.TimeDore = "+term.getDore()+") AND (CourseScores.TimeYear = "+term.getYear()+"))" );
            while(result.next()) {
                        //        accessStatement = conAccess.prepareStatement("insert into register_students(st_code,st_name,st_family,father_name,year,term,major_code,major_name,image_name) values (?,?,?,?,?,?,?,?,?)");
                danaCourseExam = new DanaCourseExam();
                //System.out.println(result.getBigDecimal("StudentCode"));
                System.out.println(result.getBigDecimal("CourseCode"));
                                danaCourseExam.setCourseCode(result.getBigDecimal("CourseCode"));
                                danaCourseExam.setCourseName(result.getString("Name"));
                                danaCourseExam.setCourseUint(result.getInt("Units"));
                               // danaRegUnit.setStCod(result.getBigDecimal("StudentCode"));
                               // danaRegUnit.setCourseCode(result.getBigDecimal("CourseCode") );
                               // danaRegUnit.setYear(result.getInt( "TimeYear"));
                                //danaRegUnit.setTerm(result.getInt( "TimeDore"));
                              //  danaRegUnit.setSchoolCode(result.getBigDecimal( "SchoolCode"));
                              //  danaRegUnits.add(danaRegUnit);           
                              danaCourseExamList.add(danaCourseExam);            
                            }
            conSql.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danaCourseExamList;
                             }
    
    
    public void downloadPicsStudents(School school,Term term,String path) {
       
     Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
     try{
        Statement createStatement = con.createStatement();
        
         ResultSet result=     createStatement.executeQuery("SELECT     Students.StudentCode, Students.FirstName, Students.LastName, Students.NationalCode, Students.FatherName, Students.IDno, Students.SchoolCode, \n" + 
              "                      StudentPhotos.StudentPhoto\n" + 
              "FROM         StudentPhotos  JOIN\n" + 
              "                      Students ON StudentPhotos.StudentCode = Students.StudentCode");
         while(result.next()) {
         //           System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
             String name = String.valueOf(result.getBigDecimal("StudentCode"));
             Blob blob = result.getBlob("StudentPhoto");
                    writeToFile(blob,name,path);
         }
        
         con.close();
     }
         catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
        
    }
    public void downloadPicsStudents(Term term,String path) {
       
     Connection con=    TransactionManagement.getInstance().getConnection();
     try{
        Statement createStatement = con.createStatement();
        
         ResultSet result=     createStatement.executeQuery("SELECT DISTINCT\n" + 
         "	reg_student_image.st_code, \n" + 
         "	reg_student_image.st_image, \n" + 
         "	reg_registration.term_id\n" + 
         "FROM\n" + 
         "	reg_student_image\n" + 
         "	INNER JOIN\n" + 
         "	reg_registration\n" + 
         "	ON \n" + 
         "		reg_student_image.st_code = reg_registration.st_id where term_id= "+term.getId());
         while(result.next()) {
         //           System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
             String name = String.valueOf(result.getBigDecimal("st_code"));
             Blob blob = result.getBlob("st_image");
                    writeToFile(blob,name,path);
         }
        
         con.close();
     }
         catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        }
        
    }
    public void writeToFile(Blob blob,String name,String folder)  {
        
        InputStream in;
        try {
           
            in = blob.getBinaryStream();
            OutputStream out = new FileOutputStream(folder+"\\"+name+".jpg");
            byte[] buff = new byte[4096];  // how much of the blob to read/write at a time
            int len = 0;

            while ((len = in.read(buff)) != -1) {
                out.write(buff, 0, len);
            }
        
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public ArrayList<DanaCourseStudent> getStudentsInCourses(School school,Term term ) {
        ArrayList<DanaCourseStudent> danaCourseStudents = new ArrayList<DanaCourseStudent>(); 
        ArrayList<Student> allStudents = this.searchStudents(false, new Field(new BigDecimal(-1),""), new Level(new BigDecimal(-1),""), new Organization(new BigDecimal(-1),""), new StudentStatus(new BigDecimal(-1),""));  
        Map<String,Student> studentsMap = new HashMap<String,Student>();
        Map<BigDecimal,Student> studentsMap1 = new HashMap<BigDecimal,Student>();
        for(int i=0;i<allStudents.size();i++) {
           studentsMap.put(allStudents.get(i).getNationalId(),allStudents.get(i));
            studentsMap1.put(allStudents.get(i).getStudentCode(), allStudents.get(i)); 
        }
        
        DanaCourseStudent danaCourseStudent;
            Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
            try{
               Statement createStatement = con.createStatement();
               
                ResultSet result=     createStatement.executeQuery("SELECT     CourseScores.StudentCode, CourseScores.CourseCode, CourseScores.TimeYear, CourseScores.TimeDore, Students.FirstName, Students.LastName, \n" + 
                "                      Students.NationalCode, Students.FatherName, Students.Telephone, Courses.Name, Courses.Units, Courses.MinScore\n" + 
                "FROM         CourseScores INNER JOIN\n" + 
                "                      Students ON CourseScores.StudentCode = Students.StudentCode INNER JOIN\n" + 
                "                      Courses ON CourseScores.CourseCode = Courses.CourseCode\n" + 
                "WHERE     (CourseScores.TimeYear = "+term.getYear()+") AND (CourseScores.TimeDore = "+term.getDore()+")");
                
                while(result.next()) {
                           System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName")+"national "+result.getBigDecimal("NationalCode"));
                danaCourseStudent = new DanaCourseStudent();
                danaCourseStudent.setStudentCode(result.getBigDecimal("StudentCode"));
                danaCourseStudent.setFirstName(result.getString("FirstName"));
                danaCourseStudent.setLastName(result.getString("LastName"));
                danaCourseStudent.setFatherName(result.getString("fatherName"));
                danaCourseStudent.setNactionalCode(result.getString("NationalCode"));
                
                danaCourseStudent.setTelephone(result.getString("Telephone"));
              //
              Student MaliStudent = studentsMap.get(danaCourseStudent.getNactionalCode());      
              Student MaliStudent1= studentsMap1.get(danaCourseStudent.getStudentCode());
              if (MaliStudent != null && MaliStudent.getNationalId().length() ==10 )
              {
                    danaCourseStudent.setMobile(MaliStudent.getMobile());
              } 
              else if(MaliStudent1 != null ) {
                  danaCourseStudent.setMobile(MaliStudent1.getMobile());

              }
                danaCourseStudent.setCourseCode(result.getBigDecimal("CourseCode"));
                danaCourseStudent.setCourseName(result.getString("Name"));
                danaCourseStudent.setCourseUint(result.getInt("Units"));
                 danaCourseStudents.add(danaCourseStudent);
                }
               
                con.close();
            }
                catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
               }
        return danaCourseStudents;
    }
    public Boolean isStudentHasPicInSchool(Student student , School school) {
       Boolean returned =false;
        Connection con=    TransactionManagement.getInstance().getMsSqlConnection(school.getHost(),school.getDbName(),school.getDbService());
        try{
           Statement createStatement = con.createStatement();
           
            ResultSet result=     createStatement.executeQuery("SELECT     Students.StudentCode, Students.FirstName, Students.LastName, Students.NationalCode, Students.FatherName, Students.IDno, Students.SchoolCode, \n" + 
                 "                      StudentPhotos.StudentPhoto\n" + 
                 "FROM         StudentPhotos  JOIN\n" + 
                 "                      Students ON StudentPhotos.StudentCode = Students.StudentCode " +
                "  where Students.NationalCode="+student.getNationalId());
            if(result.next()) {
            //           System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
            returned=true;
            }
                       con.close();
        }
            catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
           }
        return returned;
    }
    public void copyStudentPicFromSchoolToSchool(Student student , School sourceSchool,School destinationSchool) {
        Blob blob;
        Connection con=    TransactionManagement.getInstance().getMsSqlConnection(sourceSchool.getHost(),sourceSchool.getDbName(),sourceSchool.getDbService());
        Connection con2=    TransactionManagement.getInstance().getMsSqlConnection(destinationSchool.getHost(),destinationSchool.getDbName(),destinationSchool.getDbService());
        try{
           Statement createStatement = con.createStatement();
           
            ResultSet result=     createStatement.executeQuery("SELECT     Students.StudentCode, Students.FirstName, Students.LastName, Students.NationalCode, Students.FatherName, Students.IDno, Students.SchoolCode, \n" + 
                 "                      StudentPhotos.StudentPhoto\n" + 
                 "FROM         StudentPhotos  JOIN\n" + 
                 "                      Students ON StudentPhotos.StudentCode = Students.StudentCode " +
                "  where Students.NationalCode="+student.getNationalId());
            
            if(result.next()) {
                       System.out.println("stCode= "+result.getBigDecimal("StudentCode") + " StName= "+result.getString("LastName"));
             blob = result.getBlob("StudentPhoto");    
            
               
                PreparedStatement preStatement1 = con2.prepareStatement("insert into StudentPhotos values(?,?)");
                preStatement1.setBigDecimal(1, result.getBigDecimal("StudentCode"));
                preStatement1.setBlob(2, blob);
                preStatement1.execute();
                con2.close();
            }
                       con.close();
                       
        }
            catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
           }
        }
    public ArrayList<Course> getAllCourses() {
        ArrayList<Course> courses = new ArrayList<Course>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_course");
          Course course;
          while(result.next()) {
              course = new Course();
              course.setCourseCode(result.getString("code"));
              course.setCourseId(result.getBigDecimal("ID"));
              course.setCourseName(result.getString("name"));
              //if(result.getInt("unit")!= null)
                  course.setCourseUnits(result.getInt("unit"));
              course.setDescription(result.getString("description"));
              course.setDisplayName(result.getString("display_name"));
              course.setIsFinal(result.getBoolean("is_final"));
              courses.add(course);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    public ArrayList<Registration> findStudentsRegisteredInCourse(Course course , Term term) {
        if(term == null) {
            term = this.getCurrentTerm();
        }
        ArrayList<Registration> registrations = new ArrayList<Registration>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_registerd_course_view where course_id="+course.getCourseId()+
                                                    " and term_id="+term.getId());
          Registration registration;
          while(result.next()) {
              registration = new Registration();
              registration.setId(result.getBigDecimal("reg_id"));
              registration.setRegDate(Utilty.convertDateSQLToUtil(result.getDate("reg_date")));
              registration.setStudent(this.getStudentfromStCode(result.getBigDecimal("st_id")));
              registration.setField(this.getFieldFromFieldId(result.getBigDecimal("field_id")));
              //registration.setTerm(this.getTermFromTermId(result.getBigDecimal("term_id")));
              registration.setLevel(this.getLevelFromLevelId(result.getBigDecimal("level_id"))); 
              registration.setNumberOfTheoryUnits(result.getDouble("theory_units"));
              registration.setNumberOfActionalUnits(result.getInt("actional_units"));
              registration.setFixShahriye(result.getBigDecimal("fix_salary"));
              registration.setTheoryShahriye(result.getBigDecimal("theory_salary"));
              registration.setActionalShahriye(result.getBigDecimal("actional_salary"));
              registration.setOtherSalaryComment(result.getString("other_salary_comment"));
              registration.setOtherShahriyAmount(result.getBigDecimal("other_salary_amount"));
              registration.setTotalShahriye(result.getBigDecimal("total_salary"));
              registration.setOffAmount(result.getBigDecimal("off_amount"));
              registration.setOffComment(result.getString("off_comment"));
              //registration.setCurrentAccounting(this.getStudentAccoutingInRegistration(registration));
              //registration.setTotalPayments(this.getStudentPaymentsInRegistration(registration));
              
              registration.setTerm(term);
              registrations.add(registration);
           //   System.out.println(result.getString(2));
          
          }
            connection.close();
            return registrations;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrations;
    }
    public ArrayList<Course> findCoursesRegistered(Registration registration) {
        ArrayList<Course> courses = new ArrayList<Course>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
        //  ResultSet result=  statement.executeQuery("select * from reg_registerd_course_view where reg_id ="+registration.getId());
        ResultSet result=  statement.executeQuery("SELECT\n" + 
        "	course_field_view.course_code, \n" + 
        "	course_field_view.course_name, \n" + 
        "	course_field_view.course_display_name, \n" + 
        "	course_field_view.course_description, \n" + 
        "	course_field_view.course_id, \n" + 
        "	course_field_view.unit_Count, \n" + 
        "	course_field_view.is_final\n" + 
        "FROM\n" + 
        "	reg_registerd_course_view\n" + 
        "	INNER JOIN\n" + 
        "	course_field_view\n" + 
        "	ON \n" + 
        "		course_field_view.field_id = reg_registerd_course_view.field_id AND\n" + 
        "		course_field_view.course_id = reg_registerd_course_view.course_id\n" + 
        "WHERE\n" + 
        "	reg_id  ="+registration.getId()); 
          Course course;
          while(result.next()) {
              course = new Course();
              course.setCourseCode(result.getString("course_code"));
              course.setCourseId(result.getBigDecimal("course_id"));
              course.setCourseName(result.getString("course_name"));
              //if(result.getInt("unit")!= null)
                  course.setCourseUnits(result.getInt("unit_count"));
              course.setDescription(result.getString("course_description"));
              course.setDisplayName(result.getString("course_display_name"));
              course.setIsFinal(result.getBoolean("is_final"));
              courses.add(course);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    public ArrayList<Course> findCoursesNotRegistered(Registration registration) {
        ArrayList<Course> courses = new ArrayList<Course>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
      //    ResultSet result=  statement.executeQuery("select * from reg_course where reg_course.ID not in (select reg_reg_course.course_id from reg_reg_course where reg_reg_course.reg_id = "+registration.getId()+" )");
      ResultSet result=  statement.executeQuery("select * from course_field_view where field_id ="+registration.getField().getId()+" and course_id not in (select reg_reg_course.course_id from reg_reg_course where reg_reg_course.reg_id="+registration.getId()+")");
          Course course;
          while(result.next()) {
              course = new Course();
              course = new Course();
              course.setCourseCode(result.getString("course_code"));
              course.setCourseId(result.getBigDecimal("course_id"));
              course.setCourseName(result.getString("course_name"));
              //if(result.getInt("unit")!= null)
                  course.setCourseUnits(result.getInt("unit_count"));
              course.setDescription(result.getString("course_description"));
              course.setDisplayName(result.getString("course_display_name"));
              course.setIsFinal(result.getBoolean("is_final"));
              courses.add(course);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    public void addCourseToRegistration(Registration registration,Course course ) {
        
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
         try {
             pre = con.prepareStatement("insert into reg_reg_course(reg_id,course_id) values(?,?)",Statement.RETURN_GENERATED_KEYS);
             pre.setBigDecimal(1,registration.getId());
             pre.setBigDecimal(2, course.getCourseId());
             pre.executeUpdate();
         } catch (SQLException e) {
             e.printStackTrace();
         }    
    }
    public int deleteCourseFromRegistration(Registration registration,Course course) {
     
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from reg_reg_course where reg_id = "+registration.getId()+" and course_id = "+course.getCourseId());
          result =1; 
        } catch (SQLException e) {
                e.printStackTrace();
        }
         return result;       
    }
    public String  getStudentImageArray(Student student) {
        
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        Blob stImage;
        String imageArray= "";
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_student_image where st_code = "+student.getStudentCode());
          
          BASE64Encoder encoder;
          if (result.next()) {
              stImage = result.getBlob("st_image");
               encoder = new BASE64Encoder();
                imageArray = encoder.encode(stImage.getBytes(1L,(int) stImage.length())); 
          }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageArray;
    }
    public InputStream  getStudentImageStream(Student student) {
        
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        InputStream stImage = null;
        String imageArray= "";
        try {
          statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from reg_student_image where st_code = "+student.getStudentCode());
          
          BASE64Encoder encoder;
          if (result.next()) {
              stImage = result.getBinaryStream("st_image"); 
          }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stImage;
    }
    public void setStudentPic(Student student , InputStream inputStream) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
        Statement statement;
         try {
             statement = con.createStatement();
             ResultSet result=  statement.executeQuery("select * from reg_student_image where st_code ="+student.getStudentCode());
             if(result.next())
             {
                  pre = con.prepareStatement("update reg_student_image set st_image =?  where st_code = "+student.getStudentCode(),Statement.RETURN_GENERATED_KEYS);   
                  pre.setBlob(1, inputStream);
                     
                  pre.executeUpdate();
                  // ResultSet rs = statement.getGeneratedKeys();
                  // rs.next();
                  // term.setId(rs.getBigDecimal(1));
                  con.close();
              }
             else {
                 pre = con.prepareStatement("insert into reg_student_image(st_code,st_image) values(?,?)",Statement.RETURN_GENERATED_KEYS);
                 pre.setBigDecimal(1,student.getStudentCode());
                 pre.setBlob(2, inputStream);
                 pre.executeUpdate();
                 con.close();
             }
            
         } catch (SQLException e) {
             e.printStackTrace();
         }
    }
    public ArrayList <CourseField> getFieldsFromCourse(Course course) {
        ArrayList<CourseField> coursesFields = new ArrayList<CourseField>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from course_field_view where course_id ="+course.getCourseId());
          CourseField courseField;
          Field field;  
          Course courseTemp ;  
          while(result.next()) {
              courseField = new CourseField();
              courseTemp = new Course();
              courseTemp.setCourseName(course.getCourseName());
              courseTemp.setCourseId(course.getCourseId());
              courseTemp.setDescription(course.getDescription());
              courseTemp.setDisplayName(course.getDescription());
              courseTemp.setIsFinal(result.getBoolean("is_final"));
              courseTemp.setCourseUnits(result.getInt("unit_count"));
              courseField.setCourse(courseTemp);
              field = new Field(result.getBigDecimal("field_id"),result.getString("field_name"));
              courseField.setField(field);
              courseField.setUnitCount(result.getInt("unit_count"));
              courseField.setCourseFieldId(result.getBigDecimal("id"));
              courseField.setIsFinal(result.getBoolean("is_final"));
              coursesFields.add(courseField);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return coursesFields;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coursesFields;
    }
    
    
    
    public ArrayList <Field> getAllAvailableFieldsForCourse(Course course) {
        ArrayList<Field> fields = new ArrayList<Field>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("SELECT\n" + 
          "	* \n" + 
          "FROM\n" + 
          "	reg_field \n" + 
          "WHERE\n" + 
          "	id  not IN (\n" + 
          "	SELECT\n" + 
          "	reg_course_field.field_id\n" + 
          "	FROM\n" + 
          "		reg_course_field \n" + 
          "WHERE\n" + 
          "	course_id ="+course.getCourseId()+")");
          
          Field field;  
          while(result.next()) {
              field = new Field(result.getBigDecimal("id"),result.getString("name"));
              fields.add(field);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return fields;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fields;
    }
    public ArrayList <Course> getAllCoursesForField(Field field) {
        ArrayList<Course> courses = new ArrayList<Course>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from course_field_view where field_id  ="+field.getId()+"");
          Course course;  
          while(result.next()) {
              course = new Course();
              course.setCourseName(result.getString("course_name"));
              course.setCourseId(result.getBigDecimal("course_id"));
              course.setDescription(result.getString("course_description"));
              course.setDisplayName(result.getString("course_display_name"));
              course.setIsFinal(result.getBoolean("is_final"));
              course.setCourseUnits(result.getInt("unit_count"));
              
              
              courses.add(course);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    public CourseField addFieldToCourse(CourseField courseField) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
         ResultSet result ;
         try {
             pre = con.prepareStatement("insert into reg_course_field(field_id,course_id,is_final,unitCount) values(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
             pre.setBigDecimal(1,courseField.getField().getId());
             pre.setBigDecimal(2, courseField.getCourse().getCourseId());
             pre.setBoolean(3, courseField.isIsFinal());
             pre.setInt(4,courseField.getUnitCount() );
             pre.executeUpdate();
             ResultSet rs = pre.getGeneratedKeys();
             if (rs.next()){
               
                 System.out.println("New Id = "+ rs.getBigDecimal(1));
                 courseField.setCourseFieldId(rs.getBigDecimal(1)); 
             }
            
         } catch (SQLException e) {
             e.printStackTrace();
         }    
         return courseField;
        }
    public void deleteFieldFromCourse(CourseField courseField) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        Statement statement ;
         try {
             statement = con.createStatement();
             statement.executeUpdate("delete from reg_course_field where id = "+courseField.getCourseFieldId());
         } catch (SQLException e) {
             e.printStackTrace();
         }    
        }
    public void deleteAllCoursesFromField(Field field) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        Statement statement ;
         try {
             statement = con.createStatement();
             statement.executeUpdate("delete from reg_course_field where field_id = "+field.getId());
         } catch (SQLException e) {
             e.printStackTrace();
         }    
    }
    public void tansferCourseFromFieldToField(Field sourceField,Field destinationField) {
        
            this.deleteAllCoursesFromField(destinationField);
            ArrayList<Course> sourceCourses= this.getAllCoursesForField(sourceField);
            Course course;
            CourseField courseField = new CourseField();
            for (int i =0 ;i<sourceCourses.size();i++) {
                course = sourceCourses.get(i);
                courseField.setCourse(course);
                courseField.setField(destinationField);
                this.addFieldToCourse(courseField);
            }
        }  
    public ArrayList<ExamTime> getAllTermExamTimes(Term term) {
        ArrayList<ExamTime> examTimes= new ArrayList<ExamTime>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        FarsiCalendarConversion fcc;
        Statement statement;
        try {
            statement = connection.createStatement();
        //    ResultSet result=  statement.executeQuery("select * from reg_course where reg_course.ID not in (select reg_reg_course.course_id from reg_reg_course where reg_reg_course.reg_id = "+registration.getId()+" )");
        ResultSet result=  statement.executeQuery("select * from reg_exam_time where term_id ="+term.getId());
        ExamTime examTime;
        while(result.next()) {
              examTime = new ExamTime();
              examTime.setTerm(term);
              examTime.setExamTimeId(result.getBigDecimal("ID"));
              examTime.setExamDate(result.getDate("exam_date"));
              examTime.setExamHour(result.getString("hour"));
              fcc= new FarsiCalendarConversion(result.getDate("exam_date"));
              
              examTime.setExamDay(this.getWeekDayFromNum(fcc.getDayOfWeek()));
              examTime.setExamDateShamsi(fcc.getIranianDate());
              examTimes.add(examTime);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return examTimes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return examTimes;
    }
    public String getWeekDayFromNum(int day) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
        String returned="";
        Statement statement;
         try {
             statement = con.createStatement();
             ResultSet result=  statement.executeQuery("select * from reg_persian_day where id ="+day);
             if(result.next())
             {
                  returned= result.getString("name");
                  // ResultSet rs = statement.getGeneratedKeys();
                  // rs.next();
                  // term.setId(rs.getBigDecimal(1));
                  con.close();
              }
             
            
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return returned;
    }
    public ExamTime addExamTimeToTerm(ExamTime examTime) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
         try {
             pre = con.prepareStatement("insert into reg_exam_time(term_id,exam_date,hour) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
             pre.setBigDecimal(1,examTime.getTerm().getId());
             pre.setDate(2,Utilty.convertDateUtilToSQL(examTime.getExamDate()));
             pre.setString(3, examTime.getExamHour());
           //  pre.setInt(4,courseField.getUnitCount() );
             pre.executeUpdate();
             ResultSet rs = pre.getGeneratedKeys();
             if (rs.next()){
               
                 System.out.println("New Id = "+ rs.getBigDecimal(1));
                 examTime.setExamTimeId(rs.getBigDecimal(1)); 
             }
            
         } catch (SQLException e) {
             e.printStackTrace();
         }    
         return examTime;
        }
    
    public void deleteExamTimeFromTerm(ExamTime examTime) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        Statement statement ;
         try {
             statement = con.createStatement();
             statement.executeUpdate("delete from reg_exam_time where Id = "+examTime.getExamTimeId());
         } catch (SQLException e) {
             e.printStackTrace();
         }    
        }
    public ArrayList<String> getAllExamHours() {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
        ArrayList<String> examHours = new ArrayList<String>();
        Statement statement;
         try {
             statement = con.createStatement();
             ResultSet result=  statement.executeQuery("select * from reg_exam_hour_config");
             String str;       
             while(result.next())
             { 
                 
                 //str=  result.getString("hour_title");
                  // ResultSet rs = statement.getGeneratedKeys();
                  // rs.next();
                  // term.setId(rs.getBigDecimal(1));
                  examHours .add(result.getString("hour_title"));
              }
             con.close();
            
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return examHours;
    }
    public ArrayList<ExamCourse> getAllExamCourseFromExamTime(ExamTime examTime) {
        ArrayList<ExamCourse> examCourses= new ArrayList<ExamCourse>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        FarsiCalendarConversion fcc;
        Statement statement;
        try {
        statement = connection.createStatement();
        //    ResultSet result=  statement.executeQuery("select * from reg_course where reg_course.ID not in (select reg_reg_course.course_id from reg_reg_course where reg_reg_course.reg_id = "+registration.getId()+" )");
        ResultSet result=  statement.executeQuery("select * from exam_course_view where exam_time_id ="+examTime.getExamTimeId());
        ExamCourse examCourse;
        Course course ;
        while(result.next()) {
              examCourse = new ExamCourse();
              examCourse.setExamtime(examTime); 
              course =  new Course();
              course.setCourseId(result.getBigDecimal("course_id"));
              course.setCourseCode(result.getString("course_code"));
              course.setCourseName(result.getString("course_name"));
              course.setDescription(result.getString("course_description"));
              course.setDisplayName(result.getString("course_display_name"));
              examCourse.setCourse(course);
              examCourse.setExamCourseId(result.getBigDecimal("exam_course_id"));
              examCourses.add(examCourse);
              
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return examCourses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return examCourses;
    }
    public ArrayList<CourseField> getAllCourseFields() {
        ArrayList<CourseField> courseFields= new ArrayList<CourseField>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        FarsiCalendarConversion fcc;
        Statement statement;
        try {
            statement = connection.createStatement();
        //    ResultSet result=  statement.executeQuery("select * from reg_course where reg_course.ID not in (select reg_reg_course.course_id from reg_reg_course where reg_reg_course.reg_id = "+registration.getId()+" )");
        ResultSet result=  statement.executeQuery("select * from course_field_view ");
        CourseField courseField;
         Course course;
         Field field;   
        while(result.next()) {
              courseField = new CourseField();
              course = new Course();
              field =  new Field();
              course.setCourseCode(result.getString("course_code"));
              course.setCourseId(result.getBigDecimal("course_id"));
              course.setCourseName(result.getString("course_name"));
              course.setCourseUnits(result.getInt("unit_Count"));
              course.setDescription(result.getString("course_description"));
             course.setDisplayName(result.getString("course_display_name"));
             course.setIsFinal(result.getBoolean("is_final"));
              field.setId(result.getBigDecimal("field_id"));
            field.setName(result.getString("field_name"));
            courseField.setCourse(course);
            courseField.setField(field);
              courseField.setCourseFieldId(result.getBigDecimal("id"));
              courseField.setIsFinal(result.getBoolean("is_final"));
              courseField.setUnitCount(result.getInt("unit_Count"));
             
            
              
              courseFields.add(courseField);
        //      System.out.println(result.getString(2));
          }
            connection.close();
            return courseFields;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseFields;
    }
    public ExamCourse addCourseToExamTime(ExamCourse examCourse) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
            ExamCourse  examCourseTemp = new ExamCourse() ; 
         try {
             pre = con.prepareStatement("insert into reg_exam_course(exam_time_id,course_id) values(?,?)",Statement.RETURN_GENERATED_KEYS);
             pre.setBigDecimal(1,examCourse.getExamtime().getExamTimeId());
             pre.setBigDecimal(2,examCourse.getCourse().getCourseId());
                        //  pre.setInt(4,courseField.getUnitCount() );
             pre.executeUpdate();
             ResultSet rs = pre.getGeneratedKeys();
             if (rs.next()){
                 
                 examCourseTemp = new ExamCourse();
                 examCourseTemp.setCourse(examCourse.getCourse());
                 examCourseTemp.setExamtime(examCourse.getExamtime());
                 System.out.println("New Id = "+ rs.getBigDecimal(1));
                 examCourseTemp.setExamCourseId(rs.getBigDecimal(1)); 
             }
            
         } catch (SQLException e) {
             e.printStackTrace();
         }    
         return examCourseTemp;
        }
    public void deleteCourseFromExamTime(ExamCourse examCourse) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        Statement statement ;
         try {
             statement = con.createStatement();
             statement.executeUpdate("delete from reg_exam_course where Id = "+examCourse.getExamCourseId());
         } catch (SQLException e) {
             e.printStackTrace();
         }    
        }
    public void updateSalaryForOnlineCourse() {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
        String returned="";
        Statement statement;
         try {
             statement = con.createStatement();
             ResultSet result=  statement.executeQuery("select * from reg_online_courses_sum_view");
             Registration registartion ;
             BigDecimal zeroBig = new BigDecimal("0");
             
             while(result.next())
             {
                  BigDecimal onlineCourseSalary = new BigDecimal("40000").multiply(result.getBigDecimal("online_sum"));
                  registartion = this.getRegistrationRegId(result.getBigDecimal("reg_id"));
                  if(registartion.getOtherShahriyAmount()== null || registartion.getOtherShahriyAmount().compareTo(zeroBig)== 0 ) {        
                      registartion.setOtherShahriyAmount(onlineCourseSalary);
                      registartion.setOtherSalaryComment("online "+result.getBigDecimal("online_sum")+" vahed");
                  }else{
                      registartion.setOtherShahriyAmount(registartion.getOtherShahriyAmount().add(onlineCourseSalary));
                      registartion.setOtherSalaryComment(registartion.getOtherSalaryComment()+"  Online " +result.getBigDecimal("online_sum")+" vahed");
                  }
                  registartion.setTotalShahriye(this.calculateRegistrationPrice(registartion));
                  this.editRegisterStudent(registartion);
                  
              }
             con.close();
         } catch (SQLException e) {
             e.printStackTrace();
         }
    }
}