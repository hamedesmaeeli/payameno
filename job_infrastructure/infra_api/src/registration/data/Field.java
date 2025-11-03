package registration.data;

import java.io.Serializable;

import java.math.BigDecimal;

public class Field  {
    private BigDecimal id;
    private String name;
    private String Code;
    private boolean isActive;
    public Field() {   
    }
    public Field(BigDecimal id,String name) {
        this.id =id;
        this.name =name;
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

    public void setCode(String Code) {
        this.Code = Code;
    }

    public String getCode() {
        return Code;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public boolean getIsActive() {
        return isActive;
    }
}
