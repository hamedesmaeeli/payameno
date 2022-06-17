package finance.data;

import java.math.BigDecimal;

import java.util.Date;

public class Check {
    
    private BigDecimal id;
    private Date  createdDate;
    private String number;
    private BigDecimal amount;
    private String forHow;
    private Date checkDate;
    private Bank bank;
    private String bankBranch;
    private String description;
    private CheckStatus checkStatus;
    private Account account;
    private AccountBank accountBank;
    
    
    
    public Check() {
        super();
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNumber() {
        return number;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setForHow(String forHow) {
        this.forHow = forHow;
    }

    public String getForHow() {
        return forHow;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBankBranch(String bankBranch) {
        this.bankBranch = bankBranch;
    }

    public String getBankBranch() {
        return bankBranch;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
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
}
