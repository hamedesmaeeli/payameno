package finance.data;

import java.math.BigDecimal;

public class AccountBank {
    private BigDecimal id;
    private String name;
    private Bank bank;
    private BigDecimal firstAmount;
    private boolean isCash;
    public AccountBank() {
        
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public Bank getBank() {
        return bank;
    }

    public void setFirstAmount(BigDecimal firstAmount) {
        this.firstAmount = firstAmount;
    }

    public BigDecimal getFirstAmount() {
        return firstAmount;
    }

    public void setIsCash(boolean isCash) {
        this.isCash = isCash;
    }

    public boolean isIsCash() {
        return isCash;
    }
}
