package report;


import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.*;

import javax.sql.DataSource;

import java.io.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Hashtable;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import transaction.TransactionManagement;


public class ReportBuilder {
    public final static int HTML = 1;
    public final static int PDF = 2;
    public final static int EXCEL = 3;
    public final static int WORD = 4;

    private DataSource dataSource;
    private String basePath;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void setBasePath(String basePath) {
        this.basePath = basePath;
    }

    public String getBasePath() {
        return basePath;
    }

    private String generateFileName(int fileType) {
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmm_");
        Date date = new Date();
        String format = getFormat(fileType);
        String name;
        File f;
        do {
            String v = String.valueOf(System.currentTimeMillis());
            name =
new String(dateFormat.format(date) + v.substring(v.length() - 8));
            String tempf = String.format("%s/%s%s", basePath, name, format);
            f = new File(tempf);
        } while (f.exists());

        return name;
    }

    private String generateFileNameByVersion(String fileName, int format) {
        File f;
        String name;
        int ver = 0;
        do {
            name = new String(fileName + (ver > 0 ? "_" + ver : ""));
            String tempf = String.format("%s/%s%s", basePath, name, format);
            f = new File(tempf);
            ver++;
        } while (f.exists());
        return name;
    }

    private String generateFileNameAndRemoveIfExists(String fileName,
                                                     int format) {
        File f;
        String name;
        String tempf = String.format("%s/%s%s", basePath, fileName, format);
        f = new File(tempf);
        if (f.exists()) {
            if (f.delete())
                return fileName;
            else
                return fileName + "_";
        }
        return fileName;
    }
    


    public String getReport(InputStream jasperFile, Hashtable reportParameter,
                            String fileName, int fileType,
                            boolean addVersionOrOverwrite) throws  ReportException{
        
        if (fileType > 4 || fileType < 1)
            throw new RuntimeException("File Type not supported.");

        String format = getFormat(fileType);
        String name;

        if (fileName == null)
            name = generateFileName(fileType);
        else {
            if (addVersionOrOverwrite)
                name = generateFileNameByVersion(fileName, fileType);
            else
                name = generateFileNameAndRemoveIfExists(fileName, fileType);
        }

        //Opening Jasper Report Source
/*
        InputStream input = null;
        try {
            input = new FileInputStream(jasperFile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            throw new ReportException(ReportException.NOT_FOUND_ERROR);
        }
*/
        //Make Sub report dir
      //  String subReportDir = jasperFile.getParent();
        
        
        reportParameter.put("SUB_REPORT_DIR","report/jasperFile/");

        JasperPrint jr = null;
        try {
            Connection conn = getDbConnection();
            System.out.println("-------satari3---------");
            jr = JasperFillManager.fillReport(jasperFile, reportParameter, conn);
            conn.close();
            System.out.println("-------satari4----------");

        } catch (JRException e) {
            e.printStackTrace();
            throw new ReportException(ReportException.FILL_ERROR);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ReportException(ReportException.SQL_ERROR);
            }

        try {
            ExternalContext extc = FacesContext.getCurrentInstance().getExternalContext();  
            HttpServletRequest httpReq = (HttpServletRequest)extc.getRequest();
            
            if (fileType == PDF) { //Exporting to pdf destenation
                format = ".pdf";
                //                JasperExportManager.exportReportToPdfFile(jr, String.format("%s/%s%s", basePath, name, format));
                JRPdfExporter exporter = new JRPdfExporter();

                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jr);
                exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,
                                      String.format("%s/%s%s", basePath, name,
                                                    format));
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
                                      extc.getRequestContextPath()+extc.getRequestServletPath()+"/Images/report/");
                System.out.println("report Images path"+extc.getRequestContextPath()+extc.getRequestServletPath()+"/Images/report/" );

                exporter.exportReport();
            }
            if (fileType == HTML) { //Export to html
                format = ".html";
                //                JasperExportManager.exportReportToHtmlFile(jr, String.format("%s/%s%s", basePath, name, format));
                JRHtmlExporter exporter = new JRHtmlExporter();

                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jr);
                exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,
                                      String.format("%s/%s%s", basePath, name,
                                                    format));
                
                exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
                                      Boolean.FALSE);
        //        exporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR,
           //                           Boolean.TRUE);
                exporter.setParameter(JRHtmlExporterParameter.HTML_HEADER,
                                      "<html><head><title>Report</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/></head><body>");
                exporter.setParameter(JRHtmlExporterParameter.HTML_FOOTER,
                                      "</body></html>");
                exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
                                      extc.getRequestContextPath()+extc.getRequestServletPath()+"/Images/report/");
                System.out.println("report Images path"+extc.getRequestContextPath()+extc.getRequestServletPath()+"/Images/report/" );
               
            //    exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
              //                           "E:\\basa\\report\\reports\\Jasperre\\ReportImage\\");
                exporter.exportReport();
            }

            //Exporting to excel
            if (fileType == EXCEL) {
                format = ".xls";
                JRXlsExporter xls = new JRXlsExporter();
                xls.setParameter(JRXlsExporterParameter.JASPER_PRINT, jr);
                xls.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME,
                                 String.format("%s/%s%s", basePath, name,
                                               format));
                xls.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,
                                 Boolean.FALSE);
                //                xls.setParameter(JRXlsExporterParameter.IS_AUTO_DETECT_CELL_TYPE, Boolean.TRUE);
                xls.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,
                                 Boolean.FALSE);
                xls.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,
                                 Boolean.TRUE);
                xls.exportReport();
            }
        } catch (JRException e) {
            e.printStackTrace();
            throw new ReportException(ReportException.EXPORT_ERROR);
        }

        try {
            jasperFile.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new String(String.format("%s%s", name, format));
    }

    public String getReport(InputStream jasperFile, Hashtable reportParameter,
                            int fileType) throws ReportException {
        return getReport(jasperFile, reportParameter, null, fileType,
                         false);
    }

    public String getReport(InputStream jasperFile,
                            int fileType) throws ReportException {
        return getReport(jasperFile, new Hashtable(), fileType);
    }

    public String getReport(InputStream jasperFile) throws ReportException {
        return getReport(jasperFile, new Hashtable(), ReportBuilder.HTML);
    }

    public String getReport(InputStream jasperFile,
                            Hashtable reportParameter) throws ReportException {
        return getReport(jasperFile, reportParameter, ReportBuilder.HTML);
    }

    private String getFormat(int i) {

        String retFormat;
        if (i == PDF) {
            retFormat = ".pdf";
        } else if (i == HTML) {
            retFormat = ".html";
        } else if (i == EXCEL) {
            retFormat = ".xls";
        } else if (i == WORD) {
            retFormat = ".doc";
        } else {
            retFormat = ".html";
        }
        return retFormat;
    }

    public Connection getDbConnection() {
        
        return  TransactionManagement.getInstance().getConnection();
//        try {
//            // Load the JDBC driver
//            String driverName = "oracle.jdbc.driver.OracleDriver";
//            Class.forName(driverName);
//
//            // Create a connection to the database
//            //gol gohar:172.16.32.31,port=1520,sid=SOADBS
////            String serverName = "172.16.32.31";
////            String portNumber = "1520";
////            String sid = "SOADBS";
//            String serverName = "localhost";
//            String portNumber = "1521";
//            String sid = "SOA";
//            String url =
//                "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" +
//                sid;
//            String username = "GEG";
//            String password = "12345678";
//            connection = DriverManager.getConnection(url, username, password);
//
//
//            //
//
//
//        } catch (ClassNotFoundException e) {
//            System.out.println("**************11");
//            // Could not find the database driver
//        } catch (SQLException e) {
//            // Could not connect to the database
//            System.out.println("**************12");
//        }
//        return connection;

    }
   
}