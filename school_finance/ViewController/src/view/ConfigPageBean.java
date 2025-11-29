package view;

import finance.data.AccountBank;

import finance.data.CheckStatus;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import javax.servlet.ServletContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectBooleanCheckbox;

import oracle.binding.OperationBinding;

import oracle.jbo.Row;

import org.apache.myfaces.trinidad.model.UploadedFile;

import registration.data.Level;
import registration.data.Organization;
import registration.data.Registration;
import registration.data.SalaryParam;
import registration.data.Term;

import registration.process.RegistrationManager;

import util.RestoreBackup;

public class ConfigPageBean {
    private RichInputDate termStartDateField;
    private RichInputDate termEndDate;
    private RichSelectBooleanCheckbox termIsCurrentField;
    private RichInputText termNameField;
    
    private BigDecimal termEditId;
    private String termEditTermName;
    private Date termEditStartDate;
    private Date termEditEndDate;
    private boolean termEditIsCurrent;
    private int termEditYearCode;
    private int termEditDoreCode;
    
    private SalaryParam termSalaryEditSalaryParam;
    private RichInputText fixSalaryField;
    private RichInputText actionSalaryField;
    private RichInputText thoerySalaryField;
    private UploadedFile restoreUploadedFile;
    private String backupFileName = String.valueOf(new Date().getTime())+".sql";
    private Organization editOrg;
    private RichInputText termYearCode;
    private RichInputText termDoreCode;

    public ConfigPageBean() {
    }

    public void setTermStartDateField(RichInputDate termStartDateField) {
        this.termStartDateField = termStartDateField;
    }

    public RichInputDate getTermStartDateField() {
        return termStartDateField;
    }

    public void setTermEndDate(RichInputDate termEndDate) {
        this.termEndDate = termEndDate;
    }

    public RichInputDate getTermEndDate() {
        return termEndDate;
    }

    public String createTerm() {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        Term term = new Term();
        term.setFromDate((Date)this.getTermStartDateField().getValue());
        term.setToDate((Date)this.getTermEndDate().getValue());
        term.setName((String)this.getTermNameField().getValue());
        term.setIsCurrent((Boolean)this.getTermIsCurrentField().getValue());
        //Term term = new Term(null,(String)this.getTermNameField().getValue(),(Date)this.getTermStartDateField().get)
      
       
        term.setYear(((Long)this.getTermYearCode().getValue()).intValue());
        term.setDore(((Long)this.getTermDoreCode().getValue()).intValue());
        rm.createTerm(term);
        
                                     
        this.refreshTermIterator();   
        return "refreshTerms"; 
    }

    public void setTermIsCurrentField(RichSelectBooleanCheckbox termIsCurrentField) {
        this.termIsCurrentField = termIsCurrentField;
    }

    public RichSelectBooleanCheckbox getTermIsCurrentField() {
        return termIsCurrentField;
    }

    public void setTermNameField(RichInputText termNameField) {
        this.termNameField = termNameField;
    }

    public RichInputText getTermNameField() {
        return termNameField;
    }

    public void setTermEditId(BigDecimal termEditId) {
        this.termEditId = termEditId;
    }

    public BigDecimal getTermEditId() {
        return termEditId;
    }

    public void setTermEditStartDate(Date termEditStartDate) {
        this.termEditStartDate = termEditStartDate;
    }

    public Date getTermEditStartDate() {
        return termEditStartDate;
    }

    public void setTermEditEndDate(Date termEditEndDate) {
        this.termEditEndDate = termEditEndDate;
    }

    public Date getTermEditEndDate() {
        return termEditEndDate;
    }

    public void setTermEditIsCurrent(boolean termEditIsCurrent) {
        this.termEditIsCurrent = termEditIsCurrent;
    }

    public boolean isTermEditIsCurrent() {
        return termEditIsCurrent;
    }

    public void setTermEditTermName(String termEditTermName) {
        this.termEditTermName = termEditTermName;
    }

    public String getTermEditTermName() {
        return termEditTermName;
    }

    public void editTerm(ActionEvent actionEvent) {
        // Add event code here...
     RegistrationManager rm = new RegistrationManager();
     Term term = new Term();
     term.setId(this.getTermEditId());
     term.setName(this.getTermEditTermName());
     term.setFromDate(this.getTermEditStartDate());
     term.setToDate(this.getTermEditEndDate());
     term.setIsCurrent(this.isTermEditIsCurrent());
     term.setYear(this.getTermEditYearCode());
     term.setDore(this.getTermEditDoreCode());
     rm.updateTerm(term);
     this.refreshTermIterator();
    }
    private void refreshTermIterator() {
                                     
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        OperationBinding op=bindings.getOperationBinding("Execute");
        op.execute();
    }
    
    private Term getSelectedTerm() {
        Term term =null;
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allTermsIterator");
                
                Row row = iter.getCurrentRow();
               if(row!=null)
               {
                   term = (Term)((DCDataRow)row).getDataProvider(); 
          
          /*
                term = new Term();
                
                term.setId((BigDecimal)(row.getAttribute(0)));
                term.setName((String)row.getAttribute(1));
                term.setFromDate((Date)row.getAttribute(2));
                term.setToDate((Date)row.getAttribute(3));
                term.setIsCurrent((Boolean)row.getAttribute(4));
                term.setYear((Integer)row.getAttribute(5));
                term.setDore((Integer)row.getAttribute(6));
            */
               }
        return term;
    }
    private Organization getSelectedOrganization() {
        Organization organization =null;
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allOrganizationIterator");
                
                Row row = iter.getCurrentRow();
               if(row!=null)
               {
                   organization = (Organization)((DCDataRow)row).getDataProvider(); 
               }
        return organization;
    }
    private Level getSelectedEditSalaryLevel() {
        Level level =null;
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
                
                Row row = iter.getCurrentRow();
               if(row!=null)
               {
                level = new Level((BigDecimal)(row.getAttribute(0)),(String)row.getAttribute(1));
               }
        return level;
    }
    public void setCurrentTerm(ActionEvent actionEvent) {
        // Add event code here...
        System.out.println("in setCurrentTerm Method");
        Term term = getSelectedTerm();
        if(term!=null) {
            this.setTermEditIsCurrent(term.getIsCurrent());
            this.setTermEditStartDate(term.getFromDate());
            this.setTermEditEndDate(term.getToDate());
            this.setTermEditTermName(term.getName());
            this.setTermEditId(term.getId());
            this.setTermEditYearCode(term.getYear());
            this.setTermEditDoreCode(term.getDore());
            System.out.println("term id = "+ term.getId());
            
        }
        else {
        System.out.println("please select a term");
        }
    }

    public void deleteTerm(ActionEvent actionEvent) {
        // Add event code here...
        
        Term term = getSelectedTerm();
        
        if(term!=null) {
        RegistrationManager rm = new RegistrationManager();
       int result = rm.delete(term);
       if(result == 0)
       {
       ShowMessage("This term is used in registrations");
        }
       else {
           refreshTermIterator();
       }
    }
    }
    
    private void ShowMessage(String msg){
           FacesMessage fm =
               new FacesMessage(msg);
           fm.setSeverity(FacesMessage.SEVERITY_WARN);
           FacesContext.getCurrentInstance().addMessage(null, fm);
       }

    public void setTermSalaryEditSalaryParam(SalaryParam termSalaryEditSalaryParam) {
        this.termSalaryEditSalaryParam = termSalaryEditSalaryParam;
    }

    public SalaryParam getTermSalaryEditSalaryParam() {
        return termSalaryEditSalaryParam;
    }

    public void editSalaryParam(ActionEvent actionEvent) {
        // Add event code here...
        this.termSalaryEditSalaryParam = new SalaryParam();
        if(this.getSelectedTerm()!=null && this.getSelectedEditSalaryLevel()!=null)
        {
        termSalaryEditSalaryParam.setTerm(this.getSelectedTerm());
        termSalaryEditSalaryParam.setLevel(this.getSelectedEditSalaryLevel());
        RegistrationManager rm = new RegistrationManager();
        termSalaryEditSalaryParam = rm.getSalaryParam(termSalaryEditSalaryParam);
        }
    }

    public void chageLevelSalaryParam(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if(valueChangeEvent.getNewValue()!=null){
                int index =
                    Integer.parseInt(valueChangeEvent.getNewValue().toString());
                DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");
                if (index < iter.getViewObject().getEstimatedRowCount()) {
                    Row row = iter.getRowAtRangeIndex(index);
                    this.getTermSalaryEditSalaryParam().setLevel( new Level((BigDecimal)row.getAttribute(0),(String)row.getAttribute(1)));
                    RegistrationManager rm = new RegistrationManager();
                    
                    this.setTermSalaryEditSalaryParam(rm.getSalaryParam(termSalaryEditSalaryParam));
                    Utility.refreshComponent(this.thoerySalaryField);
                    Utility.refreshComponent(this.actionSalaryField);
                    Utility.refreshComponent(this.fixSalaryField);
                 }
                }else{
                    
                }   
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

    public void setThoerySalaryField(RichInputText thoerySalaryField) {
        this.thoerySalaryField = thoerySalaryField;
    }

    public RichInputText getThoerySalaryField() {
        return thoerySalaryField;
    }

    public void editTermSalaryaram(ActionEvent actionEvent) {
        // Add event code here...
        RegistrationManager rm = new RegistrationManager();
        rm.setSalaryParam(termSalaryEditSalaryParam);
    }

    public String backupDB() {
        // Add event code here...
        RestoreBackup rb = new RestoreBackup();
      this.backupFileName =  rb.backup().getName();
      return "";
    }

    public void setBackupFileName(String backupFileName) {
        this.backupFileName = backupFileName;
    }

    public String getBackupFileName() {
        return backupFileName;
    }

    public void backupFiles(ActionEvent actionEvent) {
        // Add event code here...
        RestoreBackup rb = new RestoreBackup();
        this.backupFileName =  rb.backup().getName();
    }

    public void backupFileDelivery(FacesContext facesContext,
                                   OutputStream outputStream) {
        // Add event code here...
        this.backupFileName = String.valueOf(new Date().getTime())+".sql";
        RestoreBackup rb = new RestoreBackup();
        FileInputStream is;
        try {
       
            is = new FileInputStream(rb.backup());
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

    public void setRestoreUploadedFile(UploadedFile restoreUploadedFile) {
        this.restoreUploadedFile = restoreUploadedFile;
    }

    public UploadedFile getRestoreUploadedFile() {
        return restoreUploadedFile;
    }
    
   
    public String restoreDatabase() {
        // Add event code here...
        if(restoreUploadedFile != null) {
        System.out.println("uploaded file name = "+restoreUploadedFile.getFilename());
        File file  =  new File(ConfigPageBean.class.getClassLoader().getResource("").getFile(),restoreUploadedFile.getFilename());
        System.out.println("created File for  restore is "+file.getPath()+restoreUploadedFile);
        FileOutputStream outputStream ;
        FileOutputStream outputStreamTableStructure;
        RestoreBackup restoreBackup = new RestoreBackup();
        InputStream tableStuctureIS= restoreBackup.getRestoreFileIS("school_new_structure_tables.sql");
        File tableStuctureFile = new File(ConfigPageBean.class.getClassLoader().getResource("").getFile(),"school_new_structure_tables.sql");
        //System.out.println("created File for  restore is "+file.getPath()+restoreUploadedFile);
        
        InputStream is;
            try {
                outputStream = new FileOutputStream(file); 
                is = restoreUploadedFile.getInputStream();
                // initialize  
                byte[] buffer = new byte[4048]; // tweaking this number may increase performance  
                int len;  
                while ((len = is.read(buffer)) != -1)  
                {  
                    outputStream.write(buffer, 0, len);  
                }  
                is.close(); 
                outputStream .close();
                
               // restoreBackup.restore(tableStuctureFile);
                
                outputStreamTableStructure = new FileOutputStream(tableStuctureFile);
                // initialize  
                byte[] buffer1 = new byte[4048]; // tweaking this number may increase performance  
                
               // System.out.println("tableStructureFile len size :  "+ tableStuctureIS.read(buffer1));
                while ((len = tableStuctureIS.read(buffer1)) != -1)  
                {  
                    outputStreamTableStructure.write(buffer1, 0, len);  
                }  
                tableStuctureIS.close(); 
                outputStreamTableStructure .close(); 
                restoreBackup.restore(tableStuctureFile);
                System.out.println("tableStructureFile restored");
               // restoreBackup.restore(functionStructureFile);
               // System.out.println("functionStructureFile restored");
               // restoreBackup.restore(viewStructureFile);
               // System.out.println("viewStructureFile restored");
                
                restoreBackup.restore(file);
                System.out.println("dataFile restored");
                
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            System.out.println("please select a file");
        }
        return null;
    }

    public void setEditOrg(Organization editOrg) {
        this.editOrg = editOrg;
    }

    public Organization getEditOrg() {
        return editOrg;
    }

    public String editOrganization() {
        RegistrationManager rm = new RegistrationManager();
        
        rm.editOrganization(this.editOrg);
        
       
        return null;
    }

    public void editOrganizationPop(ActionEvent actionEvent) {
        
        this.editOrg =  this.getSelectedOrganization();
        if(editOrg !=null) {
            
        }
        else {
            this.ShowMessage("please select a organization");
        }
            
    }

    public void setTermYearCode(RichInputText termYearCode) {
        this.termYearCode = termYearCode;
    }

    public RichInputText getTermYearCode() {
        return termYearCode;
    }

    public void setTermDoreCode(RichInputText termDoreCode) {
        this.termDoreCode = termDoreCode;
    }

    public RichInputText getTermDoreCode() {
        return termDoreCode;
    }

    public void setTermEditYearCode(int termEditYearCode) {
        this.termEditYearCode = termEditYearCode;
    }

    public int getTermEditYearCode() {
        return termEditYearCode;
    }

    public void setTermEditDoreCode(int termEditDoreCode) {
        this.termEditDoreCode = termEditDoreCode;
    }

    public int getTermEditDoreCode() {
        return termEditDoreCode;
    }
}
