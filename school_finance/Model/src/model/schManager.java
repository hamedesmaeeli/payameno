package model;

import finance.process.AccountManager;

import java.math.BigDecimal;

import java.util.ArrayList;

import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.PaymentStep;

import registration.data.Registration;

import registration.data.RegistrationCheck;

import registration.data.School;
import registration.data.Student;

import registration.data.StudentStatus;
import registration.data.Term;

import registration.process.AccountingManager;
import registration.process.RegistrationManager;

import views.DebtorInTerm;

public class schManager {
    private RegistrationManager registrationManager = new RegistrationManager();
    private AccountManager accountManager = new AccountManager();
    public schManager() {
       
    }
   
    public ArrayList<PaymentStepsView> getPaymentsStepsview (Registration registration) {
    ArrayList<PaymentStepsView> paymentStepsview =new  ArrayList<PaymentStepsView>();
    ArrayList<PaymentStep> paymentSteps= registrationManager.getRegistrationPaymentSteps(registration);
    PaymentStepsView paymentStepView;
    for(int i=0;i<paymentSteps.size();i++) {
        paymentStepView = new PaymentStepsView ();
        paymentStepView.setCreateDate(paymentSteps.get(i).getCreateDate());
       paymentStepView.setNextPayment( paymentSteps.get(i).getNextPayment());
       paymentStepView.setPaymentStepId( paymentSteps.get(i).getPaymentStepId());
      paymentStepView.setPaymentFinanceId( paymentSteps.get(i).getReceivementPaymentFinance().getId());
       paymentStepView.setPaymentfinaceDescription( paymentSteps.get(i).getReceivementPaymentFinance().getDescription());
       paymentStepView.setPeymentFinnaceCode( paymentSteps.get(i).getReceivementPaymentFinance().getCode());
      paymentStepView.setAmount(  paymentSteps.get(i).getReceivementPaymentFinance().getAmount());
       paymentStepView.setAccountBankName( paymentSteps.get(i).getReceivementPaymentFinance().getAccountBank().getName());
       paymentStepView.setReceivePaytypeName( paymentSteps.get(i).getReceivementPaymentFinance().getRecievePayType().getName());
        paymentStepsview.add(paymentStepView); 
    }
    return paymentStepsview;
}
    public ArrayList<RegistrationCheckView> getRegistrationChecksView(Registration registration) {
        ArrayList<RegistrationCheckView> registrationChecksView = new ArrayList<RegistrationCheckView>();
        ArrayList<RegistrationCheck> registartionChecks = registrationManager.getRegistrationChecks(registration);
        System.out.println("size :"+registartionChecks.size());
        RegistrationCheckView registartionCheck;
        for(int i=0;i<registartionChecks.size();i++) {
            registartionCheck = new RegistrationCheckView();
           registartionCheck.setId( registartionChecks.get(i).getId());
          
           registartionCheck.setCreatedDate(registartionChecks.get(i).getCreateDate());
           registartionCheck.setAmount(registartionChecks.get(i).getCheck().getAmount());
           registartionCheck.setCheckDate( registartionChecks.get(i).getCheck().getCheckDate());
           registartionCheck.setCheckDescription(registartionChecks.get(i).getCheck().getDescription());
           registartionCheck.setCheckforHow(registartionChecks.get(i).getCheck().getForHow());
           registartionCheck.setCheckId( registartionChecks.get(i).getCheck().getId());
           registartionCheck.setCheckNumber(registartionChecks.get(i).getCheck().getNumber());
           registartionCheck.setBankAccountName( registartionChecks.get(i).getCheck().getAccountBank().getName());
           registartionCheck.setBankAccountId( registartionChecks.get(i).getCheck().getAccountBank().getId()); 
           registartionCheck.setCheckBankName( registartionChecks.get(i).getCheck().getBank().getName());
           registartionCheck.setCheckStatusName(registartionChecks.get(i).getCheck().getCheckStatus().getName());
           registartionCheck.setCheckStatusId(registartionChecks.get(i).getCheck().getCheckStatus().getId()); 
           registrationChecksView.add(registartionCheck);
        }
        return registrationChecksView;
    }
    public BigDecimal getStudentCurrentAccounting(Student student) {
        AccountManager am = new AccountManager();
        RegistrationManager rm = new RegistrationManager();
        System.out.println("current accounting  "+student.getFamily()+"  ="+ am.getCurrentAccounting(rm.getAccountFromStudent(student)));
        return am.getCurrentAccounting(rm.getAccountFromStudent(student));
    }
    public ArrayList<DebtorInTerm> getDebtorInCurrentTermList() {
        RegistrationManager rm = new RegistrationManager();
        ArrayList<Student> registeredStudents = rm.searchStudents(true, new Field(new BigDecimal(-1),""), new Level(new BigDecimal(-1),""), new Organization(new BigDecimal(-1),""), new StudentStatus(new BigDecimal(-1),""));
        ArrayList<DebtorInTerm> debitorsInTerm =   new ArrayList<DebtorInTerm>();
        DebtorInTerm debitorInTerm;
        Registration registration;
        
        Term currentTerm = rm.getCurrentTerm();
        for(int i=0;i<registeredStudents.size();i++) {
            debitorInTerm = new DebtorInTerm();
            debitorInTerm.setTerm(currentTerm);
            debitorInTerm.setStudent(registeredStudents.get(i));
            registration=rm.getRegistrationFromStudentAndTerm(registeredStudents.get(i), currentTerm);
            debitorInTerm.setRegistration(registration);
            debitorInTerm.setField(registration.getField());
            debitorInTerm.setLevel(registration.getLevel());
            debitorInTerm.setOrganization(registeredStudents.get(i).getOrganization());
            debitorInTerm.setDebitValue( rm.getStudentAccoutingInRegistration(registration));
            //if(debitorInTerm.getDebitValue().compareTo(new BigDecimal(0))!= 0)
            //{
                debitorsInTerm.add(debitorInTerm);
           // }
           System.out.println("******* stCod= "+registeredStudents.get(i).getStudentCode() ); 
        }
        System.out.println("**********************8");
        return debitorsInTerm;
    }
    public void setRegistrationManager(RegistrationManager registrationManager) {
        this.registrationManager = registrationManager;
    }
    public ArrayList<SchoolStudentPic> getSchoolsHasPicForStudent(Student student) {
        ArrayList<SchoolStudentPic> SchoolStudentPics = new ArrayList<SchoolStudentPic>();
        RegistrationManager rm = new RegistrationManager();
        ArrayList<School> schools = rm.getAllSchool();
        SchoolStudentPic schoolStudentPic ;
         for(int i=0;i<schools.size();i++) {
             schoolStudentPic = new SchoolStudentPic();
             schoolStudentPic .setSchool(schools.get(i));
             schoolStudentPic.setStudent(student);
             schoolStudentPic.setHasPic(rm.isStudentHasPicInSchool(student,schools.get(i)));
             SchoolStudentPics.add(schoolStudentPic);
         }
         return SchoolStudentPics;
    }
    public RegistrationManager getRegistrationManager() {
        return registrationManager;
    }

    public void setAccountManager(AccountManager accountManager) {
        this.accountManager = accountManager;
    }

    public AccountManager getAccountManager() {
        return accountManager;
    }
}
