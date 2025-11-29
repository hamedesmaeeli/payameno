package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java.io.InputStream;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.servlet.ServletContext;

import transaction.TransactionManagement;


public class RestoreBackup {
    public RestoreBackup() {
        super();
    }
    String dbName = "school_new";
    String dbUser = "root";
    String dbPass = "root";
    String backupFileName = "backup321.sql";

    public File backup() {
        /******************************************************/
        //Database Properties
        /******************************************************/
        File backupFilePath = null;
        /***********************************************************/
        // Execute Shell Command
        /***********************************************************/
        String executeCmd = "";
        executeCmd =
                "mysqldump -u " + dbUser + " -p" + dbPass + " " +"--default-character-set=utf8  --no-create-info " +dbName + " -r " +
                backupFileName;
        //executeCmd =
          //      "mysqldump -u " + dbUser + " -p" + dbPass + " " +"--default-character-set=utf8  --tables " +dbName + " -r " +
            //    backupFileName;

        Process runtimeProcess;
        try {
            System.out.println("run path = " +
                               RestoreBackup.class.getClassLoader().getResource(""));
            File file =
                new File(RestoreBackup.class.getClassLoader().getResource("").getFile());
            runtimeProcess = Runtime.getRuntime().exec(executeCmd, null, file);
            File backupFile = new File(file, backupFileName);
            System.out.println("backup file = " + backupFile.getPath());
            int processComplete = runtimeProcess.waitFor();
            if (processComplete == 0) {
                System.out.println("Backup taken successfully");
                backupFilePath = backupFile;
            } else {
                System.out.println("Could not take mysql backup");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return backupFilePath;
    }
    public String getBackupFilePath(){
        ExternalContext ectx = FacesContext.getCurrentInstance().getExternalContext(); 
        ServletContext context =(ServletContext)ectx.getContext();  
        
        System.out.println("........2........"+context.getRealPath(File.separator)+"backup");
        
    //        getJasperFileIS("Incoming_letter_status.jasper");
        File file=new File(context.getRealPath(File.separator)+File.separator+"backup");
        if(!file.exists())
            file.mkdirs();
        
        return context.getRealPath(File.separator+"backup");
    }
    public InputStream getRestoreFileIS(String restoreFileName){
        ExternalContext ectx = FacesContext.getCurrentInstance().getExternalContext(); 
        ServletContext context =(ServletContext)ectx.getContext();  
        String fileName = context.getRealPath(File.separator+"backup");
        System.out.println(" .......  backup path ---"+this.getBackupFilePath());
        System.out.println("...............backup..............."+RestoreBackup.class.getClassLoader().getResource("backup/"+restoreFileName));
        fileName =  fileName+""+restoreFileName;
        System.out.println("********* file name = "+restoreFileName);
        
       // InputStream is = getClass().getClassLoader().getResourceAsStream("backup/"+fileName);
      // InputStream is = getClass().getClassLoader().getResourceAsStream("report/jasperFile/"+"kart_koli.jasper");
       //InputStream is = getClass().getClassLoader().getResourceAsStream("backup/"+"school_new_structure_table.sql"); 
       InputStream is = getClass().getClassLoader().getResourceAsStream("backup/"+"school_new_structure_tables.sql");
        return is;
    }
    
    public void restore(File file) {
        this.killSleepConnection();
        /******************************************************/
        //Database Properties
        /******************************************************/

        /***********************************************************/
        // Execute Shell Command
        /***********************************************************/
        String[] executeCmd;

     // String  executeCmd = "mysql -u " + dbUser + " -p" + dbPass + " " + dbName + " < " +file.getPath();
     // System.out.println("cmd = "+ executeCmd );
     // System.out.println("cmd path = "+ file.getParent() );
     // executeCmd = new String[]{ "mysql -u " + dbUser+ " -p"+dbPass+" " + dbName+ " < "+file.getName() ,"/bin/sh", "-c",};
        System.out.println("restored file path :"+file.getPath()+" "+file.getName());
        executeCmd = new String[]{"mysql", dbName, "-u" + dbUser, "-p" + dbPass, "-e", " source "+file.getName()};
        
        System.out.println("exceute cmd : "+ executeCmd.toString());
        Process runtimeProcess;
        try {
           runtimeProcess = Runtime.getRuntime().exec(executeCmd, null, new File(file.getParent()));
          //  runtimeProcess = Runtime.getRuntime().exec(executeCmd);     
            int processComplete = runtimeProcess.waitFor();
            if (processComplete == 0) {

                System.out.println("success");

            } else {

                System.out.println("restore failure");

            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
   
   public void restoreScript(File file) {
       try{
           
        Connection connection =  this.getConnection();
         ScriptRunner runner = new ScriptRunner(connection, true, true);
        // runner.runScript(new BufferedReader(new FileReader("test_db/test_db.sql")));
        runner.runScript(new BufferedReader(new FileReader(file)));
        
        }
       catch(SQLException se){
         System.out.println("SQL Exception Occurs :=>"+se.toString());
        }catch(FileNotFoundException fe){
         System.out.println("File Not Found Exception Occurs :=>"+fe.toString());
        }catch(IOException ie){
         System.out.println("IO Exception Occurs :=>"+ie.toString());
        } 
    }
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost:3306/test2?useUnicode=yes&characterEncoding=UTF-8", "root", "root");   
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
    public boolean restoreDB(File file) {
        //this.killSleepConnection();
           String path = file.getPath();
           if (!path.contains(".sql")) {
               file = new File(path + ".sql");
           }

           String[] executeCmd = new String[]{"mysql", "--user=" + this.dbUser, "--password=" + this.dbPass, "-e", "source " + file.getPath()};

           Process runtimeProcess;
           try {

               runtimeProcess = Runtime.getRuntime().exec(executeCmd);
               int processComplete = runtimeProcess.waitFor();

               if (processComplete == 0) {
                   System.out.println("Backup restored successfully");
                   return true;
               } else {
                   System.out.println("Could not restore the backup");
               }
           } catch (Exception ex) {
               ex.printStackTrace();
           }

           return false;
       }
    
    public void killSleepConnection() {
        System.out.print("in the killSleepConnection");
               try  {
                   Connection conn = TransactionManagement.getInstance().getConnection();
                    Statement stmt = conn.createStatement();
                    PreparedStatement killStmt = conn.prepareStatement("");
                   // گرفتن لیست پروسه‌ها
                   ResultSet rs = stmt.executeQuery("SELECT id, command FROM information_schema.processlist");

                   while (rs.next()) {
                          int id = rs.getInt("id");
                          String command = rs.getString("command");

                          if ("Sleep".equalsIgnoreCase(command)) {
                              String killQuery = "KILL " + id;
                              System.out.println("Executing: " + killQuery);
                              killStmt.execute(killQuery); // استفاده از Statement جدا
                          }
                      }

               } catch (Exception e) {
                   e.printStackTrace();
               }
    }
   
    public static void main(String[] args) {
        RestoreBackup rb = new RestoreBackup();
       // rb.backup();
        File testFile = new File("C:\\MyTest\\backup.sql");
        //rb.restore(testFile);
        rb.killSleepConnection();
    }
}