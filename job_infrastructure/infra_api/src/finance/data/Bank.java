package finance.data;

import java.math.BigDecimal;

public class Bank {
    private BigDecimal id;
    private String name;
   
    public Bank(BigDecimal id,String name) {
     this.id = id;
     this.name = name;
    }
    public Bank() {
        super();
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
}
