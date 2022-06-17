package view;

import finance.data.AccountBank;
import finance.data.RecievePayType;
import finance.data.RecievementPayment;

import finance.process.AccountManager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;

import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import model.PaymentStepsView;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;




import oracle.jbo.Row;

import org.apache.myfaces.trinidad.event.AttributeChangeEvent;

import registration.data.PaymentStep;
import registration.data.Registration;
import registration.data.Student;

import registration.data.Term;

import registration.process.RegistrationManager;

import report.ReportManagment;

public class RegistartionHistoryBean {
    private Student student;
    private BigDecimal stCode; 
    private Registration registration;
    private BigDecimal registartionCurrentAccounting;
    private boolean isPos = false;
    private RichSelectOneChoice bankAccountNameField;
    private RichInputText descriptionFiled;
    private RichInputText codeField;
    private Date payDate = new Date();
    private BigDecimal payValue;
    
    public RegistartionHistoryBean() {
        super();
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getStudent() {
        return student;
    }

    public void getStudentFromCode() {
        RegistrationManager rm = new RegistrationManager();
        student = rm.getStudentfromStCode(stCode);
        System.out.println("student National = "+ student.getNationalId() );
        
    }

    public void setStCode(BigDecimal stCode) {
        this.stCode = stCode;
    }

    public BigDecimal getStCode() {
        return stCode;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    public Registration getRegistration() {
        return registration;
    }

    public String clearRegistration() {
        
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getAllStudentRegistrationsIterator");
                
                Row row = iter.getCurrentRow();
       
              if(row !=null) {
         //TODO
           
           this.registration = (Registration)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
           registartionCurrentAccounting = rm.getStudentAccoutingInRegistration(registration);
           
           if(this.registration.getCurrentAccounting().compareTo(new BigDecimal(0))==-1)
           {
           this.payValue =registartionCurrentAccounting.abs();
           this.payDate = new Date();
           returned = "clear";
           }
           else {
               System.out.println("this registration has no bedehi");
           }
       }
       else {
           System.out.println("please select a registraation");
       }
        return returned;
    }
    
        public String payForRegistrtion() {
        // Add event code here...
        
        String returned="";
        
        RegistrationManager rm = new RegistrationManager();
        AccountManager am = new AccountManager();
        
       
        PaymentStep paymentStep = new PaymentStep();
        paymentStep.setCreateDate(this.payDate);
     //   paymentStep.setNextPayment((Date)this.nextPaymentDateField.getValue());
        paymentStep.setRegistration(this.getRegistration());
        
        RecievementPayment rp = new  RecievementPayment();
        
        rp.setAccount(rm.getAccountFromStudent(this.getStudent()));
        
        if(this.isPos)
        {
        rp.setAccountBank(this.getCurrentSelectedAccountBank());
        rp.setRecievePayType(new RecievePayType(new BigDecimal(2),"")); //for pos
        }
        else {
            rp.setAccountBank(am.getCash());
            rp.setRecievePayType(new RecievePayType(new BigDecimal(1),"")); //for naghdi
        }
        rp.setAmount(this.payValue);
        rp.setCode((String)this.getCodeField().getValue());
        rp.setDescription((String)(this.descriptionFiled.getValue()));
        rp.setEventDate(this.payDate);
               
        paymentStep.setReceivementPaymentFinance(rp);
        if(this.payValue.compareTo(registartionCurrentAccounting.abs()) <=0)
        {
        rm.setPayForStudent(paymentStep);
        
        returned = "newPay";
        }
        else {
            Utility.showFacesMessage("mablagh az bedehi bishtar ast", FacesMessage.SEVERITY_INFO);
        }
        return returned;
        
    }

    public void setIsPos(boolean isPos) {
        this.isPos = isPos;
    }

    public boolean isIsPos() {
        return isPos;
    }

    public void setRegistartionCurrentAccounting(BigDecimal registartionCurrentAccounting) {
        this.registartionCurrentAccounting = registartionCurrentAccounting;
    }

    public BigDecimal getRegistartionCurrentAccounting() {
        return registartionCurrentAccounting;
    }

    public void setBankAccountNameField(RichSelectOneChoice bankAccountNameField) {
        this.bankAccountNameField = bankAccountNameField;
    }

    public RichSelectOneChoice getBankAccountNameField() {
        return bankAccountNameField;
    }

    public void setDescriptionFiled(RichInputText descriptionFiled) {
        this.descriptionFiled = descriptionFiled;
    }

    public RichInputText getDescriptionFiled() {
        return descriptionFiled;
    }

    public void setCodeField(RichInputText codeField) {
        this.codeField = codeField;
    }

    public RichInputText getCodeField() {
        return codeField;
    }
    public AccountBank getCurrentSelectedAccountBank() {
       // allAccountBanksIterator
       //TODO get all account info
       AccountBank accountBank = null;
       DCBindingContainer bindings =
           (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
       DCIteratorBinding iter =
           (DCIteratorBinding)bindings.findIteratorBinding("allAccountBanksIterator");
           Row row = iter.getCurrentRow();
           if(row!=null) {
               accountBank = new AccountBank();
               accountBank.setName((String)row.getAttribute(1));
               accountBank.setId((BigDecimal)row.getAttribute(0));
           }
       return accountBank;   
            
    }

    public void changeIsPos(ValueChangeEvent attributeChangeEvent) {
        // Add event code here...
        if(isPos) {
            isPos = false;
        }
        else {
            isPos =true;
        }
       Utility.refreshComponent(this.getBankAccountNameField());
    }

    public void printRegistration(FacesContext facesContext,
                                  OutputStream outputStream) {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getAllStudentRegistrationsIterator");
                
                Row row = iter.getCurrentRow();
        
         if(row !=null) {
         //TODO
        
           this.registration = (Registration)((DCDataRow)row).getDataProvider(); 
                      
            ReportManagment rm = new ReportManagment();
           String prtinUrl= rm.runrReportRegistration(this.registration.getId());
           System.out.println("print url" + prtinUrl);
           URL url;
                       InputStream is;
                       try {
                           url = new URL(prtinUrl);
                           is = url.openStream();
                           
                           // initialize  
                           byte[] buffer = new byte[4096]; // tweaking this number may increase performance  
                           int len;  
                           while ((len = is.read(buffer)) != -1)  
                           {  
                               outputStream.write(buffer, 0, len);  
                           }  
                           is.close();  
                       } catch (FileNotFoundException e) {
                           e.printStackTrace();
                       } catch (IOException e) {
                           e.printStackTrace();
                       } 
                               }
        else {
           System.out.println("please select a registraation");
        }
    }

    

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayValue(BigDecimal payValue) {
        this.payValue = payValue;
    }

    public BigDecimal getPayValue() {
        return payValue;
    }

    public void printHistoryFinanace(FacesContext facesContext,
                                     OutputStream outputStream) {
        // Add event code here...
                  
        ReportManagment rm = new ReportManagment();
        String prtinUrl= rm.runrReportRegistrationList(this.student.getStudentCode());
        System.out.println("print url" + prtinUrl);
        URL url;
                   InputStream is;
                   try {
                       url = new URL(prtinUrl);
                       is = url.openStream();
                       
                       // initialize  
                       byte[] buffer = new byte[4096]; // tweaking this number may increase performance  
                       int len;  
                       while ((len = is.read(buffer)) != -1)  
                       {  
                           outputStream.write(buffer, 0, len);  
                       }  
                       is.close();  
                   } catch (FileNotFoundException e) {
                       e.printStackTrace();
                   } catch (IOException e) {
                       e.printStackTrace();
                   } 
    }

    public void printContract(FacesContext facesContext,
                              OutputStream outputStream) {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getAllStudentRegistrationsIterator");
                
                Row row = iter.getCurrentRow();
        
         if(row !=null) {
         //TODO
        
           this.registration = (Registration)((DCDataRow)row).getDataProvider(); 
                      
            ReportManagment rm = new ReportManagment();
           String prtinUrl= rm.runrReportRegistrationContract(this.registration.getId());
           System.out.println("print url" + prtinUrl);
           URL url;
                       InputStream is;
                       try {
                           url = new URL(prtinUrl);
                           is = url.openStream();
                           
                           // initialize  
                           byte[] buffer = new byte[4096]; // tweaking this number may increase performance  
                           int len;  
                           while ((len = is.read(buffer)) != -1)  
                           {  
                               outputStream.write(buffer, 0, len);  
                           }  
                           is.close();  
                       } catch (FileNotFoundException e) {
                           e.printStackTrace();
                       } catch (IOException e) {
                           e.printStackTrace();
                       } 
                               }
        else {
           System.out.println("please select a registraation");
        }
    }
}
