package model;

import java.math.BigDecimal;

import java.util.Date;

public class PaymentStepsView {
    public PaymentStepsView() {
        super();
    }
    private Date createDate;
    private Date nextPayment;
    private BigDecimal paymentStepId;
    private BigDecimal paymentFinanceId;
    private String paymentfinaceDescription;
    private String peymentFinnaceCode;
    private BigDecimal amount;
    private String accountBankName;
    private String receivePaytypeName;

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setNextPayment(Date nextPayment) {
        this.nextPayment = nextPayment;
    }

    public Date getNextPayment() {
        return nextPayment;
    }

    public void setPaymentStepId(BigDecimal paymentStepId) {
        this.paymentStepId = paymentStepId;
    }

    public BigDecimal getPaymentStepId() {
        return paymentStepId;
    }

    public void setPaymentFinanceId(BigDecimal paymentFinanceId) {
        this.paymentFinanceId = paymentFinanceId;
    }

    public BigDecimal getPaymentFinanceId() {
        return paymentFinanceId;
    }

    public void setPaymentfinaceDescription(String paymentfinaceDescription) {
        this.paymentfinaceDescription = paymentfinaceDescription;
    }

    public String getPaymentfinaceDescription() {
        return paymentfinaceDescription;
    }

    public void setPeymentFinnaceCode(String peymentFinnaceCode) {
        this.peymentFinnaceCode = peymentFinnaceCode;
    }

    public String getPeymentFinnaceCode() {
        return peymentFinnaceCode;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAccountBankName(String accountBankName) {
        this.accountBankName = accountBankName;
    }

    public String getAccountBankName() {
        return accountBankName;
    }

    public void setReceivePaytypeName(String receivePaytypeName) {
        this.receivePaytypeName = receivePaytypeName;
    }

    public String getReceivePaytypeName() {
        return receivePaytypeName;
    }
}
