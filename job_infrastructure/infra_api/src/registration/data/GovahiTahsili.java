package registration.data;

import java.util.Date;

public class GovahiTahsili {
    public GovahiTahsili() {
        super();
    }
    private Student student = new Student();
    private Field field = new Field();
    private Base base = new Base();
    private Date lastStatusDate = new Date();
    private int lastStatus;
    private String lastMadrak;
    private Date lastEdit = new Date();
    private String govahiLetterNum;
    private Date govahiLetterDate;

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

    public void setBase(Base base) {
        this.base = base;
    }

    public Base getBase() {
        return base;
    }

    public void setLastStatusDate(Date lastStatusDate) {
        this.lastStatusDate = lastStatusDate;
    }

    public Date getLastStatusDate() {
        return lastStatusDate;
    }

    public void setLastStatus(int lastStatus) {
        this.lastStatus = lastStatus;
    }

    public int getLastStatus() {
        return lastStatus;
    }

    public void setLastMadrak(String lastMadrak) {
        this.lastMadrak = lastMadrak;
    }

    public String getLastMadrak() {
        return lastMadrak;
    }

    public void setLastEdit(Date lastEdit) {
        this.lastEdit = lastEdit;
    }

    public Date getLastEdit() {
        return lastEdit;
    }

    public void setGovahiLetterNum(String govahiLetterNum) {
        this.govahiLetterNum = govahiLetterNum;
    }

    public String getGovahiLetterNum() {
        return govahiLetterNum;
    }

    public void setGovahiLetterDate(Date govahiLetterDate) {
        this.govahiLetterDate = govahiLetterDate;
    }

    public Date getGovahiLetterDate() {
        return govahiLetterDate;
    }
}
