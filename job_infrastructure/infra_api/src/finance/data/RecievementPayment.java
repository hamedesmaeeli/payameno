package finance.data;

import java.math.BigDecimal;

import java.util.Date;

public class RecievementPayment {
    private BigDecimal id;
    private Date eventDate;
    private BigDecimal amount;
    private AccountBank accountBank;
    private Account account;
    private RecievePayType recievePayType;
    private String description;
    private String code;
    public RecievementPayment() {
        super();
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAccountBank(AccountBank accountBank) {
        this.accountBank = accountBank;
    }

    public AccountBank getAccountBank() {
        return accountBank;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Account getAccount() {
        return account;
    }

    public void setRecievePayType(RecievePayType recievePayType) {
        this.recievePayType = recievePayType;
    }

    public RecievePayType getRecievePayType() {
        return recievePayType;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
