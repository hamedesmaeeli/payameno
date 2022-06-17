package registration.data;

import finance.data.Check;

import java.math.BigDecimal;

import java.util.Date;

public class RegistrationCheck {
private BigDecimal id;
private Check check;

private Date createDate;
private Registration registartion;

    public void setCheck(Check check) {
        this.check = check;
    }

    public Check getCheck() {
        return check;
    }


    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setRegistartion(Registration registartion) {
        this.registartion = registartion;
    }

    public Registration getRegistartion() {
        return registartion;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }
}
