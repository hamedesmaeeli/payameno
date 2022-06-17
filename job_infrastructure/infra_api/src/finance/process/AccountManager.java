package finance.process;

import finance.data.Account;

import finance.data.AccountBank;
import finance.data.AccountTolalInfo;
import finance.data.Bank;
import finance.data.Check;


import finance.data.CheckStatus;
import finance.data.Factor;
import finance.data.RecievePayType;
import finance.data.RecievementPayment;

import java.math.BigDecimal;

import java.math.BigInteger;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;

import java.util.Date;

import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.Student;
import registration.data.StudentStatus;

import sun.nio.cs.ext.Big5;

import transaction.TransactionManagement;
import transaction.Utilty;

public class AccountManager {
    public AccountManager() {
    }
    public Account createAccount(Account account) {
      Connection con =  TransactionManagement.getInstance().getConnection();
      PreparedStatement pre;
        try {
            pre = con.prepareStatement("insert into finance_account(name,phone,person_mobile,create_date,fisrt_payable,person_name,address,fax) values(?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                pre.setString(1, account.getName());
            pre.setString(2, account.getPhone());
            pre.setString(3, account.getPersonMobile());
            pre.setDate(4, Utilty.convertDateUtilToSQL(account.getCreate_date()));
            pre.setBigDecimal(5, account.getFisrtPayable());
            pre.setString(6, account.getPersonName());
            pre.setString(7, account.getAddress());
            pre.setString(8,account.getFax());
            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            rs.next();
            account.setId(rs.getBigDecimal(1));
            System.out.println("id = "+ rs.getBigDecimal(1));
            con.close();
            return account;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Factor createFactor(Factor factor) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("insert into finance_factor(account_person_id,amount,create_date,description,type_id) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
              pre.setBigDecimal(1, factor.getAccount().getId());
              pre.setBigDecimal(2, factor.getAmount());
              pre.setDate(3, Utilty.convertDateUtilToSQL(new Date()));
              pre.setString(4, factor.getDescription());
              pre.setBigDecimal(5, factor.getFactorType().getId());
              pre.executeUpdate();
              ResultSet rs = pre.getGeneratedKeys();
              rs.next();
              factor.setId(rs.getBigDecimal(1));
              System.out.println("id = "+ rs.getBigDecimal(1));
              con.close();
              return factor;
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }   
    public Factor updateFactor(Factor factor) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("update finance_factor set account_person_id=?,amount=?,description=?,type_id=? where id= "+factor.getId());
              pre.setBigDecimal(1, factor.getAccount().getId());
              pre.setBigDecimal(2, factor.getAmount());
              pre.setString(3, factor.getDescription());
              pre.setBigDecimal(4, factor.getFactorType().getId());
              pre.executeUpdate();
              con.close();
              return factor;
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }
    public int deleteFactor(Factor factor) {
        //TODO
        //if this factor hasnot any payments or checks
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from finance_factor where id = "+factor.getId());
          result =1; 
            connection.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;
    }
    
    public int deleteCheck(Check check) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from finance_check where id = "+check.getId());
          result =1; 
            connection.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;
    }
    public RecievementPayment setPayForAccount(RecievementPayment recievementPayment ) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("insert into finance_receive_payment(event_date,amount,account_bank_id,account_person_id,receive_pay_type_id,description,code) values(?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
              pre.setDate(1, Utilty.convertDateUtilToSQL(recievementPayment.getEventDate()));
              pre.setBigDecimal(2, recievementPayment.getAmount());
              pre.setBigDecimal(3, recievementPayment.getAccountBank().getId());
              pre.setBigDecimal(4,recievementPayment.getAccount().getId());
              pre.setBigDecimal(5, recievementPayment.getRecievePayType().getId());
              pre.setString(6, recievementPayment.getDescription());
              pre.setString(7, recievementPayment.getCode());
              
              pre.executeUpdate();
              ResultSet rs = pre.getGeneratedKeys();
              rs.next();
              recievementPayment.setId(rs.getBigDecimal(1));
              System.out.println("id = "+ rs.getBigDecimal(1));
              con.close();
              return recievementPayment;
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }
    
    public int deletePayForAccount(RecievementPayment recievementPayment) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        int result=0;
        try {
         statement = connection.createStatement();
          statement.executeUpdate("delete from finance_receive_payment where id = "+recievementPayment.getId());
          result =1; 
            connection.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return result;   
    }
    public BigDecimal getCurrentAccounting(Account account) {
       
        BigDecimal totalFactorAmount = new BigDecimal("0");
        BigDecimal totalReceivePayAmount = new BigDecimal("0");
        BigDecimal totalWaitingChecksAmount = new BigDecimal("0");
        BigDecimal totalAccounting = new BigDecimal("0");
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("SELECT Sum(finance_receive_payment.amount) as all_amount FROM finance_receive_payment WHERE finance_receive_payment.account_person_id = "+account.getId());
          if(result.next()) {
              if(result.getBigDecimal(1)!=null)      
              totalReceivePayAmount = result.getBigDecimal(1);
            
          }
          result=  statement.executeQuery("SELECT Sum(finance_factor.amount) AS all_amount FROM finance_factor WHERE finance_factor.account_person_id =  "+account.getId());  
          if(result.next()) {
               if(result.getBigDecimal(1)!=null)
                totalFactorAmount = result.getBigDecimal(1);
           }
            //only return checks
          result=  statement.executeQuery("SELECT Sum(finance_check.amount) AS all_amount FROM finance_check WHERE finance_check.status_id <>  '1' AND finance_check.account_id = "+account.getId());  
            if(result.next()) {
                 if(result.getBigDecimal(1)!=null)
                  totalWaitingChecksAmount = result.getBigDecimal(1);
             }
          System.out.println("factor = "+totalFactorAmount+" pays = "+totalReceivePayAmount+ "checks = "+totalWaitingChecksAmount+"first = "+ account.getFisrtPayable());
          connection.close();

          totalAccounting =totalAccounting.add(totalFactorAmount);
          totalAccounting =totalAccounting.add(totalReceivePayAmount);
          totalAccounting =totalAccounting.add(totalWaitingChecksAmount); 
          totalAccounting =totalAccounting.add(account.getFisrtPayable()); 
            
          return totalAccounting;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalAccounting;
    }
 
    public BigDecimal getAccountBankAccounting(AccountBank accountBank) {
        
        BigDecimal totalAccounting = new BigDecimal("0");
        BigDecimal firstAmount  = new BigDecimal("0");
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;

        try {
         statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("SELECT Sum(finance_receive_payment.amount) as all_amount FROM finance_receive_payment WHERE finance_receive_payment.account_bank_id = "+accountBank.getId());

          if(result.next()) {
              if(result.getBigDecimal(1)!=null)      
              totalAccounting= result.getBigDecimal(1);
          }
          result=  statement.executeQuery("SELECT first_amount FROM finance_account_bank WHERE id = "+accountBank.getId());   
          if(result.next()) {
                if(result.getBigDecimal(1)!=null)      
                firstAmount = result.getBigDecimal(1);
            }
          connection.close();

          totalAccounting =totalAccounting.add(firstAmount);
         
          return totalAccounting;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalAccounting;
    }
    public Check createNewCheck(Check check) {
        Connection con =  TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
          try {
              pre = con.prepareStatement("insert into finance_check(created_date,number,amount,for_how,check_date,bank_id,bank_branch,description,status_id,account_id,bank_account_id) values(?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
              pre.setDate(1, Utilty.convertDateUtilToSQL(check.getCreatedDate()));
              pre.setString(2, check.getNumber());
              pre.setBigDecimal(3, check.getAmount());
              pre.setString(4, check.getForHow());
              pre.setDate(5, Utilty.convertDateUtilToSQL(check.getCheckDate()));
              pre.setBigDecimal(6, check.getBank().getId());
              pre.setString(7, check.getBankBranch());
              pre.setString(8, check.getDescription());
              pre.setBigDecimal(9,check.getCheckStatus().getId()); //for waiting check
              pre.setBigDecimal(10, check.getAccount().getId());
              pre.setBigDecimal(11, check.getAccountBank().getId());
              
              pre.executeUpdate();
              ResultSet rs = pre.getGeneratedKeys();
              rs.next();
              check.setId(rs.getBigDecimal(1));
              System.out.println("id = "+ rs.getBigDecimal(1));
              con.close();
              return check;
          } catch (SQLException e) {
              e.printStackTrace();
          }
          return null;
    }
    public void returnCheck(Check check) {
        //
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          
           statement = connection.createStatement();
           PreparedStatement pre =  connection.prepareStatement("update finance_check set status_id = ? where id = "+check.getId()); 
           pre.setBigDecimal(1,new BigDecimal("1")); // return check 
           pre.executeUpdate();
           connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }     
    }
    public void passCheck(Check check) {
        Connection connection = TransactionManagement.getInstance().getConnection();
        PreparedStatement pre;
        try {
          
            pre = connection.prepareStatement("insert into finance_receive_payment(event_date,amount,account_bank_id,receive_pay_type_id,description) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            pre.setDate(1, Utilty.convertDateUtilToSQL(new Date()));
            pre.setBigDecimal(2, check.getAmount());
            pre.setBigDecimal(3, check.getAccountBank().getId());
            pre.setBigDecimal(4, new BigDecimal(4)); //for pass check
            pre.setString(5,"check passed");
            
            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            rs.next();
            BigDecimal receivePayId =  rs.getBigDecimal(1);
            System.out.println("id = "+ rs.getBigDecimal(1));
            
           
           
           pre =  connection.prepareStatement("update finance_check set status_id = ?,pay_id=?  where id = "+check.getId()); 
           pre.setBigDecimal(1,new BigDecimal("2")); // pass check
           pre.setBigDecimal(2, receivePayId); 
           pre.executeUpdate();
           connection.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        
    }
    public AccountBank getCash() {
        
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        AccountBank accountbank;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from finance_account_bank where is_cash = 1");
          if(result.next()) {
              accountbank= new AccountBank();
              accountbank.setId(result.getBigDecimal("id"));
              accountbank.setName(result.getString("name"));
              accountbank.setIsCash(true);
              accountbank.setFirstAmount(result.getBigDecimal("first_amount"));
              accountbank.setBank(new Bank(result.getBigDecimal("bank_id"),""));
                      connection.close();
                      return accountbank;
                  }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<AccountBank> getAllAccountBanks() {
        ArrayList<AccountBank> accountBanks = new ArrayList<AccountBank>(); 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        AccountBank accountbank;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from bank_account_V where is_cash = 0");
          while(result.next()) {
              accountbank= new AccountBank();
              accountbank.setId(result.getBigDecimal("id"));
              accountbank.setName(result.getString("name"));
              accountbank.setIsCash(false);
              accountbank.setFirstAmount(result.getBigDecimal("first_amount"));
              accountbank.setBank(new Bank(result.getBigDecimal("bank_id"),result.getString("bank_name")));
              accountBanks.add(accountbank);
                  }
            connection.close();
            return accountBanks;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<Bank> getAllBanks() {
        ArrayList<Bank> banks = new ArrayList<Bank>(); 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        Bank bank;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from finance_bank ");
          while(result.next()) {
              bank= new Bank();
              bank.setId(result.getBigDecimal("id"));
              bank.setName(result.getString("name"));
              
              banks.add(bank);
                  }
            connection.close();
            return banks;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return banks;
    }
    
    public ArrayList<RecievementPayment> searchReceivementPayments(Date fromDate,Date toDate,Account account,RecievePayType recievPayType,AccountBank accountBank ) {
        //if field ,level, organization,studentStatus is null returned all
        
        ArrayList<String> whereStrings = new ArrayList<String>();
        
        String whereClouse ="";
        
        if(fromDate != null) {
            whereStrings.add("event_date >='"+Utilty.convertDateUtilToSQL(fromDate)+"'");
        }
        if(toDate != null) {
            whereStrings.add("event_date <='"+Utilty.convertDateUtilToSQL(toDate)+"'");
        }
        if(accountBank != null) {
            whereStrings.add("account_bank_id = "+accountBank.getId());
        }
        if(account != null) {
            whereStrings.add("account_person_id = "+account.getId());
        }
        if(recievPayType != null) {
            whereStrings.add("receive_pay_type_id = "+recievPayType.getId());
        }
        if(whereStrings.size()>0) {
            whereClouse = "where "+whereStrings.get(0);
            for(int i=1;i<whereStrings.size();i++) {
                whereClouse = whereClouse+ " and "+ whereStrings.get(i);    
            }
        }  
        ArrayList<RecievementPayment> receivePayments = new ArrayList<RecievementPayment>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
         ResultSet result;
          String sql;
           sql = "select * from receive_pay_v "+whereClouse;
           result = statement.executeQuery(sql);
         
          System.out.println("sql = "+sql);  
          RecievementPayment receivementPayment;
          Account newAccount;
          AccountBank newAccountBank;
          while(result.next()) {
              receivementPayment = new RecievementPayment();
              receivementPayment.setAmount(result.getBigDecimal("amount"));
              receivementPayment.setCode(result.getString("code"));
              receivementPayment.setDescription(result.getString("description"));
              receivementPayment.setId(result.getBigDecimal("id"));
              receivementPayment.setEventDate(Utilty.convertDateSQLToUtil(result.getDate("event_date")));
              newAccount = new Account();
              newAccount.setAddress(result.getString("address"));
              if(result.getDate("create_date")!=null)
               newAccount.setCreate_date(Utilty.convertDateSQLToUtil(result.getDate("create_date")));
              newAccount.setFax(result.getString("fax"));
              newAccount.setFisrtPayable(result.getBigDecimal("fisrt_payable"));
              newAccount.setId(result.getBigDecimal("account_person_id"));
              newAccount.setName(result.getString("account_name"));
              newAccount.setPersonMobile(result.getString("person_mobile"));
              newAccount.setPersonName(result.getString("person_name"));
              newAccount.setPhone(result.getString("phone"));
              
              receivementPayment.setAccount(newAccount);
              
              newAccountBank = new AccountBank ();
              newAccountBank.setBank(new Bank(result.getBigDecimal("bank_id"),result.getString("bank_name")));
              newAccountBank.setFirstAmount(result.getBigDecimal("first_amount"));
              newAccountBank.setId(result.getBigDecimal("account_bank_id"));
              newAccountBank.setIsCash(result.getBoolean("is_cash"));
              newAccountBank.setName(result.getString("b_a_name"));
              
              receivementPayment.setAccountBank(newAccountBank);
              
             
              
              receivementPayment.setRecievePayType(new RecievePayType(result.getBigDecimal("receive_pay_type_id"),result.getString("rec_pay_type_name")));
              
              receivePayments.add(receivementPayment);
              
          }
            connection.close();
            return receivePayments;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receivePayments;
    }
    
    public ArrayList<Check> searchChecks(Date expireStartDate,Date expireEndDate , CheckStatus checkStatus,Account account , AccountBank accountBank ,Bank bank) {
        ArrayList<String> whereStrings = new ArrayList<String>();
        
        String whereClouse ="";
        
        if(expireStartDate != null) {
            whereStrings.add("check_date >='"+Utilty.convertDateUtilToSQL(expireStartDate)+"'");
        }
        if(expireEndDate != null) {
            whereStrings.add("check_date <='"+Utilty.convertDateUtilToSQL(expireEndDate)+"'");
        }
        if(checkStatus != null) {
            whereStrings.add("status_id = "+checkStatus.getId());
        }
        if(account != null) {
            whereStrings.add("account_id = "+account.getId());
        }
        if(accountBank != null) {
            whereStrings.add("bank_account_id = "+accountBank.getId());
        }
        if(bank != null) {
            whereStrings.add("bank_id = "+bank.getId());
        }
        if(whereStrings.size()>0) {
            whereClouse = "where "+whereStrings.get(0);
            for(int i=1;i<whereStrings.size();i++) {
                whereClouse = whereClouse+ " and "+ whereStrings.get(i);    
            }
        }
        ArrayList<Check> checks= new ArrayList<Check>();
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        try {
          statement = connection.createStatement();
         ResultSet result;
          String sql;
           sql = "select * from check_v "+whereClouse;
           result = statement.executeQuery(sql);
         
          System.out.println("sql = "+sql);  
          Check check;
          Account newAccount;
          AccountBank newAccountBank;
        
          while(result.next()) {
              check = new Check();
              check .setAmount(result.getBigDecimal("amount"));
              check.setId(result.getBigDecimal("id"));
              check.setNumber(result.getString("number"));
              check.setForHow(result.getString("for_how"));
              check.setDescription(result.getString("description"));
              check.setCheckDate(Utilty.convertDateSQLToUtil(result.getDate("check_date")));
              check.setBankBranch(result.getString("bank_branch"));
              check.setCreatedDate(Utilty.convertDateSQLToUtil(result.getDate("created_date")));
              
              
              
              
              
              newAccount = new Account();
              newAccount.setAddress(result.getString("address"));
              if(result.getDate("create_date")!=null)
               newAccount.setCreate_date(Utilty.convertDateSQLToUtil(result.getDate("create_date")));
              newAccount.setFax(result.getString("fax"));
              newAccount.setFisrtPayable(result.getBigDecimal("fisrt_payable"));
              newAccount.setId(result.getBigDecimal("account_id"));
              newAccount.setName(result.getString("account_name"));
              newAccount.setPersonMobile(result.getString("person_mobile"));
              newAccount.setPersonName(result.getString("person_name"));
              newAccount.setPhone(result.getString("phone"));
              
              check.setAccount(newAccount);
              
              newAccountBank = new AccountBank ();
              newAccountBank.setBank(new Bank(result.getBigDecimal("bank_account_b_id"),result.getString("bank_account_b_name")));
              newAccountBank.setFirstAmount(result.getBigDecimal("first_amount"));
              newAccountBank.setId(result.getBigDecimal("bank_account_id"));
              newAccountBank.setIsCash(result.getBoolean("is_cash"));
              newAccountBank.setName(result.getString("bank_account_name"));
              
              check.setAccountBank(newAccountBank);
              
             
              
              check.setCheckStatus(new CheckStatus(result.getBigDecimal("status_id"),result.getString("status_name")));
              
              check.setBank(new Bank(result.getBigDecimal("bank_id"), result.getString("bank_name")));
              
              checks.add(check);
              
          }
            connection.close();
            return checks;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checks;
        
        
    }
    public ArrayList<CheckStatus> getAllCheckStatus() {
        ArrayList<CheckStatus> checkStatuses = new ArrayList<CheckStatus>(); 
        Connection connection = TransactionManagement.getInstance().getConnection();
        Statement statement;
        CheckStatus checkStatus;
        try {
            statement = connection.createStatement();
          ResultSet result=  statement.executeQuery("select * from finance_check_status ");
          while(result.next()) {
              checkStatus= new CheckStatus();
              checkStatus.setId(result.getBigDecimal("id"));
              checkStatus.setName(result.getString("name"));
              
              checkStatuses.add(checkStatus);
                  }
            connection.close();
            return checkStatuses;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checkStatuses;
    }
    public ArrayList<Account> getAllAccounts() {
       return null; 
    }
    public void deleteAccount(Account account) {
        
    }
    public void updateAccount(Account account) {
        Connection con =  TransactionManagement.getInstance().getConnection();
                PreparedStatement pre;
                  try {
                      pre = con.prepareStatement("update finance_account set name =?,phone=?,person_mobile=?,fisrt_payable=?,person_name=?,address=?,fax=? where id ="+account.getId(),Statement.RETURN_GENERATED_KEYS);
                     pre.setString(1, account.getName());
                      pre.setString(2, account.getPhone());
                      pre.setString(3, account.getPersonMobile());
                      pre.setBigDecimal(4, account.getFisrtPayable());
                      pre.setString(5, account.getPersonName());
                      pre.setString(6, account.getAddress());
                      pre.setString(7,account.getFax());
                      pre.executeUpdate();   
                  } catch (SQLException e) {
                      e.printStackTrace();
                  }
    }
    public ArrayList<Check> getAllAccountChecks(Account account) {
        return null;
    }
    public ArrayList<RecievementPayment> getAllAccountPeyments(Account account) {
        return null;
    }
    public ArrayList<RecievementPayment>getAllReceivements(Account account) {
        return null;
    }
    public AccountTolalInfo getTotalInfo(Account account) {   
    return null;
    }
    
}