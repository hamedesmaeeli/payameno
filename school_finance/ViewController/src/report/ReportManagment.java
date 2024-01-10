package report;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Hashtable;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import oracle.adf.model.AttributeBinding;
import oracle.adf.model.BindingContext;
import oracle.adf.model.OperationBinding;

public class ReportManagment {  

    ReportBuilder reportBuilder;
    
    public ReportManagment() {
        super();
        reportBuilder= new ReportBuilder();
        reportBuilder.setBasePath(getReportFilePath());   
    }
    
    public String runrReportRegistration(BigDecimal regId)
    {
        Hashtable ht = new Hashtable();
        if(regId!=null)
          ht.put("reg_id",regId); 
    
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("report14.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println(url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String runrReportRegistrationContract(BigDecimal regId)
    {
        Hashtable ht = new Hashtable();
        if(regId!=null)
          ht.put("reg_id",regId); 
    
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("registration_contract.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println(url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String runrReportRegistrationList(BigDecimal stCode)
    {
        Hashtable ht = new Hashtable();
        if(stCode!=null)
          ht.put("st_code",stCode); 
    
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("report19.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println(url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String runrReportNezamVazife(BigDecimal stCode)
    {
        Hashtable ht = new Hashtable();
        if(stCode!=null)
          ht.put("st_code",stCode); 
    
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("report20.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println("runrReportNezamVazife "+url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String runrReportTotalFinance(BigDecimal accId)
    {
        Hashtable ht = new Hashtable();
        if(accId!=null)
          ht.put("r_p_id",accId); 
    
      String url = null; 
        try {

          System.out.println("***getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("report17.jasper"),ht,reportBuilder.HTML);
            url = getURL() + url;
            System.out.println(url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String getReportFilePath(){
        ExternalContext ectx = FacesContext.getCurrentInstance().getExternalContext(); 
        ServletContext context =(ServletContext)ectx.getContext();  
        
        System.out.println("........2........"+context.getRealPath(File.separator)+"report");
        
//        getJasperFileIS("Incoming_letter_status.jasper");
        File file=new File(context.getRealPath(File.separator)+File.separator+"report");
        if(!file.exists())
            file.mkdirs();
        
        return context.getRealPath(File.separator+"report");
    }   
     
    public InputStream getJasperIS(String fileName){
        System.out.println("...............jasper..............."+getClass().getClassLoader().getResource("model/report/jasperFile/"+fileName));
        return getClass().getClassLoader().getResourceAsStream("report/jasperFile/"+fileName);
    }

    public InputStream getJasperFileIS(String jasperName){
        String fileName =  this.getReportFilePath()+""+jasperName;
        FileInputStream is = null;
        try {
            is = new FileInputStream(fileName);
        } catch (FileNotFoundException e) {
            
        }
        return is ;
    }
    public String getURL(){
        //TODO
        ExternalContext extc = FacesContext.getCurrentInstance().getExternalContext();  

        HttpServletRequest httpReq = (HttpServletRequest)extc.getRequest();
        
        System.out.println("report url is === RequestContextPath = "+extc.getRequestContextPath()+" RequestServletPath"+extc.getRequestServletPath());   
        return "http://"+httpReq.getServerName()+":"+httpReq.getLocalPort()+extc.getRequestContextPath()+"/report/";
        
        //if use in some other pages :
       //return "http://"+httpReq.getServerName()+":"+httpReq.getLocalPort()+extc.getRequestContextPath()+extc.getRequestServletPath()+"/report/";
    }
    public String runrReportKartEmtehanKoli()
    {
        Hashtable ht = new Hashtable();
        
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("kart_koli.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println("kartEmtehan "+url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    public String runrReportKartWithField(BigDecimal fieldId)
    {
        
        Hashtable ht = new Hashtable();
        if(fieldId!=null)
          ht.put("field_id",fieldId); 

        
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("kart.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println("kartEmtehan with stcoode "+url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
    
    public String runrReportKartWithCode(BigDecimal studentCode)
    {
        
        Hashtable ht = new Hashtable();
        if(studentCode!=null)
          ht.put("st_id",studentCode); 

        
      String url = null; 
        try {

          System.out.println("getReportFilePath() === "+ getReportFilePath());
            url = reportBuilder.getReport(getJasperIS("kart_taki.jasper"),ht,reportBuilder.PDF);
            url = getURL() + url;
            System.out.println("kartEmtehan with field "+url);
        } catch (ReportException e) {
            e.printStackTrace();
        }
        return url;
    }
}