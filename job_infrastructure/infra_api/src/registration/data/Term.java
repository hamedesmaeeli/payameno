package registration.data;

import java.math.BigDecimal;

import java.util.Date;

public class Term {
   private BigDecimal id;
   private String name;
   private Date fromDate;
   private Date toDate;
   private Boolean isCurrent;
   private int dore;
   private int year;

   public Term() {
       
   }
   public Term(BigDecimal id,String name,Date fromDate,Date toDate , int year, int dore) {
       this.id = id;
       this.name = name;
       this.fromDate = fromDate;
       this.toDate = toDate;
       this.year = year;
       this.dore = dore;
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

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setIsCurrent(Boolean isCurrent) {
        this.isCurrent = isCurrent;
    }

    public Boolean getIsCurrent() {
        return isCurrent;
    }

    public void setDore(int dore) {
        this.dore = dore;
    }

    public int getDore() {
        return dore;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getYear() {
        return year;
    }
}
