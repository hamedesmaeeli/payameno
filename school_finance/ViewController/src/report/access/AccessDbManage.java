package report.access;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.IOException;

import java.io.InputStream;

import java.io.OutputStream;

import java.net.URL;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;

import java.util.Date;

import net.ucanaccess.jdbc.UcanaccessDriver;

public class AccessDbManage {
    public AccessDbManage() {
        super();
    }
    private String dbName;
    private File outputFile;
    private String dbOutputFileName;
    private Connection Connection;
    public void setDbName(String dbFileName) {
        this.dbName = dbFileName;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbOutputFileName(String dbOutputFileName) {
        this.dbOutputFileName = dbOutputFileName;
    }

    public String getDbOutputFileName() {
        return dbOutputFileName;
    }
    public void createConnection() {
            try {
            // Load MS accces driver class
         //   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
                
         URL url1=    this.getClass().getClassLoader().getResource("report/access/rahnamayi.accdb"); 
                //this.getClass().getClassLoader().getResource("transaction/access/rahnamayi.accdb");  
            System.out.println("print "+ url1.getFile());
            File file = new File(url1.getPath());    
                System.out.println("print2 "+ file.getAbsolutePath());    
            // C:\\databaseFileName.accdb" - location of your database 
          //  File file2 = new File(file.getParent()+"\\"+new Date().getTime()+"rahnamyi.accdb"); 
          File file2 = new File("c:\\payamTemp\\"+new Date().getTime()+"\\rahnamyi.accdb"); 
            System.out.println("file 2 name = "+file2.getParent());
      //    this.copyWithStreams(file, file2, false);   
      this.copyWithStreams(this.getClass().getClassLoader().getResourceAsStream("report/access/rahnamayi.accdb"), file2, false);
        //    String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ="+ file2.getAbsolutePath() ;
        // String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.accdb)};DBQ="+ file2.getAbsolutePath() ;   
        
        String pathNewDB =file2.getAbsolutePath();
        String url = UcanaccessDriver.URL_PREFIX + pathNewDB+";newDatabaseVersion=V2007";

        
           System.out.println("url ="+url); 
           
                java.util.Properties prop = new java.util.Properties();
//                prop.put("charSet", "Cp1250");
           
           
            // specify url, username, pasword - make sure these are valid 
            Connection conn = DriverManager.getConnection(url, "", "");
        //  Connection conn = DriverManager.getConnection(url, prop);
            this.Connection = conn;
            this.outputFile = file2;    
            System.out.println("Connection Succesfull");
            } catch (Exception e) {
            //System.err.println("Got an exception! ");
            //System.err.println(e.getMessage());
            e.printStackTrace();
            }
            
        }
    public void deleteFile() {
        if(this.outputFile !=null) {
                     
            if (!this.outputFile.exists())
              System.out.println("  Doesn't exist");
            else if (!this.outputFile.canWrite())
              System.out.println("  No write permission");
            else
            {
              if (this.outputFile.delete())
                System.out.println("  Deleted!");

              else
                System.out.println("  Delete failed - reason unknown");
            }
        
        
        }
        else{
            
            System.out.println("file not deleted");

        }
    }
    private void copyWithStreams(File aSourceFile, File aTargetFile, boolean aAppend) {
      //  log("Copying files with streams.");
        ensureTargetDirectoryExists(aTargetFile.getParentFile());
        InputStream inStream = null;
        OutputStream outStream = null;
        try{
          try {
            byte[] bucket = new byte[32*1024];
            inStream = new BufferedInputStream(new FileInputStream(aSourceFile));
            outStream = new BufferedOutputStream(new FileOutputStream(aTargetFile, aAppend));
            int bytesRead = 0;
            while(bytesRead != -1){
              bytesRead = inStream.read(bucket); //-1, 0, or more
              if(bytesRead > 0){
                outStream.write(bucket, 0, bytesRead);
              }
            }
          }
          finally {
            if (inStream != null) inStream.close();
            if (outStream != null) outStream.close();
          }
        }
        catch (FileNotFoundException ex){
            ex.printStackTrace();
       //   log("File not found: " + ex);
        }
        catch (IOException ex){
        //  log(ex);
            ex.printStackTrace();
        }
      }
    private void copyWithStreams(InputStream aSourceFileInputStream, File aTargetFile, boolean aAppend) {
      //  log("Copying files with streams.");
        ensureTargetDirectoryExists(aTargetFile.getParentFile());
        InputStream inStream = null;
        OutputStream outStream = null;
        try{
          try {
            byte[] bucket = new byte[32*1024];
            inStream = new BufferedInputStream(aSourceFileInputStream);
            outStream = new BufferedOutputStream(new FileOutputStream(aTargetFile, aAppend));
            int bytesRead = 0;
            while(bytesRead != -1){
              bytesRead = inStream.read(bucket); //-1, 0, or more
              if(bytesRead > 0){
                outStream.write(bucket, 0, bytesRead);
              }
            }
          }
          finally {
            if (inStream != null) inStream.close();
            if (outStream != null) outStream.close();
          }
        }
        catch (FileNotFoundException ex){
            ex.printStackTrace();
       //   log("File not found: " + ex);
        }
        catch (IOException ex){
        //  log(ex);
            ex.printStackTrace();
        }
      }
    public void closeConnection() {
        try {
            this.Connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void ensureTargetDirectoryExists(File aTargetDir){
        if(!aTargetDir.exists()){
          aTargetDir.mkdirs();
        }
      }

    public void setConnection(Connection Connection) {
        this.Connection = Connection;
    }

    public Connection getConnection() {
        return Connection;
    }

    public void setOutputFile(File outputFile) {
        this.outputFile = outputFile;
    }

    public File getOutputFile() {
        return outputFile;
    }
}