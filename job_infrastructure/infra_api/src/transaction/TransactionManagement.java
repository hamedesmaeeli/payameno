package transaction;


import java.io.File;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sun.jdbc.odbc.JdbcOdbcDriver;
public class TransactionManagement {
    private static TransactionManagement transactionManager;
    public static TransactionManagement getInstance()  {
          
        if (transactionManager == null)
          transactionManager = new TransactionManagement();
        return transactionManager;
      }
    public TransactionManagement() {
        
    }
    public Connection getConnection() {
        try {
         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            Connection connection = DriverManager.getConnection(
                  "jdbc:mysql://localhost:3306/school_new?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", "root", "root");   
       // System.out.println("new conn1");
             
        return connection;
         
    
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
    public Connection getMsSqlConnection(String dbHost,String dbName,String dbService) {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://"+dbHost+"\\"+dbService+";databaseName="+dbName+";integratedSecurity=true";
            System.out.println("dburl= "+dbURL);
            Connection con = DriverManager.getConnection(dbURL);//here put the new simple url.
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    public Connection getMsAccessConnection(String fileName) {
        try {
        // Load MS accces driver class
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

        // C:\\databaseFileName.accdb" - location of your database 
        String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + "C:\\bank.accdb";

        // specify url, username, pasword - make sure these are valid 
        Connection conn = DriverManager.getConnection(url, "", "");

        System.out.println("Connection Succesfull");
        } catch (Exception e) {
        System.err.println("Got an exception! ");
        System.err.println(e.getMessage());

        }
        return null;
    }
   
    public static void main(String[] args) {
        //rb.restore(testFile);
    }
}
