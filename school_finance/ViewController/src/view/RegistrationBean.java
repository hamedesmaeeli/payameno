package view;

import finance.data.Account;
import finance.data.AccountBank;

import finance.data.Bank;
import finance.data.Check;
import finance.data.CheckStatus;
import finance.data.Course;
import finance.data.RecievePayType;
import finance.data.RecievementPayment;

import finance.process.AccountManager;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.net.URL;

import java.util.Date;

import java.util.Iterator;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import javax.print.attribute.standard.Severity;

import model.PaymentStepsView;

import model.RegistrationCheckView;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;

import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichInputNumberSpinbox;
import oracle.adf.view.rich.component.rich.input.RichInputText;

import oracle.adf.view.rich.component.rich.input.RichSelectBooleanCheckbox;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;

import oracle.adf.view.rich.component.rich.layout.RichPanelBox;

import oracle.adf.view.rich.component.rich.layout.RichPanelGroupLayout;

import oracle.adf.view.rich.component.rich.nav.RichCommandImageLink;
import oracle.adf.view.rich.component.rich.output.RichImage;
import oracle.adf.view.rich.event.PopupFetchEvent;

import oracle.jbo.Key;
import oracle.jbo.Row;

import oracle.jbo.RowSetIterator;

import org.apache.myfaces.trinidad.model.RowKeySet;
import org.apache.myfaces.trinidad.model.UploadedFile;

import registration.data.Base;
import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.PaymentStep;
import registration.data.Registration;
import registration.data.RegistrationCheck;
import registration.data.SalaryParam;
import registration.data.Student;
import registration.data.StudentStatus;

import registration.data.Term;

import registration.process.AccountingManager;
import registration.process.RegistrationManager;

import report.ReportManagment;

import util.RestoreBackup;

public class RegistrationBean {
    private Level level = new Level(new BigDecimal(-1),"all");
    private Field field = new Field(new BigDecimal(-1),"all");
    private StudentStatus studentStatus =
        new StudentStatus(new BigDecimal(1), "all"); //active student
    private Organization organization = new Organization(new BigDecimal(-1),"all");
    private Student currentStudent;
    private Student createdStudent;
    
    private RichInputText fixSalaryField;
    private RichInputText actionSalaryField;
    private RichInputText theorySalaryField;
    private RichInputText otherPriceField;
    private RichInputText otherPriceDescField;
    private RichInputText offField;
    private RichInputText offReasonField;
    private RichInputText countOfActionalField;
    private RichInputText countOfTheoryField;

    private Field currentSelectedField;
    private Level currentSelectedLevel;
    private Base currentSelectBase;
    private Term currentTerm;
    private Registration currentRegistration;
    private RichInputText payNaghdAmountField;
    private boolean isPos = false;
    private RichInputDate nextPaymentDateField;
    private RichInputText codeRahgiriPayField;
    private RichInputText payDescriptionFeild;
    private RichSelectOneChoice payNaghtAccountBankFeild;
    private RichInputText checkNumCreate;
    private RichInputText checkAmountCreate;
    private RichInputText bankBrankCheckCreate;
    private RichInputText chechDescCreate;
    private RichInputText checkForHowCreate;
    private RichInputDate checkDateCreate;
    private BigDecimal currentStudentAccounting;
    private BigDecimal currebtStudentRegistrationAccounting;
    private String financeReport;
    private Account currentAccount;
    private ReportManagment reportManagement = new ReportManagment();
    private RichInputText payToStudentAmountField;
    private RichInputText payToStudentDescriptionField;
    private RichTable studentListTables;
    private RichInputNumberSpinbox t;

    private Boolean isRegInTermFilter = true;
    private RichInputText studentListCount;
    private RichInputText allActionSalaryField;
    private RichInputText allTheorySalary;
    private RichInputText allSalaryField;
    private Registration newRegistration;
    private BigDecimal newRegTotalTheorySalary;
    private BigDecimal newRegTotalActionalSalary;
    private BigDecimal newRegTotalSalary;
    private RichInputText allSalary2Field;
    private RichInputText offField2;
    private RichInputText otherSalaryField2;
    private RichInputText fixSalaryField2;
    private RichInputText newRegistrationNameField;
    private RichInputText newRegfieldName;
    private Boolean newRegistrationIsRegInTerm;
    
    
    private RichInputText stNameField;
    private RichInputText stFamilyField;
    private RichInputText stIdentityCodeField;
    private RichInputText stFatherFiled;
    private RichInputText stAddressFiled;
    private RichInputText stMobileField;
    private RichInputText stPhonFiled;
    private RichInputText stCodefield;
    private RichInputText stIdNum;
    private RichInputText stIdSerialField;
    private Student createdNewStudent;
    private int identifierChar =1;
    private Organization organizationNew = new Organization(new BigDecimal(1),"");
    private StudentStatus studentStatusNew = new StudentStatus(new BigDecimal(1),"");
    private RichInputText stDescriptionField;
    private RichInputDate stDateOfBirthField;
    private RichInputText stArchiveCode;
    private RichInputText stCharNumber;
    
    private Boolean isShowAllStatus=false;
    private Boolean isShowAllOrg=true;
    private Boolean isShowAllField=true;
    private Boolean isShowAllLevel=true;
    private RichInputText levelFieldForSearch;
    private RichInputText fieldForSearch;
    private RichPanelGroupLayout levelGroupLayout;
    private RichSelectOneChoice levelListOneChoice;
    private RichSelectBooleanCheckbox levelIsSelectedCheckBox;
    private RichSelectOneChoice fieldListSelectOneChoice;
    private RichSelectBooleanCheckbox fieldSelectedCheckBox;
    private RichInputText organizationFieldText;
    private RichInputText statusFieldText;
    private RichSelectBooleanCheckbox statusSelectedCheckBox;
    private RichSelectBooleanCheckbox organizationSelectedCheckBox;
    private RichInputText newBaseFieldName;
    private RichTable registerCourseTable;
    private RichCommandImageLink registrationAddButton;
    private String studentPicBaseString; 
    private  UploadedFile StudentPicUploadedFile;
    private RichImage studentPicImageField;
    private RichTable notRegisterdCoursesTable;

    public RegistrationBean() {
        RegistrationManager rm = new RegistrationManager();
        this.currentTerm = rm.getCurrentTerm();
        if (currentTerm == null) {
            currentTerm = new Term();
        }
       studentStatus.setName( rm.getAllStudentStatus().get(0).getName());//faal
        //  currentStudent = rm.getStudentfromStCode(new BigDecimal(123));
        System.out.println(" /n in register bean cunstructor ");
        
    }

    private void ShowMessage(String msg) {
        FacesMessage fm = new FacesMessage(msg);
        fm.setSeverity(FacesMessage.SEVERITY_WARN);
        FacesContext.getCurrentInstance().addMessage(null, fm);
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Level getLevel() {
        return level;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public Field getField() {
        return field;
    }

    public void setStudentStatus(StudentStatus studentStatus) {
        this.studentStatus = studentStatus;
    }
    
    public StudentStatus getStudentStatus() {
        return studentStatus;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setCurrentStudent(Student currentStudent) {
        this.currentStudent = currentStudent;
    }

    public Student getCurrentStudent() {
        return currentStudent;
    }
    
    public void transferTest(ActionEvent actionEvent) {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        currentStudent = rm.getStudentfromStCode(new BigDecimal(123));
      //  System.out.println(" tttttttt " + currentStudent.getName());
    }
     public void changeStatus_edit(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allStudentStatusIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                currentStudent.getStudentStatus().setStatusId((BigDecimal)row.getAttribute(0));
                currentStudent.getStudentStatus().setName((String)row.getAttribute(1));
            }
        } else {
        }
    }

    public void chenageOrgEdit(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allOrganizationIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                currentStudent.getOrganization().setId((BigDecimal)row.getAttribute(1));
                currentStudent.getOrganization().setName((String)row.getAttribute(0));
            }
        } else {

        }
    }

    public void setCreatedStudent(Student createdStudent) {
        this.createdStudent = createdStudent;
    }

    public Student getCreatedStudent() {
        return createdStudent;
    }

    public String editStudent() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("searchStudentsIterator");

        Row row = iter.getCurrentRow();
        if (row != null) {
            System.out.println("studnet code  = " +
                               row.getAttribute("studentCode"));
      //      System.out.println("count = " +                iter.getViewObject().getEstimatedRowCount());

            RegistrationManager rm = new RegistrationManager();
            AccountManager am = new AccountManager();
            this.currentStudent =
                    rm.getStudentfromStCode((BigDecimal)row.getAttribute("studentCode"));
            this.currentAccount =
                    rm.getAccountFromStudent(this.currentStudent);
            this.currentStudentAccounting =
                    am.getCurrentAccounting(this.currentAccount);
         //   System.out.println("father name :" +           this.currentStudent.getFatherName());
            this.studentPicBaseString = rm.getStudentImageArray(this.currentStudent);
            System.out.println(rm.getStudentImageArray(this.currentStudent));
            returned = "edit";
        } else {
            this.ShowMessage("please select a student");
        }
        return returned;
    }

    public String registerStudent() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("searchStudentsIterator");

        Row row = iter.getCurrentRow();
       System.out.println("row key "+ iter.getCurrentRowKeyString());
       System.out.println("row index "+ iter.getCurrentRowIndexInRange());
       System.out.println("row value "+ iter.getCurrentRowWithKeyValue());
       
        DCBindingContainer bindings2 =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter2 =
            (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
    //    System.out.println("row2 index "+ iter2.getCurrentRowIndexInRange());
   //     iter2.executeQuery();
    // iter2.setCurrentRowIndexInRange(1);
        //iter2.clearForRecreate();
       // iter2.refresh(1);
       
       
       
       // iter.setCurrentRowWithKey(arg0);
        if (row != null) {
            System.out.println("studnet code  = " +
                               row.getAttribute("studentCode"));
            System.out.println("count = " +
                               iter.getViewObject().getEstimatedRowCount());
            RegistrationManager rm = new RegistrationManager();
            this.currentStudent =
                    rm.getStudentfromStCode((BigDecimal)row.getAttribute("studentCode"));
            if (!rm.isStudentRegister(this.currentStudent)) {
                newRegistrationIsRegInTerm=false;
                this.currentTerm = rm.getCurrentTerm();
                if (this.currentTerm != null) {
                    System.out.println("father name :" +
                                       this.currentStudent.getFatherName());
                    this.newRegistration = new Registration();
                    this.newRegistration.setTerm(this.currentTerm);
                    this.newRegistration.setStudent(this.currentStudent);
                    this.newRegistration.setNumberOfTheoryUnits(0);
                    this.newRegistration.setNumberOfActionalUnits(0);
                    this.newRegistration.setOffAmount(new BigDecimal(0));
                    this.newRegistration.setOtherShahriyAmount(new BigDecimal(0));
                    this.newRegistration.setFixShahriye(new BigDecimal(0));
                    this.newRegistration.setTheoryShahriye(new BigDecimal(0));
                    this.newRegistration.setActionalShahriye(new BigDecimal(0));
                    
                    this.newRegistration.setLevel(new Level());
                    this.newRegistration.setField(new Field());
                    this.newRegistration.setBase(new Base());
                    this.newRegTotalActionalSalary = null;
                    this.newRegTotalTheorySalary = null;
                    this.newRegTotalSalary = null;

                    returned = "register";
                } else {
                    this.ShowMessage("please set deafult term");
                }
            } else {
                newRegistrationIsRegInTerm=true;
                this.ShowMessage("this student has bean  registerd in this term");
                this.newRegistration =
                        rm.getRegistrationFromStudentAndTerm(this.currentStudent,
                                                             rm.getCurrentTerm());
                this.newRegTotalActionalSalary =
                        this.newRegistration.getActionalShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfActionalUnits()));
                this.newRegTotalTheorySalary =
                        this.newRegistration.getTheoryShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfTheoryUnits()));
                this.newRegTotalSalary =
                        this.newRegistration.getTotalShahriye().add(this.newRegistration.getOffAmount());
                
                returned = "register";
                
            }
        } else {
            this.ShowMessage("please select a student");
        }
        this.updateStudentCurrentAccounting(this.currentStudent);

        return returned;
    }

    public void setFixSalaryField(RichInputText fixSalaryField) {
        this.fixSalaryField = fixSalaryField;
    }

    public RichInputText getFixSalaryField() {
        return fixSalaryField;
    }

    public void setActionSalaryField(RichInputText actionSalaryField) {
        this.actionSalaryField = actionSalaryField;
    }

    public RichInputText getActionSalaryField() {
        return actionSalaryField;
    }

    public void setTheorySalaryField(RichInputText theorySalaryField) {
        this.theorySalaryField = theorySalaryField;
    }

    public RichInputText getTheorySalaryField() {
        return theorySalaryField;
    }

    public void setOtherPriceField(RichInputText otherPriceField) {
        this.otherPriceField = otherPriceField;
    }

    public RichInputText getOtherPriceField() {
        return otherPriceField;
    }
    public void setOtherPriceDescField(RichInputText otherPriceDescField) {
        this.otherPriceDescField = otherPriceDescField;
    }
    public RichInputText getOtherPriceDescField() {
        return otherPriceDescField;
    }
    public void setOffField(RichInputText offField) {
        this.offField = offField;
    }  
    public RichInputText getOffField() {
        return offField;
    }

    public void setOffReasonField(RichInputText offReasonField) {
        this.offReasonField = offReasonField;
    }
    public RichInputText getOffReasonField() {
        return offReasonField;
    }
    public void setCountOfActionalField(RichInputText countOfActionalField) {
        this.countOfActionalField = countOfActionalField;
    }

    public RichInputText getCountOfActionalField() {
        return countOfActionalField;
    }

    public void setCountOfTheoryField(RichInputText countOfTheoryField) {
        this.countOfTheoryField = countOfTheoryField;
    }

    public RichInputText getCountOfTheoryField() {
        return countOfTheoryField;
    }

    public Field getCurrentSelectedField() {
        Field field = null;
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");
        Row row = iter.getCurrentRow();
        if (row != null) {
            field =
                    new Field((BigDecimal)row.getAttribute(0), (String)row.getAttribute(1));
        }
        return field;

    }

    public Level getCurrentSelectedLevel() {
        Level level = null;
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
        Row row = iter.getCurrentRow();
        if (row != null) {
            level =
                    new Level((BigDecimal)row.getAttribute(0), (String)row.getAttribute(1));
        }
        return level;
    }

    public Bank getCurrentSelectedBank() {
        Bank bank = null;
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allBanksIterator");
        Row row = iter.getCurrentRow();
        if (row != null) {
            bank =
new Bank((BigDecimal)row.getAttribute(0), (String)row.getAttribute(1));
        }
        return bank;
    }

    public Check getCurrentSelectedCheck() {
        Check check = null;
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("getRegistrationChecksViewIterator");
        Row row = iter.getCurrentRow();
        //TODO create check from current row
        if (row != null) {
            check = new Check();
            check.setId((BigDecimal)row.getAttribute("checkId"));
            check.setAmount((BigDecimal)row.getAttribute("amount"));
            AccountBank accountBank = new AccountBank();
            accountBank.setId((BigDecimal)row.getAttribute("bankAccountId"));
            check.setAccountBank(accountBank);
            CheckStatus checkStatus =
                new CheckStatus((BigDecimal)row.getAttribute("checkStatusId"),
                                (String)row.getAttribute("checkStatusName"));
            check.setCheckStatus(checkStatus);
        }

        return check;
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
        if (row != null) {
            accountBank = new AccountBank();
            accountBank.setName((String)row.getAttribute(1));
            accountBank.setId((BigDecimal)row.getAttribute(0));
        }
        return accountBank;

    }

    public void changeRegisterField(ValueChangeEvent valueChangeEvent) {
        if (valueChangeEvent.getNewValue() != null) {
            //define variables
            RegistrationManager rm = new RegistrationManager();
            
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {

                Row row = iter.getRowAtRangeIndex(index);
               this.newRegistration.setField(new Field((BigDecimal)row.getAttribute(0),
                          (String)row.getAttribute(1)));
                Utility.refreshComponent(newRegfieldName);    
            }
    }
    }

    public void refreshAllFields() {
        RegistrationManager rm = new RegistrationManager();
        if (this.countOfTheoryField.getValue() != null &&
            this.offField.getValue() != null) {
            this.newRegistration.setTotalShahriye(rm.calculateRegistrationPrice(this.newRegistration));
            this.newRegTotalActionalSalary =
                    this.newRegistration.getActionalShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfActionalUnits()));
            this.newRegTotalTheorySalary =
                    this.newRegistration.getTheoryShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfTheoryUnits()));
            this.newRegTotalSalary =
                    this.newRegistration.getTotalShahriye().add(this.newRegistration.getOffAmount());
          //  System.out.println("Total salary =" + newRegTotalSalary);
        //    System.out.println("registration price = " +                      rm.calculateRegistrationPrice(this.newRegistration));

            Utility.refreshComponent(fixSalaryField);
            Utility.refreshComponent(theorySalaryField);
            Utility.refreshComponent(actionSalaryField);
            Utility.refreshComponent(allActionSalaryField);
            Utility.refreshComponent(allTheorySalary);
            Utility.refreshComponent(allSalaryField);
            Utility.refreshComponent(allSalary2Field);
            Utility.refreshComponent(offField2);
            Utility.refreshComponent(otherSalaryField2);
            Utility.refreshComponent(fixSalaryField2);
            Utility.refreshComponent(countOfActionalField);
            Utility.refreshComponent(newRegistrationNameField);
            Utility.refreshComponent(newRegfieldName);
        }


    }

    public void changeRegisterLevel(ValueChangeEvent valueChangeEvent) {
        
        // Add event code here...
        if (valueChangeEvent.getNewValue() != null) {
            //define variables
            RegistrationManager rm = new RegistrationManager();
            SalaryParam sp = new SalaryParam();

            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {

                Row row = iter.getRowAtRangeIndex(index);

                this.currentSelectedLevel =
                        new Level((BigDecimal)row.getAttribute(0),
                                  (String)row.getAttribute(1));
        //        System.out.println("changedLevel =" +  this.currentSelectedLevel.getName()); 
                this.newRegistration.setLevel(this.currentSelectedLevel);  
                sp.setTerm(this.currentTerm);
                sp.setLevel(this.currentSelectedLevel);
                sp = rm.getSalaryParam(sp);
                

                if (sp.getActionSalary() != null) {

                    this.newRegistration.setFixShahriye(sp.getFixSalary());
                    this.newRegistration.setTheoryShahriye(sp.getTheorySalary());
                    this.newRegistration.setActionalShahriye(sp.getActionSalary());

                } //end of sp == null

                else {
                    this.ShowMessage("for this level hasn't been defined any param ");
                    this.newRegistration.setFixShahriye(new BigDecimal(0));
                    this.newRegistration.setTheoryShahriye(new BigDecimal(0));
                    this.newRegistration.setActionalShahriye(new BigDecimal(0));
                }
                refreshAllFields();
            }
        } else {

        }

    }

    public void fillParamSalaryFileds() {
        this.currentSelectedLevel = this.getCurrentSelectedLevel();
        RegistrationManager rm = new RegistrationManager();
        SalaryParam sp = new SalaryParam();
        sp.setTerm(this.currentTerm);
        sp.setLevel(this.getCurrentSelectedLevel());
        sp = rm.getSalaryParam(sp);
        if (sp != null) {
            this.fixSalaryField.setValue(sp.getFixSalary());
            this.theorySalaryField.setValue(sp.getTheorySalary());
            this.actionSalaryField.setValue(sp.getActionSalary());
            Utility.refreshComponent(fixSalaryField);
            Utility.refreshComponent(theorySalaryField);
            Utility.refreshComponent(actionSalaryField);
        } else {
            this.ShowMessage("for this level hasn't been defined any param ");
        }
    }

    public void setCurrentSelectedField(Field currentSelectedField) {
        this.currentSelectedField = currentSelectedField;
    }

    public Field getCurrentSelectedField1() {
        return currentSelectedField;
    }

    public void setCurrentSelectedLevel(Level currentSelectedLevel) {
        this.currentSelectedLevel = currentSelectedLevel;
    }

    public Level getCurrentSelectedLevel1() {
        return currentSelectedLevel;
    }

    public void setCurrentTerm(Term currentTerm) {
        this.currentTerm = currentTerm;
    }

    public Term getCurrentTerm() {
        return currentTerm;
    }

    public void calculateSalary(ActionEvent actionEvent) {
        RegistrationManager rm = new RegistrationManager();
        Registration registration = new Registration();
        if (this.actionSalaryField.getValue() != null)
            registration.setActionalShahriye(new BigDecimal((String)this.actionSalaryField.getValue()));
        registration.setField(this.getCurrentSelectedField());
        if (this.fixSalaryField.getValue() != null)
            registration.setFixShahriye(new BigDecimal((String)this.fixSalaryField.getValue()));
        registration.setLevel(this.getCurrentSelectedLevel());
        if (this.countOfActionalField.getValue() != null)
            registration.setNumberOfActionalUnits(Integer.valueOf((String)this.countOfActionalField.getValue()));
        if (this.countOfTheoryField.getValue() != null)
            registration.setNumberOfTheoryUnits(Double.valueOf((String)this.countOfTheoryField.getValue()));
        if (this.offField.getValue() != null)
            registration.setOffAmount(new BigDecimal((String)this.offField.getValue()));
        registration.setOffComment((String)this.offReasonField.getValue());
        registration.setOtherSalaryComment((String)this.otherPriceDescField.getValue());
        if (this.getOtherPriceField().getValue() != null)
            registration.setOtherShahriyAmount(new BigDecimal((String)this.getOtherPriceField().getValue()));
        registration.setRegDate(new Date());
        registration.setStudent(this.currentStudent);
        if (this.theorySalaryField.getValue() != null)
            registration.setTheoryShahriye((new BigDecimal((String)this.theorySalaryField.getValue())));
        registration.setTerm(this.currentTerm);

        if (this.actionSalaryField.getValue() == null ||
            this.fixSalaryField.getValue() == null ||
            this.countOfActionalField.getValue() == null ||
            this.countOfTheoryField.getValue() == null ||
            this.offField.getValue() == null ||
            this.getOtherPriceField().getValue() == null ||
            this.theorySalaryField.getValue() == null) {
            this.ShowMessage("please insert any of this fields : action , fixSalary , countOFActional, countOfTheory , off field, other price,theory salary");
        } else {
            registration.setTotalShahriye(rm.calculateRegistrationPrice(registration));
            this.ShowMessage("calculated = " +
                             registration.getTotalShahriye());
        }
    }

    public String registerInCurrentTerm() {

        RegistrationManager rm = new RegistrationManager();
  
        if (this.newRegistration.getField().getId() == null
            || this.newRegistration.getLevel().getId() == null )
        {
            this.ShowMessage("please insert  field or level");
        } else {
            this.currentAccount =
            rm.getAccountFromStudent(this.currentStudent);
        
            this.currentRegistration = rm.registerStudent(this.newRegistration);
            this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            this.updateStudentCurrentAccounting(this.currentStudent);
            return "register";
       
        }
        return "";

    }
    public String editRegisterInCurrentTerm() {

        RegistrationManager rm = new RegistrationManager();
    
        if (this.newRegistration.getField().getId() == null
            || this.newRegistration.getLevel().getId() == null )
        {
            this.ShowMessage("please insert  field or level");
        } else {
            this.currentAccount =
            rm.getAccountFromStudent(this.currentStudent);
        
            this.currentRegistration = rm.editRegisterStudent(this.newRegistration);
            this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            this.updateStudentCurrentAccounting(this.currentStudent);
            return "register";
        }
        return "";

    }
    
    public String deleteRegisterInCurrentTerm() {
        RegistrationManager rm = new RegistrationManager();
        int result = rm.deleteRegistration(this.newRegistration);
        if( result ==0) {
            this.ShowMessage("please delete all payments and checks");
        return "";
        }
        this.ShowMessage("delete of registration was successful");
        return "back";
    }
    public void setCurrentRegistration(Registration currentRegistration) {
        this.currentRegistration = currentRegistration;
    }

    public Registration getCurrentRegistration() {
        return currentRegistration;
    }

    public void setPayNaghdAmountField(RichInputText payNaghdAmountField) {
        this.payNaghdAmountField = payNaghdAmountField;
    }

    public RichInputText getPayNaghdAmountField() {
        return payNaghdAmountField;
    }

    public void setIsPos(boolean isPos) {
        this.isPos = isPos;
    }

    public boolean isIsPos() {
        return isPos;
    }

    public String newPay() {
        String returned = "";

        RegistrationManager rm = new RegistrationManager();
        AccountManager am = new AccountManager();

        if (new BigDecimal((String)this.getPayNaghdAmountField().getValue()).compareTo(this.getCurrebtStudentRegistrationAccounting().abs()) <=
            0 &&
            this.getCurrebtStudentRegistrationAccounting().compareTo(new BigDecimal(0)) !=
            0) {
            PaymentStep paymentStep = new PaymentStep();
            paymentStep.setCreateDate(new Date());
            paymentStep.setNextPayment((Date)this.nextPaymentDateField.getValue());
            paymentStep.setRegistration(this.getCurrentRegistration());

            RecievementPayment rp = new RecievementPayment();

            rp.setAccount(rm.getAccountFromStudent(this.currentStudent));

            if (this.isPos) {
                rp.setAccountBank(this.getCurrentSelectedAccountBank());
                rp.setRecievePayType(new RecievePayType(new BigDecimal(2),
                                                        "")); //for pos
            } else {
                rp.setAccountBank(am.getCash());
                rp.setRecievePayType(new RecievePayType(new BigDecimal(1),
                                                        "")); //for naghdi
            }
            rp.setAmount(new BigDecimal((String)this.getPayNaghdAmountField().getValue()));
            rp.setCode((String)this.getCodeRahgiriPayField().getValue());
            rp.setDescription((String)(this.getPayDescriptionFeild().getValue()));
            rp.setEventDate(new Date());

            paymentStep.setReceivementPaymentFinance(rp);

            rm.setPayForStudent(paymentStep);
            this.updateStudentCurrentAccounting(this.currentStudent);
            this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            returned = "newPay";
        } else {
            this.ShowMessage("mablaghe daryafti az bedehi in term bishtar ast");
        }
        return returned;
    }
   
    public String deletePaymentStep() {
        // Add event code here...
        
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getPaymentsStepsviewIterator");
                
                Row row = iter.getCurrentRow();
                
                if(row !=null) {
                    PaymentStepsView psv = (PaymentStepsView)((DCDataRow)row).getDataProvider();
                    PaymentStep ps = new PaymentStep();
                    ps.setPaymentStepId(psv.getPaymentStepId());
                    RecievementPayment rp = new RecievementPayment();
                    rp.setId(psv.getPaymentFinanceId());
                    ps.setReceivementPaymentFinance(rp);
                    
                    RegistrationManager rm = new RegistrationManager();
                    //TODO
                   int result = rm.deletePaymentStep(ps); 
                   if(result ==1) {
                       this.ShowMessage("delete was succcefull amount ="+ps.getReceivementPaymentFinance().getAmount());
                       this.updateStudentCurrentAccounting(this.currentStudent);
                       this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
                       returned = "newPay";
                      // iter.removeCurrentRow();
                  //     iter.executeQuery(); 
                   }
                   else {
                       this.ShowMessage("delete was not succcefull");
                   }
                }
                else {
                   this.ShowMessage("please select a payment step"); 
                }
        return returned;
    }
   
    public String refreshRegistrationAccounting() {
        this.updateStudentCurrentAccounting(this.currentStudent);
        this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
        return "update";
    }

    public void setNextPaymentDateField(RichInputDate nextPaymentDateField) {
        this.nextPaymentDateField = nextPaymentDateField;
    }

    public RichInputDate getNextPaymentDateField() {
        return nextPaymentDateField;
    }

    public void setCodeRahgiriPayField(RichInputText codeRahgiriPayField) {
        this.codeRahgiriPayField = codeRahgiriPayField;
    }

    public RichInputText getCodeRahgiriPayField() {
        return codeRahgiriPayField;
    }

    public void setPayDescriptionFeild(RichInputText payDescriptionFeild) {
        this.payDescriptionFeild = payDescriptionFeild;
    }

    public RichInputText getPayDescriptionFeild() {
        return payDescriptionFeild;
    }

    public String salaryWork() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("searchStudentsIterator");

        Row row = iter.getCurrentRow();
        if (row != null) {
            System.out.println("studnet code  = " +
                               row.getAttribute("studentCode"));
            System.out.println("count = " +
                               iter.getViewObject().getEstimatedRowCount());
            RegistrationManager rm = new RegistrationManager();
            this.currentStudent =
                    rm.getStudentfromStCode((BigDecimal)row.getAttribute("studentCode"));
            this.currentAccount =
                    rm.getAccountFromStudent(this.currentStudent);
            if (rm.isStudentRegister(this.currentStudent)) {
                this.currentTerm = rm.getCurrentTerm();
                this.currentRegistration =
                        rm.getRegistrationFromStudentAndTerm(this.currentStudent,
                                                             this.currentTerm);
                returned = "payments";
                this.updateStudentCurrentAccounting(this.currentStudent);
                this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            } else {
                this.ShowMessage("this student has not bean  registerd in this term");
            }
        } else {
            this.ShowMessage("please select a student");
        }
        return returned;
    }

    public void changeIsPos(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (isPos) {
            isPos = false;
        } else {
            isPos = true;
        }
        Utility.refreshComponent(payNaghtAccountBankFeild);
    }

    public void setPayNaghtAccountBankFeild(RichSelectOneChoice payNaghtAccountBankFeild) {
        this.payNaghtAccountBankFeild = payNaghtAccountBankFeild;
    }

    public RichSelectOneChoice getPayNaghtAccountBankFeild() {
        return payNaghtAccountBankFeild;
    }

    public String newCheck() {
        // Add event code here...i
        String returned = "";
        RegistrationManager rm = new RegistrationManager();
        AccountManager am = new AccountManager();

        if (new BigDecimal((String)this.checkAmountCreate.getValue()).compareTo(this.currebtStudentRegistrationAccounting.abs()) <=
            0 &&
            this.currebtStudentRegistrationAccounting.compareTo(new BigDecimal(0)) !=
            0) {
            RegistrationCheck registrationCheck = new RegistrationCheck();
            registrationCheck.setCreateDate(new Date());
            registrationCheck.setRegistartion(this.currentRegistration);

            Check check = new Check();
            check.setAccount(rm.getAccountFromStudent(this.currentStudent));
            check.setAccountBank(am.getCash()); //set cash for default
            check.setNumber((String)this.checkNumCreate.getValue()); //from form field
            check.setAmount(new BigDecimal((String)this.checkAmountCreate.getValue())); //from field form
            check.setBank(this.getCurrentSelectedBank()); //from form
            check.setBankBranch((String)this.getBankBrankCheckCreate().getValue()); //from form field
            check.setDescription((String)this.chechDescCreate.getValue()); //from form field
            check.setForHow((String)this.checkForHowCreate.getValue()); //from form field
            check.setCheckDate((Date)this.getCheckDateCreate().getValue()); //from from feild
            check.setCheckStatus(new CheckStatus(new BigDecimal(3),
                                                 "")); //primary
            check.setCreatedDate(new Date());
            registrationCheck.setCheck(check);
            rm.createRegistrationCheck(registrationCheck);
            this.updateStudentCurrentAccounting(this.currentStudent);
            this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            returned = "newCheck";
        } else {
            this.ShowMessage("mablaghe check az bedehi bishtar ast");
        }
        return returned;
    }

    public void setCheckNumCreate(RichInputText checkNumCreate) {
        this.checkNumCreate = checkNumCreate;
    }

    public RichInputText getCheckNumCreate() {
        return checkNumCreate;
    }

    public void setCheckAmountCreate(RichInputText checkAmountCreate) {
        this.checkAmountCreate = checkAmountCreate;
    }

    public RichInputText getCheckAmountCreate() {
        return checkAmountCreate;
    }

    public void setBankBrankCheckCreate(RichInputText bankBrankCheckCreate) {
        this.bankBrankCheckCreate = bankBrankCheckCreate;
    }

    public RichInputText getBankBrankCheckCreate() {
        return bankBrankCheckCreate;
    }

    public void setChechDescCreate(RichInputText chechDescCreate) {
        this.chechDescCreate = chechDescCreate;
    }

    public RichInputText getChechDescCreate() {
        return chechDescCreate;
    }

    public void setCheckForHowCreate(RichInputText checkForHowCreate) {
        this.checkForHowCreate = checkForHowCreate;
    }

    public RichInputText getCheckForHowCreate() {
        return checkForHowCreate;
    }

    public void setCheckDateCreate(RichInputDate checkDateCreate) {
        this.checkDateCreate = checkDateCreate;
    }

    public RichInputDate getCheckDateCreate() {
        return checkDateCreate;
    }

    public String returnCheck() {
        // Add event code here...
        String returned = "";
        AccountManager am = new AccountManager();
        Check check = this.getCurrentSelectedCheck();
        if (check != null) {
            if (check.getCheckStatus().getId().compareTo(new BigDecimal(1)) ==
                0)
                this.ShowMessage("this check has alreay returned");
            else if (check.getCheckStatus().getId().compareTo(new BigDecimal(2)) ==
                     0)
                this.ShowMessage("the passed check cant be returned");
            else {
                am.returnCheck(this.getCurrentSelectedCheck());
                returned = "newCheck";
                this.updateStudentCurrentAccounting(this.currentStudent);
                this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
            }
        } else {
            this.ShowMessage("please select a check");
            return "";
        }
        return returned;
    }

    public String passCheck() {
        // Add event code here...
        String returned = "";
        AccountManager am = new AccountManager();
        Check check = this.getCurrentSelectedCheck();
        if (check != null) {
            if (check.getCheckStatus().getId().compareTo(new BigDecimal(1)) ==
                0)
                this.ShowMessage("your check is returend and cant be passed");
            else if (check.getCheckStatus().getId().compareTo(new BigDecimal(2)) ==
                     0)
                this.ShowMessage("your check   already passed");
            else {
                am.passCheck(this.getCurrentSelectedCheck());
                returned = "newCheck";
                this.updateStudentCurrentAccounting(this.currentStudent);
            }
        } else {
            this.ShowMessage("please select a check");
            return "";
        }
        return returned;

    }

    public void setCurrentStudentAccounting(BigDecimal currentStudentAccounting) {
        this.currentStudentAccounting = currentStudentAccounting;
    }

    public BigDecimal getCurrentStudentAccounting() {
        return currentStudentAccounting;
    }

    public void updateStudentCurrentAccounting(Student student) {
        AccountManager am = new AccountManager();
        RegistrationManager rm = new RegistrationManager();
        System.out.println("current accounting  " + student.getFamily() +
                           "  =" +
                           am.getCurrentAccounting(rm.getAccountFromStudent(student)));
        this.currentStudentAccounting =
                am.getCurrentAccounting(rm.getAccountFromStudent(student));
    }

    public void updateStudentCurrentRegistationAccounting(Registration registration) {
        RegistrationManager rm = new RegistrationManager();
        this.currebtStudentRegistrationAccounting =
                rm.getStudentAccoutingInRegistration(registration);
    }

    public void setCurrebtStudentRegistrationAccounting(BigDecimal currebtStudentRegistrationAccounting) {
        this.currebtStudentRegistrationAccounting =
                currebtStudentRegistrationAccounting;
    }

    public BigDecimal getCurrebtStudentRegistrationAccounting() {
        return currebtStudentRegistrationAccounting;
    }

    public BigDecimal getCurrentStudentFirstAccounting() {
        RegistrationManager rm = new RegistrationManager();
        return rm.getAccountFromStudent(this.currentStudent).getFisrtPayable();
    }

    public void setReportManagement(ReportManagment reportManagement) {
        this.reportManagement = reportManagement;
    }

    public ReportManagment getReportManagement() {
        return reportManagement;
    }

    public String testReport() {
        String url =
            reportManagement.runrReportRegistration(this.currentRegistration.getId());

        System.out.println("report url = " + url);
        this.financeReport = url;
        return url;
    }

    public String getTermPaymentReport() {
        String url =
            reportManagement.runrReportRegistration(this.currentRegistration.getId());
        System.out.println("report url = " + url);
        this.financeReport = url;
        return url;
    }
    public String getTermContractReport() {
        String url =
            reportManagement.runrReportRegistrationContract(this.currentRegistration.getId());
        System.out.println("report url = " + url);
        return url;
    }
    public String getTotalFinanceReport() {
        RegistrationManager rm = new RegistrationManager();


        //String url=  reportManagement.runrReportTotalFinance(new BigDecimal(15557));
        String url =
            reportManagement.runrReportTotalFinance(rm.getAccountFromStudent(this.currentStudent).getId());

        System.out.println("report url = " + url);
        //   this.financeReport = url;
        return url;
    }

    public void setFinanceReport(String financeReport) {
        this.financeReport = financeReport;
    }

    public String getFinanceReport() {
        //  this.financeReport = testReport();
        return financeReport;
    }

    public void setCurrentAccount(Account currentAccount) {
        this.currentAccount = currentAccount;
    }

    public Account getCurrentAccount() {
        return currentAccount;
    }

    public String changeFirstAccounting() {
        // Add event code here...
        AccountManager am = new AccountManager();
        am.updateAccount(this.currentAccount);
        this.currentStudentAccounting =
                am.getCurrentAccounting(this.currentAccount);
        return "changeFirstAccount";
    }

    public String payNaghEditStudent() {
        String returned = "";
        AccountManager am = new AccountManager();
        RecievementPayment rp = new RecievementPayment();
        rp.setAccount(this.currentAccount);

        if (this.isPos) {
            rp.setAccountBank(this.getCurrentSelectedAccountBank());
            rp.setRecievePayType(new RecievePayType(new BigDecimal(2),
                                                    "")); //for pos
        } else {
            rp.setAccountBank(am.getCash());
            rp.setRecievePayType(new RecievePayType(new BigDecimal(1),
                                                    "")); //for naghdi
        }

        rp.setCode((String)this.getCodeRahgiriPayField().getValue());
        rp.setDescription((String)(this.getPayDescriptionFeild().getValue()));
        if (this.getPayNaghdAmountField().getValue() != null)
            rp.setAmount(new BigDecimal((String)(this.getPayNaghdAmountField().getValue())));

        rp.setEventDate(new Date());

        if (this.getPayNaghdAmountField().getValue() != null) {
            am.setPayForAccount(rp);
            this.currentStudentAccounting =
                    am.getCurrentAccounting(this.currentAccount);
            returned = "newPay";
        } else {
            this.ShowMessage("please inter a valid value for naghd mablagh");
        }
        return returned;
    }

    public String payToStudent() {
        String returned = "";
        AccountManager am = new AccountManager();
        RecievementPayment rp = new RecievementPayment();
        rp.setAccount(this.currentAccount);
        rp.setAccountBank(am.getCash());
        rp.setRecievePayType(new RecievePayType(new BigDecimal(1),
                                                "")); //for naghdi

        // rp.setCode((String)this.getCodeRahgiriPayField().getValue());
        rp.setDescription((String)(this.getPayToStudentDescriptionField().getValue()));
        if (this.getPayToStudentAmountField().getValue() != null)
            rp.setAmount(new BigDecimal((String)(this.getPayToStudentAmountField().getValue())).negate());

        rp.setEventDate(new Date());

        if (this.getPayToStudentAmountField().getValue() != null) {
            am.setPayForAccount(rp);
            this.currentStudentAccounting =
                    am.getCurrentAccounting(this.currentAccount);
            returned = "newPay";
        } else {
            this.ShowMessage("please inter a valid value for naghd mablagh");
        }
        return returned;
    }
    
    public void setPayToStudentAmountField(RichInputText payToStudentAmountField) {
        this.payToStudentAmountField = payToStudentAmountField;
    }

    public RichInputText getPayToStudentAmountField() {
        return payToStudentAmountField;
    }

    public void setPayToStudentDescriptionField(RichInputText payToStudentDescriptionField) {
        this.payToStudentDescriptionField = payToStudentDescriptionField;
    }

    public RichInputText getPayToStudentDescriptionField() {
        return payToStudentDescriptionField;
    }

    public String caclucateEditShahriye() {
        RegistrationManager rm = new RegistrationManager();

        this.ShowMessage("calculated shahriye is " +
                         rm.calculateRegistrationPrice(this.currentRegistration));
        return null;
    }

    public String editRegistration() {
        RegistrationManager rm = new RegistrationManager();
        currentRegistration.setTotalShahriye(rm.calculateRegistrationPrice(currentRegistration));
        this.currentRegistration =
                rm.editRegisterStudent(this.currentRegistration);
        this.updateStudentCurrentAccounting(this.currentStudent);
        this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
        ShowMessage("registration is edited");
        return "editReg";
    }

    public BigDecimal getCountOfTodayRegistrations() {
        RegistrationManager rm = new RegistrationManager();
        return rm.getCountOfTodayRegistrations();
    }

    public BigDecimal getCountOfCurrentTermRegistrations() {
        RegistrationManager rm = new RegistrationManager();
        return rm.getCountOfCurrentTermRegistrations();
    }

    public BigDecimal getCountOfActiveStudents() {
        RegistrationManager rm = new RegistrationManager();
        return rm.getCountOfActiveStudents();
    }

    public BigDecimal getCountOfAllStudents() {
        RegistrationManager rm = new RegistrationManager();
        return rm.getCountOfAllStudents();
    }

    public void changeStudentStatus(ValueChangeEvent valueChangeEvent) {
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allStudentStatusIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                this.studentStatus = new StudentStatus();
                this.studentStatus.setStatusId((BigDecimal)(row.getAttribute(0)));
                this.studentStatus.setName((String)(row.getAttribute(1)));
                this.isShowAllStatus = false;
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(this.statusFieldText);
                Utility.refreshComponent(this.statusSelectedCheckBox);
            }
        } else {
        }
    }

    public void setStudentListTables(RichTable studentListTables) {
        this.studentListTables = studentListTables;
    }

    public RichTable getStudentListTables() {
        return studentListTables;
    }

    public void setT(RichInputNumberSpinbox t) {
        this.t = t;
    }

    public RichInputNumberSpinbox getT() {
        return t;
    }

    public void setIsRegInTermFilter(Boolean isRegInTermFilter) {
        this.isRegInTermFilter = isRegInTermFilter;
    }

    public Boolean getIsRegInTermFilter() {
        return isRegInTermFilter;
    }

    public void changeIsRegInTer(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        Utility.refreshComponent(this.getStudentListTables());
        Utility.refreshComponent(this.getStudentListCount());
       // Utility.refreshComponent(levelGroupLayout);
        Utility.refreshComponent(levelListOneChoice);
        Utility.refreshComponent(levelFieldForSearch);
        Utility.refreshComponent(levelIsSelectedCheckBox);
        
        Utility.refreshComponent(fieldListSelectOneChoice);
        Utility.refreshComponent(fieldForSearch);
        Utility.refreshComponent(fieldSelectedCheckBox);
        
        
        System.out.println("row count is " +
                           getStudentListTables().getRowCount());
    }

    public void setStudentListCount(RichInputText studentListCount) {
        this.studentListCount = studentListCount;
    }

    public RichInputText getStudentListCount() {
        return studentListCount;
    }

    public void setAllActionSalaryField(RichInputText allActionSalaryField) {
        this.allActionSalaryField = allActionSalaryField;
    }

    public RichInputText getAllActionSalaryField() {
        return allActionSalaryField;
    }

    public void setAllTheorySalary(RichInputText allTheorySalary) {
        this.allTheorySalary = allTheorySalary;
    }

    public RichInputText getAllTheorySalary() {
        return allTheorySalary;
    }

    public void setAllSalaryField(RichInputText allSalaryField) {
        this.allSalaryField = allSalaryField;
    }

    public RichInputText getAllSalaryField() {
        return allSalaryField;
    }

    public void setNewRegistration(Registration newRegistration) {
        this.newRegistration = newRegistration;
    }

    public Registration getNewRegistration() {
        return newRegistration;
    }

    public void setNewRegTotalTheorySalary(BigDecimal newRegTotalTheorySalary) {
        this.newRegTotalTheorySalary = newRegTotalTheorySalary;
    }

    public BigDecimal getNewRegTotalTheorySalary() {
        return newRegTotalTheorySalary;
    }

    public void setNewRegTotalActionalSalary(BigDecimal newRegTotalActionalSalary) {
        this.newRegTotalActionalSalary = newRegTotalActionalSalary;
    }

    public BigDecimal getNewRegTotalActionalSalary() {
        return newRegTotalActionalSalary;
    }

    public void setNewRegTotalSalary(BigDecimal newRegTotalSalary) {
        this.newRegTotalSalary = newRegTotalSalary;
    }

    public BigDecimal getNewRegTotalSalary() {
        return newRegTotalSalary;
    }

    public void setAllSalary2Field(RichInputText allSalary2Field) {
        this.allSalary2Field = allSalary2Field;
    }

    public RichInputText getAllSalary2Field() {
        return allSalary2Field;
    }

    public void setOffField2(RichInputText offField2) {
        this.offField2 = offField2;
    }

    public RichInputText getOffField2() {
        return offField2;
    }

    public void setOtherSalaryField2(RichInputText otherSalaryField2) {
        this.otherSalaryField2 = otherSalaryField2;
    }

    public RichInputText getOtherSalaryField2() {
        return otherSalaryField2;
    }

    public void setFixSalaryField2(RichInputText fixSalaryField2) {
        this.fixSalaryField2 = fixSalaryField2;
    }

    public RichInputText getFixSalaryField2() {
        return fixSalaryField2;
    }

    public void changeFixSalary(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setFixShahriye((BigDecimal)valueChangeEvent.getNewValue());
        refreshAllFields();
    }

    public void changeCountOfTheory(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setNumberOfTheoryUnits((Double)valueChangeEvent.getNewValue());
        this.newRegistration.setNumberOfActionalUnits(Integer.valueOf(String.valueOf(Math.round(this.newRegistration.getNumberOfTheoryUnits() *
                                                                                                6))));

        refreshAllFields();
    }

    public void changeNumberOfActional(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setNumberOfActionalUnits((Integer)valueChangeEvent.getNewValue());
        refreshAllFields();
    }

    public void changeSalaryOfActional(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setActionalShahriye((BigDecimal)(valueChangeEvent.getNewValue()));
        refreshAllFields();
    }

    public void changeSalaryOfTheory(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setTheoryShahriye((BigDecimal)valueChangeEvent.getNewValue());
        refreshAllFields();
    }

    public void changeOtherPrice(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        this.newRegistration.setOtherShahriyAmount((BigDecimal)(valueChangeEvent.getNewValue()));
        refreshAllFields();
    }

    public void changeOffAmount(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
       this.newRegistration.setOffAmount((BigDecimal)valueChangeEvent.getNewValue());
       refreshAllFields();
    }

    public void setNewRegistrationNameField(RichInputText newRegistrationNameField) {
        this.newRegistrationNameField = newRegistrationNameField;
    }

    public RichInputText getNewRegistrationNameField() {
        return newRegistrationNameField;
    }

    public void setNewRegfieldName(RichInputText newRegfieldName) {
        this.newRegfieldName = newRegfieldName;
    }

    public RichInputText getNewRegfieldName() {
        return newRegfieldName;
    }

    public void setNewRegistrationIsRegInTerm(Boolean newRegistrationIsRegInTerm) {
        this.newRegistrationIsRegInTerm = newRegistrationIsRegInTerm;
    }

    public Boolean getNewRegistrationIsRegInTerm() {
        return newRegistrationIsRegInTerm;
    }

    public String deleteCheck() {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getRegistrationChecksViewIterator");
                
                Row row = iter.getCurrentRow();
                RegistrationManager rm = new RegistrationManager();
                if(row !=null) {
                     
                    RegistrationCheckView pcv = (RegistrationCheckView)((DCDataRow)row).getDataProvider();
                    RegistrationCheck pc = new RegistrationCheck();
                    Check check = new Check();
                    check.setId(pcv.getCheckId());
                    pc.setCheck(check);
                    pc.setId(pcv.getId());
                   
                    if (pcv.getCheckStatusId().compareTo(new BigDecimal(3)) !=
                        0) 
                    {
                        this.ShowMessage("check in  "+pcv.getCheckStatusName()+"cant be delete");
                        return returned;
                    }
                    
                int result =rm.deleteRegistrationCheck(pc); 
                if(result == 1) {
                    returned="newCheck";
                    this.updateStudentCurrentAccounting(this.currentStudent);
                    this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
                    
                    this.ShowMessage("deletion of check was succesfull");
                }
                else {
                    this.ShowMessage("there is a problem on check deletion");
                }
                                }
        return returned;
    }

    public String editStudentMethod() {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        rm.editStudent(this.currentStudent);
        this.ShowMessage("\u0648\u064A\u0631\u0627\u064A\u0634 \u0627\u0637\u0644\u0627\u0639\u0627\u062A \u0628\u0647 \u062F\u0631\u0633\u062A\u064A \u0627\u0646\u062C\u0627\u0645 \u0634\u062F");
        return null;
    }
    public String clearAllData() {
         stNameField = null;
         stFamilyField =null;
         stIdentityCodeField=null;
        stFatherFiled=null;
         stAddressFiled=null;
         stMobileField=null;
        stPhonFiled=null;
         stCodefield=null;
         stIdNum=null;
         stIdSerialField=null;
        createdNewStudent=null;
        
        
        stDescriptionField=null;
        stDateOfBirthField=null;
         stArchiveCode=null;
         stCharNumber=null;  
        System.out.println("st code filed : "+this.stCodefield);
        return"";
    }

    public void setStNameField(RichInputText stNameField) {
        this.stNameField = stNameField;
    }

    public RichInputText getStNameField() {
        return stNameField;
    }

    public void setStFamilyField(RichInputText stFamilyField) {
        this.stFamilyField = stFamilyField;
    }

    public RichInputText getStFamilyField() {
        return stFamilyField;
    }

    public void setStIdentityCodeField(RichInputText stIdentityCodeField) {
        this.stIdentityCodeField = stIdentityCodeField;
    }

    public RichInputText getStIdentityCodeField() {
        return stIdentityCodeField;
    }

    public void setStFatherFiled(RichInputText stFatherFiled) {
        this.stFatherFiled = stFatherFiled;
    }

    public RichInputText getStFatherFiled() {
        return stFatherFiled;
    }

    public void setStAddressFiled(RichInputText stAddressFiled) {
        this.stAddressFiled = stAddressFiled;
    }

    public RichInputText getStAddressFiled() {
        return stAddressFiled;
    }

    public void setStMobileField(RichInputText stMobileField) {
        this.stMobileField = stMobileField;
    }

    public RichInputText getStMobileField() {
        return stMobileField;
    }

    public void setStPhonFiled(RichInputText stPhonFiled) {
        this.stPhonFiled = stPhonFiled;
    }

    public RichInputText getStPhonFiled() {
        return stPhonFiled;
    }

    public void setStCodefield(RichInputText stCodefield) {
        this.stCodefield = stCodefield;
    }

    public RichInputText getStCodefield() {
        return stCodefield;
    }

    public void setStIdNum(RichInputText stIdNum) {
        this.stIdNum = stIdNum;
    }

    public RichInputText getStIdNum() {
        return stIdNum;
    }

    public void setStIdSerialField(RichInputText stIdSerialField) {
        this.stIdSerialField = stIdSerialField;
    }

    public RichInputText getStIdSerialField() {
        return stIdSerialField;
    }

    public void setCreatedNewStudent(Student createdStudent) {
        this.createdNewStudent = createdStudent;
    }

    public Student getCreatedNewStudent() {
        return createdNewStudent;
    }
    public void generateSt_code(ActionEvent actionEvent) {
        // Add event code here...
      String generateCode="";   
      if(stIdSerialField.getValue() != null && this.stCharNumber.getValue() != null )
      {
     // System.out.println(rm.generateStudentCode((String)stIdSerialField.getValue(),this.identifierChar));
      
      
      String charNumberVal = (String)this.stCharNumber.getValue();
      String IdSerialVal = (String)stIdSerialField.getValue();
      
      
      
      if(this.identifierChar <=32) {
          generateCode = this.identifierChar+ (String)this.stCharNumber.getValue()+ (String)stIdSerialField.getValue();    
      }
      else if (this.identifierChar>=42 && this.identifierChar<54) {
          
         int id = identifierChar-41;
        if(id<10)
         generateCode = "420"+id+(String)stIdSerialField.getValue();
        else
          generateCode = "42"+id+(String)stIdSerialField.getValue(); 
        
      }
      else {
          this.ShowMessage("there is an error on char number");
      }

      System.out.println("st code is ="+generateCode + " charNumberVal ="+charNumberVal+"IdSerialVal = "+IdSerialVal);
      
      
      
      this.stCodefield.setValue(generateCode);
      
            }
      else {
          //this.ShowMessage("please insert a value for serial field and stCharNumber");
          this.ShowMessage("\u0644\u0637\u0641\u0627 \u0628\u0631\u0627\u06CC \u0641\u06CC\u0644\u062F \u0647\u0627\u06CC \u0633\u0631\u06CC\u0627\u0644 \u0634\u0646\u0627\u0633\u0646\u0627\u0645\u0647 \u0648 \u0634\u0645\u0627\u0631\u0647 \u06A9\u0627\u0631\u0627\u06A9\u062A\u0631  \u0645\u0642\u062F\u0627\u0631 \u0648\u0627\u0631\u062F \u06A9\u0646\u06CC\u062F");
      }
    }

    public void setIdentifierChar(int identifierChar) {
        this.identifierChar = identifierChar;
    }

    public int getIdentifierChar() {
        return identifierChar;
    }

    public void setOrganizationNew(Organization organization) {
        this.organizationNew = organization;
    }

    public Organization getOrganizationNew() {
        return organizationNew;
    }

    public void setStudentStatusNew(StudentStatus studentStatus) {
        this.studentStatusNew = studentStatus;
    }

    public StudentStatus getStudentStatusNew() {
        return studentStatusNew;
    }

      //  this.createdStudent.setStudentCode(rm.generateStudentCode(createdStudent.getIdentifierSerial(), createdStudent.getIdentifierChar()));
    

    public void changeIdChar(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if(valueChangeEvent.getNewValue()!=null){
                int index =
                    Integer.parseInt(valueChangeEvent.getNewValue().toString());
                DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allIdentiferCharsIterator");
                if (index < iter.getViewObject().getEstimatedRowCount()) {
                    Row row = iter.getRowAtRangeIndex(index);
                    this.setIdentifierChar((Integer)row.getAttribute(0));
                  //   System.out.println((Integer)row.getAttribute(0));   
                }
                }else{
                    
                }
    }
    public String createAction(ActionEvent actionEvent) {
        // Add event code here...
        System.out.println("family : "+this.getStFamilyField().getValue());
        System.out.println(" name: "+this.getStNameField().getValue());
        System.out.println( this.identifierChar + stIdSerialField.getValue().toString());
        RegistrationManager rm = new RegistrationManager();
        createdNewStudent = new Student();
        createdNewStudent.setAddress((String)this.getStAddressFiled().getValue());
        createdNewStudent.setArchiveCode((String)this.getStArchiveCode().getValue());
        createdNewStudent.setCreated_date(new Date());
        if(this.getStDateOfBirthField().getValue()!=null)
        createdNewStudent.setDateOfBirth((Date)this.getStDateOfBirthField().getValue() );
        createdNewStudent.setDescription((String)this.getStDescriptionField().getValue());
        createdNewStudent.setFamily((String)this.getStFamilyField().getValue());
        createdNewStudent.setFatherName((String)this.getStFatherFiled().getValue());
        createdNewStudent.setIdentifierChar((Integer)this.getIdentifierChar());
        createdNewStudent.setIdentifierCode((String)this.getStCodefield().getValue());
        createdNewStudent.setIdentifierSerial((String)this.getStIdSerialField().getValue());
        createdNewStudent.setLastModified(new Date());
        createdNewStudent.setName((String)this.getStNameField().getValue());
        createdNewStudent.setNationalId((String)getStIdentityCodeField().getValue());
        createdNewStudent.setOrganization(this.organizationNew);
        createdNewStudent.setPhone((String)this.getStPhonFiled().getValue());
        createdNewStudent.setStudentCode(new BigDecimal( (String)this.getStCodefield().getValue()));
        createdNewStudent.setStudentStatus(this.studentStatusNew);
        rm.createNewStudent(createdNewStudent);
     //   this.ShowMessage("student was created");
        this.ShowMessage("\u062F\u0627\u0646\u0634 \u0622\u0645\u0648\u0632 \u0628\u0647 \u062F\u0631\u0633\u062A\u06CC \u0627\u06CC\u062C\u0627\u062F \u0634\u062F");
        return "";
    }

    public void changeOrg(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if(valueChangeEvent.getNewValue()!=null){
                int index =
                    Integer.parseInt(valueChangeEvent.getNewValue().toString());
                DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allOrganizationIterator");
                if (index < iter.getViewObject().getEstimatedRowCount()) {
                    Row row = iter.getRowAtRangeIndex(index);
                    
                    this.organizationNew = new Organization((BigDecimal)row.getAttribute(1),(String)row.getAttribute(0));
                          
                }
                }else{
                    
                }
    }

    public void changeStStatus(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if(valueChangeEvent.getNewValue()!=null){
                int index =
                    Integer.parseInt(valueChangeEvent.getNewValue().toString());
                DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allStudentStatusIterator");
                if (index < iter.getViewObject().getEstimatedRowCount()) {
                    Row row = iter.getRowAtRangeIndex(index);
                    this.studentStatusNew = new StudentStatus((BigDecimal)row.getAttribute(0),(String)row.getAttribute(1));
                        
                }
                }else{
                    
                }
    }
    

    public void setStDescriptionField(RichInputText stDescriptionField) {
        this.stDescriptionField = stDescriptionField;
    }

    public RichInputText getStDescriptionField() {
        return stDescriptionField;
    }

    public void setStDateOfBirthField(RichInputDate stDateOfBirthField) {
        this.stDateOfBirthField = stDateOfBirthField;
    }

    public RichInputDate getStDateOfBirthField() {
        return stDateOfBirthField;
    }

    public void setStArchiveCode(RichInputText stArchiveCode) {
        this.stArchiveCode = stArchiveCode;
    }

    public RichInputText getStArchiveCode() {
        return stArchiveCode;
    }

    public String createStudent() {
        // Add event code here...
        String returned ="";
        RegistrationManager rm = new RegistrationManager();
        createdNewStudent = new Student();
        createdNewStudent.setAddress((String)this.getStAddressFiled().getValue());
        createdNewStudent.setArchiveCode((String)this.getStArchiveCode().getValue());
        createdNewStudent.setCreated_date(new Date());
        if(this.getStDateOfBirthField().getValue()!=null)
        createdNewStudent.setDateOfBirth((Date)this.getStDateOfBirthField().getValue() );
        createdNewStudent.setDescription((String)this.getStDescriptionField().getValue());
        createdNewStudent.setFamily((String)this.getStFamilyField().getValue());
        createdNewStudent.setFatherName((String)this.getStFatherFiled().getValue());
        createdNewStudent.setIdentifierChar((Integer)this.getIdentifierChar());
        createdNewStudent.setIdentifierCode((String)this.getStIdNum().getValue());
        createdNewStudent.setIdentifierSerial((String)this.getStIdSerialField().getValue());
        createdNewStudent.setLastModified(new Date());
        createdNewStudent.setName((String)this.getStNameField().getValue());
        
        createdNewStudent.setMobile((String)this.getStMobileField().getValue());
        
        
        if(getStIdentityCodeField() .getValue()!=null)
        createdNewStudent.setNationalId((String)getStIdentityCodeField().getValue());
        createdNewStudent.setOrganization(this.organizationNew);
        createdNewStudent.setPhone((String)this.getStPhonFiled().getValue());
        if(this.getStCodefield().getValue()!=null)
        createdNewStudent.setStudentCode(new BigDecimal( (String)this.getStCodefield().getValue()));
        createdNewStudent.setStudentStatus(this.studentStatusNew);
        if(this.getStNameField().getValue()==null
           || this.getStFamilyField().getValue()==null
           || this.getStCodefield().getValue() == null )
        {
           // this.ShowMessage("please insert some value for any of these fields: name , st_code ");
            this.ShowMessage("\u0644\u0637\u0641\u0627 \u0628\u0631\u0627\u06CC \u0641\u06CC\u0644\u062F \u0647\u0627\u06CC \u0646\u0627\u0645 \u060C\u0646\u0627\u0645 \u062E\u0627\u0646\u0648\u062F\u0627\u06AF\u06CC \u0648 \u06A9\u062F \u062F\u0627\u0646\u0634 \u0622\u0645\u0648\u0632\u06CC \u0645\u0642\u062F\u0627\u0631 \u0648\u0627\u0631\u062F \u06A9\u0646\u06CC\u062F");
        }
        else if(rm.isStudentCodeExists(createdNewStudent.getStudentCode())) {
          //  this.ShowMessage("a student with st_code "+createdStudent.getStudentCode()+"is exist");
          this.ShowMessage("\u0627\u06CC\u0646 \u06A9\u062F \u062F\u0627\u0646\u0634 \u0622\u0645\u0648\u0632\u06CC \u0642\u0628\u0644\u0627 \u062F\u0631 \u0633\u06CC\u0633\u062A\u0645 \u062B\u0628\u062A \u0634\u062F\u0647 \u0627\u0633\u062A :"+createdNewStudent.getStudentCode());
       
        }
        else if(getStIdentityCodeField().getValue()!=null && rm.isStudentNatinalCodeExist(createdNewStudent.getNationalId())) {
            this.ShowMessage("this natinal code is already exist");
            System.out.println("this natinal code is already exist");
        }
        else
        {
        rm.createNewStudent(createdNewStudent);
        
        this.ShowMessage("\u062F\u0627\u0646\u0634 \u0622\u0645\u0648\u0632 \u0628\u0647 \u062F\u0631\u0633\u062A\u06CC \u062F\u0631 \u0633\u06CC\u0633\u062A\u0645 \u062B\u0628\u062A \u0634\u062F");
        //this.ShowMessage("student was created");
        
        returned = "create";
       
                     AccountManager am = new AccountManager();
                     this.currentStudent = createdNewStudent;
                     this.currentAccount =
                             rm.getAccountFromStudent(this.currentStudent);
                     this.currentStudentAccounting =
                             am.getCurrentAccounting(this.currentAccount);
       
       
                 }
        return returned;
    }

    public void setStCharNumber(RichInputText stCharNumber) {
        this.stCharNumber = stCharNumber;
    }

    public RichInputText getStCharNumber() {
        return stCharNumber;
    }

    public String gotoRegister() {
        // Add event code here...
        String returned ="";
        RegistrationManager rm = new RegistrationManager();
        if (!rm.isStudentRegister(this.currentStudent)) {
            newRegistrationIsRegInTerm=false;
            this.currentTerm = rm.getCurrentTerm();
            if (this.currentTerm != null) {
                System.out.println("father name :" +
                                   this.currentStudent.getFatherName());
                this.newRegistration = new Registration();
                this.newRegistration.setTerm(this.currentTerm);
                this.newRegistration.setStudent(this.currentStudent);
                this.newRegistration.setNumberOfTheoryUnits(0);
                this.newRegistration.setNumberOfActionalUnits(0);
                this.newRegistration.setOffAmount(new BigDecimal(0));
                this.newRegistration.setOtherShahriyAmount(new BigDecimal(0));
                this.newRegistration.setFixShahriye(new BigDecimal(0));
                this.newRegistration.setTheoryShahriye(new BigDecimal(0));
                this.newRegistration.setActionalShahriye(new BigDecimal(0));
                
                this.newRegistration.setLevel(new Level());
                this.newRegistration.setField(new Field());
                this.newRegistration.setBase(new Base());
                this.newRegTotalActionalSalary = null;
                this.newRegTotalTheorySalary = null;
                this.newRegTotalSalary = null;

                returned = "register";
            } else {
                this.ShowMessage("please set deafult term");
            }
        } else {
            newRegistrationIsRegInTerm=true;
            this.ShowMessage("this student has bean  registerd in this term");
            this.newRegistration =
                    rm.getRegistrationFromStudentAndTerm(this.currentStudent,
                                                         rm.getCurrentTerm());
            this.newRegTotalActionalSalary =
                    this.newRegistration.getActionalShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfActionalUnits()));
            this.newRegTotalTheorySalary =
                    this.newRegistration.getTheoryShahriye().multiply(new BigDecimal(this.newRegistration.getNumberOfTheoryUnits()));
            this.newRegTotalSalary =
                    this.newRegistration.getTotalShahriye().add(this.newRegistration.getOffAmount());
            returned = "register";
        }
        
        
        return returned;
    }

    public String gotoEditStudent() {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        AccountManager am = new AccountManager();
        
        this.currentAccount =
                rm.getAccountFromStudent(this.currentStudent);
        this.currentStudentAccounting =
                am.getCurrentAccounting(this.currentAccount);
        
        return "editStudent";
    }


    public String gotoPayments() {
        // Add event code here...
        
        RegistrationManager rm = new RegistrationManager();
        
        this.currentAccount =
                rm.getAccountFromStudent(this.currentStudent);
            this.currentRegistration =this.newRegistration;
            
            this.updateStudentCurrentAccounting(this.currentStudent);
            this.updateStudentCurrentRegistationAccounting(this.currentRegistration);
        
        return "payments";
    }

    public void setIsShowAllStatus(Boolean isShowAllStatus) {
        this.isShowAllStatus = isShowAllStatus;
    }

    public Boolean getIsShowAllStatus() {
        return isShowAllStatus;
    }

    public void changeShowAllStatuses(ValueChangeEvent valueChangeEvent) {
       Boolean value=(Boolean)valueChangeEvent.getNewValue(); 
       if( value == true) {
           this.studentStatus = new StudentStatus(new BigDecimal(-1),"all");
       }
        Utility.refreshComponent(this.getStudentListTables());
        Utility.refreshComponent(this.getStudentListCount());
        Utility.refreshComponent(this.statusFieldText);
        
        System.out.println("row count is " +
                           getStudentListTables().getRowCount());
    }

    public void changeOrganization(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allOrganizationIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                this.organization = new Organization();
                this.organization.setId((BigDecimal)(row.getAttribute(1)));
                this.organization.setName((String)(row.getAttribute(0)));
                this.isShowAllOrg=false;
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(organizationFieldText);
                Utility.refreshComponent(organizationSelectedCheckBox);
            }
        } else {
        }
        
        
    }

    public void setIsShowAllOrg(Boolean isShowAllOrg) {
        this.isShowAllOrg = isShowAllOrg;
    }

    public Boolean getIsShowAllOrg() {
        return isShowAllOrg;
    }

    public void changeAllOrg(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        Boolean value=(Boolean)valueChangeEvent.getNewValue(); 
        if( value == true) {
            this.organization = new Organization(new BigDecimal(-1),"all");
        }
        else {
            
        }
         
         Utility.refreshComponent(this.getStudentListTables());
         Utility.refreshComponent(this.getStudentListCount());
         Utility.refreshComponent(this.organizationFieldText);
    }

    public void changeFeildList(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
    
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                this.field = new Field();
                this.field.setId((BigDecimal)(row.getAttribute(0)));
                this.field.setName((String)(row.getAttribute(1)));
                this.isShowAllField=false;
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(this.fieldForSearch);
                Utility.refreshComponent(fieldSelectedCheckBox);
            }
        } else {
        }
    
    }

    public void setLevelFieldForSearch(RichInputText levelFieldForSearch) {
        this.levelFieldForSearch = levelFieldForSearch;
    }

    public RichInputText getLevelFieldForSearch() {
        return levelFieldForSearch;
    }

    public void changeLevel(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getNewValue() != null) {
            int index =
                Integer.parseInt(valueChangeEvent.getNewValue().toString());
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
            if (index < iter.getViewObject().getEstimatedRowCount()) {
                Row row = iter.getRowAtRangeIndex(index);
                this.level = new Level();
                this.level.setId((BigDecimal)(row.getAttribute(0)));
                this.level.setName((String)(row.getAttribute(1)));
                isShowAllLevel=false;
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(this.levelFieldForSearch);
                Utility.refreshComponent(levelIsSelectedCheckBox); 
            }
        } else {
        }
        
    
    }

    public void setFieldForSearch(RichInputText fieldForSearch) {
        this.fieldForSearch = fieldForSearch;
    }

    public RichInputText getFieldForSearch() {
        return fieldForSearch;
    }

    public void setIsShowAllField(Boolean isShowAllField) {
        this.isShowAllField = isShowAllField;
    }

    public Boolean getIsShowAllField() {
        return isShowAllField;
    }

    public void setIsShowAllLevel(Boolean isShowAllLevel) {
        this.isShowAllLevel = isShowAllLevel;
    }

    public Boolean getIsShowAllLevel() {
        return isShowAllLevel;
    }

    public void chageShowAllField(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        Boolean value=(Boolean)valueChangeEvent.getNewValue(); 
        if( value == true) {
            this.field = new Field(new BigDecimal(-1),"all");
        
         
         Utility.refreshComponent(this.getStudentListTables());
         Utility.refreshComponent(this.getStudentListCount());
         Utility.refreshComponent(this.fieldForSearch);
         System.out.println("row count is " +
                            getStudentListTables().getRowCount());
        }
        else {
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");
            Row row = iter.getCurrentRow();
            if (row != null) {
                this.field = new Field();
                field.setName((String)row.getAttribute(1));
                field.setId((BigDecimal)row.getAttribute(0));
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(this.fieldForSearch);  
            }
        }
    }

    public void changeShowAllLevels(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
   
        Boolean value=(Boolean)valueChangeEvent.getNewValue(); 
        if( value == true) {
            this.level = new Level(new BigDecimal(-1),"all");
        }
         
         Utility.refreshComponent(this.getStudentListTables());
         Utility.refreshComponent(this.getStudentListCount());
         Utility.refreshComponent(this.levelFieldForSearch);
         System.out.println("row count is " +
                            getStudentListTables().getRowCount());
        }

    public void setLevelGroupLayout(RichPanelGroupLayout levelGroupLayout) {
        this.levelGroupLayout = levelGroupLayout;
    }

    public RichPanelGroupLayout getLevelGroupLayout() {
        return levelGroupLayout;
    }

    public void setLevelListOneChoice(RichSelectOneChoice levelListOneChoice) {
        this.levelListOneChoice = levelListOneChoice;
    }

    public RichSelectOneChoice getLevelListOneChoice() {
        return levelListOneChoice;
    }

    public void setLevelIsSelectedCheckBox(RichSelectBooleanCheckbox levelIsSelectedCheckBox) {
        this.levelIsSelectedCheckBox = levelIsSelectedCheckBox;
    }

    public RichSelectBooleanCheckbox getLevelIsSelectedCheckBox() {
        return levelIsSelectedCheckBox;
    }

    public void setFieldListSelectOneChoice(RichSelectOneChoice fieldListSelectOneChoice) {
        this.fieldListSelectOneChoice = fieldListSelectOneChoice;
    }

    public RichSelectOneChoice getFieldListSelectOneChoice() {
        return fieldListSelectOneChoice;
    }

    public void setFieldSelectedCheckBox(RichSelectBooleanCheckbox fieldSelectedCheckBox) {
        this.fieldSelectedCheckBox = fieldSelectedCheckBox;
    }

    public RichSelectBooleanCheckbox getFieldSelectedCheckBox() {
        return fieldSelectedCheckBox;
    }

    public void changeLevelCheckBox(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        Boolean value=(Boolean)valueChangeEvent.getNewValue(); 
        if( value == true) {
            this.level = new Level(new BigDecimal(-1),"all");
        
         Utility.refreshComponent(this.getStudentListTables());
         Utility.refreshComponent(this.getStudentListCount());
         Utility.refreshComponent(this.levelFieldForSearch);
         System.out.println("row count is " +
                            getStudentListTables().getRowCount());
        }
        else {
            DCBindingContainer bindings =
                (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
            DCIteratorBinding iter =
                (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
            Row row = iter.getCurrentRow();
            if (row != null) {
                this.level = new Level();
                level.setName((String)row.getAttribute(1));
                level.setId((BigDecimal)row.getAttribute(0));
                Utility.refreshComponent(this.getStudentListTables());
                Utility.refreshComponent(this.getStudentListCount());
                Utility.refreshComponent(this.levelFieldForSearch);  
            }
        }
    }

    public void setOrganizationFieldText(RichInputText organizationFieldText) {
        this.organizationFieldText = organizationFieldText;
    }

    public RichInputText getOrganizationFieldText() {
        return organizationFieldText;
    }

    public void setStatusFieldText(RichInputText statusFieldText) {
        this.statusFieldText = statusFieldText;
    }

    public RichInputText getStatusFieldText() {
        return statusFieldText;
    }

    public void setStatusSelectedCheckBox(RichSelectBooleanCheckbox statusSelectedCheckBox) {
        this.statusSelectedCheckBox = statusSelectedCheckBox;
    }

    public RichSelectBooleanCheckbox getStatusSelectedCheckBox() {
        return statusSelectedCheckBox;
    }

    public void setOrganizationSelectedCheckBox(RichSelectBooleanCheckbox organizationSelectedCheckBox) {
        this.organizationSelectedCheckBox = organizationSelectedCheckBox;
    }

    public RichSelectBooleanCheckbox getOrganizationSelectedCheckBox() {
        return organizationSelectedCheckBox;
    }

    public void fetchPaymentsPopup(PopupFetchEvent popupFetchEvent) {
        // Add event code here...
        if( this.getCurrebtStudentRegistrationAccounting().compareTo(new BigDecimal("0"))<=0 )
        {   
        this.getPayNaghdAmountField().setValue(String.valueOf( this.getCurrebtStudentRegistrationAccounting().abs()));
        }
        this.getPayDescriptionFeild().setValue("");
        this.getCodeRahgiriPayField().setValue("");
            }

    public void fetchChecksPayments(PopupFetchEvent popupFetchEvent) {
        // Add event code here...
        if( this.getCurrebtStudentRegistrationAccounting().compareTo(new BigDecimal("0"))<=0 )
        {   
        this.checkAmountCreate.setValue(String.valueOf( this.getCurrebtStudentRegistrationAccounting().abs()));
        }
        this.checkNumCreate.setValue("");
        this.chechDescCreate.setValue("");
        this.checkForHowCreate.setValue("");
        this.getBankBrankCheckCreate().setValue("");
    }

    public String registerStudentSelectField() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");

        Row row = iter.getCurrentRow();
        
        if (row != null) {
          Field field=  (Field)((DCDataRow)row).getDataProvider();     
            this.newRegistration.setField(field);
             Utility.refreshComponent(newRegfieldName);    
        }
        else{
            System.out.println("please select a field");
        }
        return "";
    }

    public String registerStudentSelectLevel() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");

        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        SalaryParam sp = new SalaryParam();
        if (row != null) {
          Level level=  (Level)((DCDataRow)row).getDataProvider();     
            this.currentSelectedLevel =
            level;
            //        System.out.println("changedLevel =" +  this.currentSelectedLevel.getName());
            this.newRegistration.setLevel(this.currentSelectedLevel);  
            sp.setTerm(this.currentTerm);
            sp.setLevel(this.currentSelectedLevel);
            sp = rm.getSalaryParam(sp);
            
            if (sp.getActionSalary() != null) {

                this.newRegistration.setFixShahriye(sp.getFixSalary());
                this.newRegistration.setTheoryShahriye(sp.getTheorySalary());
                this.newRegistration.setActionalShahriye(sp.getActionSalary());

            } //end of sp == null

            else {
                this.ShowMessage("for this level hasn't been defined any param ");
                this.newRegistration.setFixShahriye(new BigDecimal(0));
                this.newRegistration.setTheoryShahriye(new BigDecimal(0));
                this.newRegistration.setActionalShahriye(new BigDecimal(0));
            }
            refreshAllFields();             
        }
        else{
            System.out.println("please select a field");
        }
        return "";
    }

    public void printNezamVazifeh(FacesContext facesContext,
                                  OutputStream outputStream) {
        // Add event code here...
                  
        ReportManagment rm = new ReportManagment();
        String prtinUrl= rm.runrReportNezamVazife(this.currentStudent.getStudentCode());
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

    public void setNewBaseFieldName(RichInputText newBaseFieldName) {
        this.newBaseFieldName = newBaseFieldName;
    }

    public RichInputText getNewBaseFieldName() {
        return newBaseFieldName;
    }

    public String registerStudentSelectBase() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allbasesIterator");

        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          Base base =  (Base)((DCDataRow)row).getDataProvider();     
            this.currentSelectBase = base;
            //  System.out.println("changedLevel =" +  this.currentSelectedLevel.getName());
            this.newRegistration.setBase(this.currentSelectBase);  
            
            refreshAllFields();             
        }
        else{
            System.out.println("please select a base");
        }
        return "";
    }

    public void setCurrentSelectBase(Base currentSelectBase) {
        this.currentSelectBase = currentSelectBase;
    }

    public Base getCurrentSelectBase() {
        return currentSelectBase;
    }

    public String registerSelectedCourses() {
        // Add event code here...
        String returned = "";
        RegistrationManager rm = new RegistrationManager();
        RowKeySet selectedEmps = this.notRegisterdCoursesTable.getSelectedRowKeys();    
        Iterator selectedEmpIter = selectedEmps.iterator();
        DCBindingContainer bindings =
                          (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding empIter = bindings.findIteratorBinding("findCoursesNotRegisteredIterator");
        RowSetIterator empRSIter = empIter.getRowSetIterator();
         while(selectedEmpIter.hasNext()){
           Key key = (Key)((List)selectedEmpIter.next()).get(0);
           Row currentRow = empRSIter.getRow(key);
             if(currentRow !=null){
             Course course =  (Course)((DCDataRow)currentRow).getDataProvider();
             if(course !=null)
             {
             System.out.println(course.getCourseCode());    
             rm.addCourseToRegistration(newRegistration,course);
             }
             else {
                 Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
             }
       //    System.out.println(currentRow.getAttribute("Ename"));
         }}
        Utility.refreshComponent(notRegisterdCoursesTable);
        
/*        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          Course course =  (Course)((DCDataRow)row).getDataProvider();     
          rm.addCourseToRegistration(newRegistration,course);
          Utility.refreshComponent(registerCourseTable);    
          
       returned = "refreshSelectedCourse";
        }
        else{
            Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
        
        }
  */
         returned = "refreshSelectedCourse";
        return returned;
    }

    public void setRegisterCourseTable(RichTable registerCourseTable) {
        this.registerCourseTable = registerCourseTable;
    }

    public RichTable getRegisterCourseTable() {
        return registerCourseTable;
    }

    public String deleteCourseFromRegister() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("findCoursesRegisteredIterator");
        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          Course course =  (Course)((DCDataRow)row).getDataProvider();     
         int result =  rm.deleteCourseFromRegistration(newRegistration,course);
          System.out.println("result= "+result+" courseId="+course.getCourseId()+" reg_id = "+ newRegistration.getId());
          Utility.refreshComponent(notRegisterdCoursesTable);              
      returned = "refreshRegisteredCourses";
        }
        else{
            Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
        }
        return returned;
    }

    public void setRegistrationAddButton(RichCommandImageLink registrationAddButton) {
        this.registrationAddButton = registrationAddButton;
    }

    public RichCommandImageLink getRegistrationAddButton() {
        return registrationAddButton;
    }

    public void setStudentPicBaseString(String studentPicBaseString) {
        this.studentPicBaseString = studentPicBaseString;
    }

    public String getStudentPicBaseString() {
        return studentPicBaseString;
    }

    public void setStudentPicUploadedFile(UploadedFile StudentPicUploadedFile) {
        this.StudentPicUploadedFile = StudentPicUploadedFile;
    }

    public UploadedFile getStudentPicUploadedFile() {
        return StudentPicUploadedFile;
    }

    public String editStudentPic() {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        if(StudentPicUploadedFile != null) {
        System.out.println("uploaded file name = "+StudentPicUploadedFile .getFilename());
 
            try {
                rm.setStudentPic(currentStudent, StudentPicUploadedFile.getInputStream());
                this.studentPicBaseString = rm.getStudentImageArray(this.currentStudent);
                Utility.refreshComponent(studentPicImageField);
                StudentPicUploadedFile = null;
                
            } catch (IOException e) {
                e.printStackTrace();
                Utility.showFacesMessage("Error in your file",FacesMessage.SEVERITY_ERROR);
            }
        }
        else {
            System.out.println("please select a file");
            Utility.showFacesMessage("please select a file",FacesMessage.SEVERITY_WARN);
        }
        return null;
    }

    public void setStudentPicImageField(RichImage studentPicImageField) {
        this.studentPicImageField = studentPicImageField;
    }

    public RichImage getStudentPicImageField() {
        return studentPicImageField;
    }


    public void setNotRegisterdCoursesTable(RichTable notRegisterdCoursesTable) {
        this.notRegisterdCoursesTable = notRegisterdCoursesTable;
    }

    public RichTable getNotRegisterdCoursesTable() {
        return notRegisterdCoursesTable;
    }

    public void downloadStudentImage(FacesContext facesContext,
                                     OutputStream outputStream) {
        // Add event code here...
        
        RegistrationManager rm = new RegistrationManager();
        InputStream is= rm.getStudentImageStream(this.currentStudent);
       
        URL url;
                   try {
       
                      
                       
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
}
