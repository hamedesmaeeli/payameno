package registration.data;

import java.math.BigDecimal;

public class Organization {
    private String name;
    private BigDecimal id;
    public Organization() {
    }
    public Organization(BigDecimal id,String name) {
       this.name = name;
       this.id =id;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }
}
