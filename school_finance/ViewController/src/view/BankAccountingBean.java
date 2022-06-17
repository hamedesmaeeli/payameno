package view;

import finance.data.Account;
import finance.data.AccountBank;
import finance.data.RecievePayType;

import finance.process.AccountManager;

import java.math.BigDecimal;

import java.util.Date;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.jbo.Row;

public class BankAccountingBean {
    private Date cashSearchStartDate =new Date();
    private Date cashSearchEndDate = new Date();
    private Account cashSearchAccount;
    private RecievePayType cashSearchReceivePayType;
    private AccountBank cashSearchAccountBank;
    private BigDecimal selectedAccoutBankAllAmount;
    public BankAccountingBean() {
        System.out.println("in BankAccounting bean");
        setSelectedAccountBank();
        AccountManager am = new AccountManager();
        selectedAccoutBankAllAmount = am.getAccountBankAccounting(this.cashSearchAccountBank);
        
    }

    public void setCashSearchStartDate(Date cashSearchStartDate) {
        this.cashSearchStartDate = cashSearchStartDate;
    }

    public Date getCashSearchStartDate() {
        return cashSearchStartDate;
    }

    public void setCashSearchEndDate(Date cashSearchEndDate) {
        this.cashSearchEndDate = cashSearchEndDate;
    }

    public Date getCashSearchEndDate() {
        return cashSearchEndDate;
    }

    public void setCashSearchAccount(Account cashSearchAccount) {
        this.cashSearchAccount = cashSearchAccount;
    }

    public Account getCashSearchAccount() {
        return cashSearchAccount;
    }

    public void setCashSearchReceivePayType(RecievePayType cashSearchReceivePayType) {
        this.cashSearchReceivePayType = cashSearchReceivePayType;
    }

    public RecievePayType getCashSearchReceivePayType() {
        return cashSearchReceivePayType;
    }

    public void setCashSearchAccountBank(AccountBank cashSearchAccountBank) {
        this.cashSearchAccountBank = cashSearchAccountBank;
    }

    public AccountBank getCashSearchAccountBank() {
        return cashSearchAccountBank;
    }

    public void changeAccountBank(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
       
      this.setSelectedAccountBank() ;
    }
    public void setSelectedAccountBank() {
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allAccountBanksIterator");
                
               
                Row row = iter.getCurrentRow();
               if(row!=null)
               {
                AccountBank accuntBank = new AccountBank();
                accuntBank.setId((BigDecimal)(row.getAttribute(0)));
               this.cashSearchAccountBank = accuntBank;
               }
    }

    public void setSelectedAccoutBankAllAmount(BigDecimal selectedAccoutBankAllAmount) {
        this.selectedAccoutBankAllAmount = selectedAccoutBankAllAmount;
    }

    public BigDecimal getSelectedAccoutBankAllAmount() {
        return selectedAccoutBankAllAmount;
    }
}
