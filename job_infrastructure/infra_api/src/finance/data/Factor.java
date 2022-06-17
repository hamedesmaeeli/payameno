package finance.data;

import java.math.BigDecimal;

import java.util.Date;

public class Factor {
    private BigDecimal id;
    private Account account;
    private BigDecimal amount;
    private Date createDate;
    private String description;
    private FactorType factorType;
    public Factor() {
        super();
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Account getAccount() {
        return account;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setFactorType(FactorType factorType) {
        this.factorType = factorType;
    }

    public FactorType getFactorType() {
        return factorType;
    }
}
