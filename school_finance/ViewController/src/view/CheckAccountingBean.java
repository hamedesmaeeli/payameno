package view;

import finance.data.Account;
import finance.data.AccountBank;
import finance.data.Bank;
import finance.data.CheckStatus;

import java.math.BigDecimal;

import java.util.Date;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.jbo.Row;

public class CheckAccountingBean {
    Date expireStartDate = new Date();
    Date expireEndDate = new Date() ;
    CheckStatus checkStatus;
    Account account;
    AccountBank accountBank;
    Bank bank;
    public CheckAccountingBean() {
        this.setSelectedCheckStatus();
    }

    public void setExpireStartDate(Date expireStartDate) {
        this.expireStartDate = expireStartDate;
    }

    public Date getExpireStartDate() {
        return expireStartDate;
    }

    public void setExpireEndDate(Date expireEndDate) {
        this.expireEndDate = expireEndDate;
    }

    public Date getExpireEndDate() {
        return expireEndDate;
    }

    public void setCheckStatus(CheckStatus checkStatus) {
        this.checkStatus = checkStatus;
    }

    public CheckStatus getCheckStatus() {
        return checkStatus;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccountBank(AccountBank accountBank) {
        this.accountBank = accountBank;
    }

    public AccountBank getAccountBank() {
        return accountBank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public Bank getBank() {
        return bank;
    }
    public void setSelectedCheckStatus() {
        
        
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allCheckStatusIterator");
                Row row = iter.getCurrentRow();
               if(row!=null)
               {
                
                this.checkStatus = new CheckStatus((BigDecimal)row.getAttribute(0),(String)row.getAttribute(1));
               System.out.println(row.getAttribute(0));
               }
    }

    public void changeStatusCheck(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        
        if(valueChangeEvent.getNewValue()!=null){
                int index =
                    Integer.parseInt(valueChangeEvent.getNewValue().toString());
                DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allCheckStatusIterator");
                if (index < iter.getViewObject().getEstimatedRowCount()) {
                    Row row = iter.getRowAtRangeIndex(index);
                    this.checkStatus= new CheckStatus((BigDecimal)row.getAttribute(0),(String)row.getAttribute(1));
                }
                }else{
                    this.checkStatus =null;
                }   
        
    }
}