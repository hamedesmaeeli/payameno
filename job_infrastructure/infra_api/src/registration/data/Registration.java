package registration.data;

import java.math.BigDecimal;

import java.math.BigInteger;

import java.util.Date;

public class Registration {
    
    private BigDecimal id;
    private Date regDate;
    private Student student;
    private Field field; 
    private Term term;
    private Level level;
    private double numberOfTheoryUnits;
    private int numberOfActionalUnits;
    private BigDecimal fixShahriye;
    private BigDecimal theoryShahriye;
    private BigDecimal actionalShahriye;
    private BigDecimal otherShahriyAmount;
    private String otherSalaryComment;
    private BigDecimal totalShahriye;//calculated 
    private BigDecimal offAmount;
    private String offComment;
    private BigDecimal currentAccounting;//calculated
    private BigDecimal totalPayments;
    private Base base;

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getStudent() {
        return student;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public Field getField() {
        return field;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Term getTerm() {
        return term;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Level getLevel() {
        return level;
    }

    public void setNumberOfTheoryUnits(double numberOfTheoryUnits) {
        this.numberOfTheoryUnits = numberOfTheoryUnits;
    }

    public double getNumberOfTheoryUnits() {
        return numberOfTheoryUnits;
    }

    public void setNumberOfActionalUnits(int numberOfActionalUnits) {
        this.numberOfActionalUnits = numberOfActionalUnits;
    }

    public int getNumberOfActionalUnits() {
        return numberOfActionalUnits;
    }

    public void setFixShahriye(BigDecimal fixShahriye) {
        this.fixShahriye = fixShahriye;
    }

    public BigDecimal getFixShahriye() {
        return fixShahriye;
    }

    public void setTheoryShahriye(BigDecimal theoryShahriye) {
        this.theoryShahriye = theoryShahriye;
    }

    public BigDecimal getTheoryShahriye() {
        return theoryShahriye;
    }

    public void setActionalShahriye(BigDecimal actionalShahriye) {
        this.actionalShahriye = actionalShahriye;
    }

    public BigDecimal getActionalShahriye() {
        return actionalShahriye;
    }

    public void setOtherShahriyAmount(BigDecimal otherShahriyAmount) {
        this.otherShahriyAmount = otherShahriyAmount;
    }

    public BigDecimal getOtherShahriyAmount() {
        return otherShahriyAmount;
    }

    public void setOtherSalaryComment(String otherSalaryComment) {
        this.otherSalaryComment = otherSalaryComment;
    }

    public String getOtherSalaryComment() {
        return otherSalaryComment;
    }

    public void setTotalShahriye(BigDecimal totalShahriye) {
        this.totalShahriye = totalShahriye;
    }

    public BigDecimal getTotalShahriye() {
        return totalShahriye;
    }

    public void setOffAmount(BigDecimal offAmount) {
        this.offAmount = offAmount;
    }

    public BigDecimal getOffAmount() {
        return offAmount;
    }

    public void setOffComment(String offComment) {
        this.offComment = offComment;
    }

    public String getOffComment() {
        return offComment;
    }

    public void setCurrentAccounting(BigDecimal currentAccounting) {
        this.currentAccounting = currentAccounting;
    }

    public BigDecimal getCurrentAccounting() {
        return currentAccounting;
    }

    public void setTotalPayments(BigDecimal totalPayments) {
        this.totalPayments = totalPayments;
    }

    public BigDecimal getTotalPayments() {
        return totalPayments;
    }

    public void setBase(Base base) {
        this.base = base;
    }

    public Base getBase() {
        return base;
    }
}
