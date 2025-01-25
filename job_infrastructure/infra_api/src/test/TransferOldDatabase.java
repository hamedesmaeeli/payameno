package test;

import finance.data.AccountBank;
import finance.data.Bank;
import finance.data.RecievePayType;
import finance.data.RecievementPayment;

import finance.process.AccountManager;

import java.math.BigDecimal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;

import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.PaymentStep;
import registration.data.Registration;
import registration.data.Student;
import registration.data.StudentStatus;
import registration.data.Term;

import registration.process.AccountingManager;
import registration.process.RegistrationManager;

import transaction.TransactionManagement;

public class TransferOldDatabase {
    
    public TransferOldDatabase() {
        
    }
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost:3306/school_temp?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", "root", "root");   
        return conn;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void clearAllTables() {
        
    }
    public void transferTerms() {
        RegistrationManager rm = new RegistrationManager();
        Statement st;
        try {
            st = this.getConnection().createStatement();
            ResultSet result = st.executeQuery("select * from tblterm");
            Term term;
            while(result.next()) {
                System.out.println(result.getInt(1));
                term = new Term();
                term.setId(new BigDecimal(result.getInt("xCode_PK")));
                term.setName(result.getString("xDsc"));
                term.setIsCurrent(true);
                rm.createTerm(term);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void transferStudents() {
        RegistrationManager rm = new RegistrationManager();
        Statement st;
        try {
            st = this.getConnection().createStatement();
            ResultSet result = st.executeQuery("select * from temp_old_student");
            Student student;
            while(result.next()) {
//                System.out.println(result.getInt(1));
                student = new Student();
               // student.setAddress(result.getString(""));
                student.setCreated_date(new Date());
         
         
             //  student.setDateOfBirth(this.convertPersionToMiladi(result.getString("xBDate")));
              
                student.setDescription(result.getString("desc"));
                student.setFamily(result.getString("last_name"));
                student.setFatherName(result.getString("father_name"));
                student.setLastModified(new Date());
              //  student.setMobile(result.getString("xTell"));
                student.setName(result.getString("first_name"));
                if(result.getString("melli_code")!= null)
                student.setNationalId(result.getString("melli_code"));
               // student.setNationalId(Integer.valueOf(result.getString("xMelli")));
                student.setOrganization(new Organization(new BigDecimal(1),""));
               // student.setPhone(result.getString("xTell"));
                student.setStudentCode(new BigDecimal (result.getString("melli_code")));
                student.setStudentStatus(new StudentStatus(new BigDecimal(1),"") );
                
               rm.createNewStudent(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public BigDecimal getStudentStatusFromName(String name) {
        BigDecimal returned = new BigDecimal(-1); 
        if(name.compareTo("انتقال ر�?ته")==0) {
            returned = new BigDecimal(2);
        }
        else if(name.compareTo("بلاتکلي�?")==0) {
            returned = new BigDecimal(3);
        }
        else if(name.compareTo("ترک تحصيل")==0) {
            returned = new BigDecimal(4);
        }
        else if(name.compareTo("�?ارغ التحصيل")==0 ) {
            returned = new BigDecimal(5);
        }
        else if(name.compareTo("�?عال")==0) {
            returned = new BigDecimal(1);
        }
        return returned;
    }
    public BigDecimal getLevelFromName(String name) {
        BigDecimal returned = new BigDecimal(-1); 
        if(name.compareTo("راهنمايي")==0) {
            returned = new BigDecimal(1);
        }
        else if(name.compareTo("متوسطه")==0) {
            returned = new BigDecimal(2);
        }
        return returned;
    }
    
    public Date  convertPersionToMiladi(String stringDate) {
       //string date in format of : yyyy/mm/dd  in shamsi
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date date =null;
        FarsiCalendarConversion fcc = new FarsiCalendarConversion();
        try {
           sdf.parse(stringDate);
           fcc.setIranianDate(stringDate);
        } catch (ParseException e) {
            System.out.println("persian date is not in the form "+ stringDate);
            e.printStackTrace();
            return null;
        }  
        
        try {
            System.out.println(fcc.getGregorianDate());
           date = sdf.parse(fcc.getGregorianDate());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
    public void transferRegistrations() {
        RegistrationManager rm = new RegistrationManager();
        AccountManager am = new AccountManager();
        AccountBank sandogh = am.getCash();
        RecievePayType naghdPay =  new RecievePayType(new BigDecimal(1),"");
        Statement st;
        try {
            st = this.getConnection().createStatement();
            ResultSet result = st.executeQuery("select * from tblsabt");
            Registration registration;
           
            while(result.next()) {
        //                System.out.println(result.getInt(1));
                registration  = new Registration();
            
                
                registration.setFixShahriye(new BigDecimal(result.getInt("xFixShahriye")));
                
                
                registration.setNumberOfTheoryUnits((result.getDouble("xCoffSum")));
                registration.setTheoryShahriye(new BigDecimal( result.getInt("xCoffShahriye")));  
                System.out.println("show number of coffSum "+ result.getDouble("xCoffSum"));
                
                
                registration.setNumberOfActionalUnits(result.getInt("xHourSum"));
                registration.setActionalShahriye(new BigDecimal(result.getInt("xHourShahriye")));
                
                 
                
                registration.setOtherShahriyAmount(new BigDecimal(result.getInt("xMaharatShahriye")));  
                registration.setTotalShahriye(new BigDecimal(result.getInt("xTotalShahriye")).subtract(new BigDecimal(result.getInt("xTakhfif"))));
                
                registration.setOffAmount(new BigDecimal(result.getInt("xTakhfif")));
              //  registration.setOffComment(offComment);
                registration.setOtherSalaryComment(String.valueOf( result.getString("xOldBedehi")));
              
                registration.setRegDate(new Date());
                registration.setStudent(rm.getStudentfromStCode(new BigDecimal(result.getDouble("xStudent_FK"))));
                
                registration.setTerm(rm.getTermFromTermId(new BigDecimal(result.getInt("xTerm_FK"))));
             
                registration.setField(new Field(new BigDecimal(5),""));
                  
                registration.setLevel(new Level(this.getLevelFromName(result.getString("xMaghta_FK")),""));
                
                System.out.println("  level name  " +this.getLevelFromName(result.getString("xMaghta_FK")));  
             registration =   rm.registerStudent(registration);
               System.out.println("*********8reg id = "+registration.getId());    
               
                //set payments for registrations
                int payAmount;
                Date payDate;
                PaymentStep paymentStep ;
                RecievementPayment receivementPaymentFinance; 
                receivementPaymentFinance = new RecievementPayment();
                receivementPaymentFinance.setAccount(rm.getAccountFromStudent(registration.getStudent()));
                receivementPaymentFinance.setAccountBank(sandogh);
                
                //receivementPaymentFinance.setCode(code);
                receivementPaymentFinance.setDescription("registertaion");
               
                receivementPaymentFinance.setRecievePayType(naghdPay);
                
                if(result.getInt("xIsPaid1")==1) {
                    paymentStep  = new PaymentStep();
                   payAmount = result.getInt("xGhest1");
                   payDate = this.convertPersionToMiladi(result.getString("xPaidDate1"));
                   receivementPaymentFinance.setEventDate(payDate);
                   receivementPaymentFinance.setAmount(new BigDecimal( payAmount));
                  if(payDate == null )
                      System.out.println("reg id for null payments id= "+registration.getId());
                   paymentStep.setCreateDate(payDate);
                   paymentStep.setRegistration(registration);
                   paymentStep.setReceivementPaymentFinance(receivementPaymentFinance); 
                  rm.setPayForStudent(paymentStep);
                }
                if(result.getInt("xIsPaid2")==1) {
                    paymentStep  = new PaymentStep();
                    payAmount = result.getInt("xGhest2");
                    payDate = this.convertPersionToMiladi(result.getString("xPaidDate2"));
                    receivementPaymentFinance.setEventDate(payDate);
                    receivementPaymentFinance.setAmount(new BigDecimal( payAmount));
                    if(payDate == null )
                        System.out.println("reg id for null payments id= "+registration.getId());
                    paymentStep.setCreateDate(payDate);
                    paymentStep.setRegistration(registration);
                    paymentStep.setReceivementPaymentFinance(receivementPaymentFinance);
                     rm.setPayForStudent(paymentStep);
                }
                if(result.getInt("xIsPaid3")==1) {
                    paymentStep  = new PaymentStep();
                    payAmount = result.getInt("xGhest3");
                    payDate = this.convertPersionToMiladi(result.getString("xPaidDate3"));
                    if(payDate == null )
                        System.out.println("reg id for null payments id= "+registration.getId());
                    receivementPaymentFinance.setEventDate(payDate);
                    receivementPaymentFinance.setAmount(new BigDecimal( payAmount));
                    paymentStep.setCreateDate(payDate);
                    paymentStep.setRegistration(registration);
                    paymentStep.setReceivementPaymentFinance(receivementPaymentFinance);
                    rm.setPayForStudent(paymentStep);
                }               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String args[]) {
        TransferOldDatabase td = new TransferOldDatabase();
      //  td.transferTerms();
      System.out.println(Integer.decode("621998268"));
     td.transferStudents();
      //  td.transferRegistrations();
       
   //     registration =   rm.registerStudent(registration);
    }
}