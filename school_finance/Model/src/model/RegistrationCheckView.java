package model;

import java.math.BigDecimal;

import java.util.Date;

public class RegistrationCheckView {
    private BigDecimal id;
    private Date createdDate;
    private BigDecimal amount;
    private Date checkDate;
    private String checkDescription;
    private String checkforHow;
    private BigDecimal checkId;
    private String checkNumber;
    private String bankAccountName;
    private BigDecimal bankAccountId;
    private String checkBankName;
    private String checkStatusName;
    private BigDecimal checkStatusId;
    public RegistrationCheckView() {
       
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

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDescription(String checkDescription) {
        this.checkDescription = checkDescription;
    }

    public String getCheckDescription() {
        return checkDescription;
    }

    public void setCheckforHow(String checkforHow) {
        this.checkforHow = checkforHow;
    }

    public String getCheckforHow() {
        return checkforHow;
    }

    public void setCheckId(BigDecimal checkId) {
        this.checkId = checkId;
    }

    public BigDecimal getCheckId() {
        return checkId;
    }

    public void setCheckNumber(String checkNumber) {
        this.checkNumber = checkNumber;
    }

    public String getCheckNumber() {
        return checkNumber;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setCheckBankName(String checkBankName) {
        this.checkBankName = checkBankName;
    }

    public String getCheckBankName() {
        return checkBankName;
    }

    public void setCheckStatusName(String checkStatusName) {
        this.checkStatusName = checkStatusName;
    }

    public String getCheckStatusName() {
        return checkStatusName;
    }

    public void setBankAccountId(BigDecimal bankAccountId) {
        this.bankAccountId = bankAccountId;
    }

    public BigDecimal getBankAccountId() {
        return bankAccountId;
    }

    public void setCheckStatusId(BigDecimal checkStatusId) {
        this.checkStatusId = checkStatusId;
    }

    public BigDecimal getCheckStatusId() {
        return checkStatusId;
    }
}
