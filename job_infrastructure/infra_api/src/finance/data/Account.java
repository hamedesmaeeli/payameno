package finance.data;

import java.math.BigDecimal;

import java.util.Date;

public class Account {
    private BigDecimal id;
    private String name;
    private String phone;
    private String personName;
    private String personMobile;
    private String fax;
    private Date create_date;
    private String address;
    private BigDecimal fisrtPayable;
    public Account() {        
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

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonMobile(String personMobile) {
        this.personMobile = personMobile;
    }

    public String getPersonMobile() {
        return personMobile;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getFax() {
        return fax;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setFisrtPayable(BigDecimal fisrtPayable) {
        this.fisrtPayable = fisrtPayable;
    }

    public BigDecimal getFisrtPayable() {
        return fisrtPayable;
    }
}
