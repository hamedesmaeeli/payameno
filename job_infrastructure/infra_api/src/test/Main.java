package test;


import finance.data.Account;

import finance.data.Course;

import finance.process.AccountManager;

import java.io.File;

import java.io.UnsupportedEncodingException;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Date;

import java.util.Scanner;

import registration.data.CourseField;
import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.Student;
import registration.data.StudentStatus;

import registration.data.DanaStudent;

import registration.data.ExamCourse;
import registration.data.ExamTime;
import registration.data.Registration;
import registration.data.School;

import registration.data.Term;

import registration.process.RegistrationManager;

import transaction.TransactionManagement;

import transaction.access.AccessDbManage;

public class Main {
    public Main() {
        super();
    }

    public static void main(String[] args) {
       
       // start test create Student 
       
       /**  
       
       Organization  organization = new Organization();
       StudentStatus status = new StudentStatus(); 
       organization.setId(new BigDecimal("1"));
       status.setStatusId(new BigDecimal("1"));
      
       Student student = new Student();
       student.setName("hamid");
       student.setFamily("hamidi");
        student.setFatherName("fater");
        student.setDateOfBirth(new Date());
        student.setIdentifierChar(2);
        student.setIdentifierCode("9898");
        student.setIdentifierSerial("232344");
        student.setCreated_date(new Date());
        student.setDescription("desc2");
        student.setNationalId(1234555);
        student.setOrganization(organization);
        student.setStudentCode(new BigDecimal("1235"));
        student.setStudentStatus(status);
        student.setAddress("asghar aabad");
        student.setMobile("093798009");
        student.setPhone("4412345");
        student.setArchiveCode("alef jim 123");
        Account ac = new Account();
        ac.setFisrtPayable(new BigDecimal(2000000));
        student.setAccount(ac);
        RegistrationManager rm = new RegistrationManager();
        rm.editStudent(student);
      
      */
     // end test create student
         
      //*************************************
        
       
      //  * start test create account
      //  * 
      
     // am.createAccount(account);
     // System.out.println(am.getCurrentAccounting(account));
        
       /**
        * test get all status 
        */
       RegistrationManager rm = new RegistrationManager();
  //   ArrayList<ExamTime> examTimes = rm.getAllTermExamTimes(new Term(new BigDecimal(9320),"",new Date(),new Date(),100,2));
      System.out.println(rm.getCurrentTerm().getId()+" "+rm.getCurrentTerm().getName()); 
        
 // ExamTime examTime = new ExamTime();
 // examTime.setExamTimeId(new BigDecimal("11"));
 //  ArrayList<CourseField> examCourses=  rm.getAllCourseFields();
          
     // rm.getAllStudentStatus();
     // System.out.println( rm.isStudentCodeExists(new BigDecimal("12345")));
      // System.out.println(rm.isStudentNatinalCodeExist(1285177886));
    // rm.searchStudents(false,null,new Level(new BigDecimal("1"),"12"),new Organization(new BigDecimal("1"),"12"),new StudentStatus(new BigDecimal("1"),"12"));
  //  Student st = new Student();
   // st.setStudentCode(new BigDecimal(8451566));
      
   // System.out.println(rm.getStudentImageArray(st));
  //  rm.writeToLog("helooo");
   //    
//       DanaStudent danaStudent = new DanaStudent();
//   danaStudent.setStudentCode(new BigDecimal(878787));
//    danaStudent.setFirstName("testFirst");
//     danaStudent.setLastName("testlast");
//    danaStudent.setNactionalCode(new BigDecimal(1234567891));
//     danaStudent.setFatherName("testFather");
//     danaStudent.setIDno("123"); 
//    danaStudent.setIssuePlace("testIssuePlace");
//    danaStudent.setBirthDate(631101);
//     danaStudent.setBirthPalce("testBirthPlace");
//        danaStudent.setSex(1);
//        danaStudent.setTelephone("2121212");
//        
//       danaStudent.setSeriId(1); 
//        danaStudent.setSerialId(123456); 
//       danaStudent.setRadifId(12); 
//       
   
   /*
       School school = new School();
       school.setHost("localhost");
       school.setId( new BigDecimal(35778603));
        school.setDbService("sqlexpress");
        school.setDbName("Dana35778603");
        
        Term term = new Term();
        term.setDore(6);
        term.setYear(93);
   */
  // rm.createStudentKartApp(school,term);
   //rm.getDanaRegUnits(school,term)    ;
   
   
        
  //     AccessDbManage adm = new AccessDbManage();
   //    adm.createConnection();
    //   adm.closeConnection();  
    //   adm.deleteFile() ;
//           
//           
//           rm.createDanaStudent(school, danaStudent);   
    System.out.println("test ends");
    }
}
