package registration.data;

import java.math.BigDecimal;

public class DanaRegUnit {
    BigDecimal stCod;
    BigDecimal courseCode;
    String courseName;
    int courseUnit;
    String fatherName;
    String firstName;
    String lastName;
    String majorName;
    String telephone;
    BigDecimal NactionalCode;
    int year;
    int term;
    BigDecimal schoolCode;
    
    public DanaRegUnit() {
        super();
    }

    public void setStCod(BigDecimal stCod) {
        this.stCod = stCod;
    }

    public BigDecimal getStCod() {
        return stCod;
    }

    public void setCourseCode(BigDecimal courseCode) {
        this.courseCode = courseCode;
    }

    public BigDecimal getCourseCode() {
        return courseCode;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getYear() {
        return year;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public int getTerm() {
        return term;
    }

    public void setSchoolCode(BigDecimal schoolCode) {
        this.schoolCode = schoolCode;
    }

    public BigDecimal getSchoolCode() {
        return schoolCode;
    }
}
