package view;

import finance.data.Account;
import finance.data.AccountBank;
import finance.data.RecievePayType;

import finance.process.AccountManager;

import java.util.Date;

import org.basa.tejarat.ftms.core.datatime.IranianDate;

public class CashAccountingBean {
    
    private Date cashSearchStartDate =new Date();
    private Date cashSearchEndDate = new Date();
    private Account cashSearchAccount;
    private RecievePayType cashSearchReceivePayType;
    private AccountBank cashSearchAccountBank;
    public CashAccountingBean() {
     AccountManager am = new AccountManager();
     cashSearchAccountBank = am.getCash();
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
    public String getConvertToShamsi(Date date) {
        IranianDate dateIran = new IranianDate();
        dateIran.setDate(date);
        return dateIran.getIranianDate();
            }
    public String getTest(String str) {
        IranianDate dateIran = new IranianDate();
        dateIran.setDate(new Date());
        return dateIran.getIranianDate();
    }
}