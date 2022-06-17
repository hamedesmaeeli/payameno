package registration.data;

import java.math.BigDecimal;

import java.util.Date;

public class DanaCourseExam {
    BigDecimal courseCode;
    String courseName;
    int courseUint;
    String courseDisplayName;
    String courseDay;
    String courseDateString;
    Date courseDate;
    Boolean isInExam;
    public DanaCourseExam() {
        super();
    }

    public void setCourseCode(BigDecimal courseCode) {
        this.courseCode = courseCode;
    }

    public BigDecimal getCourseCode() {
        return courseCode;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseUint(int courseUint) {
        this.courseUint = courseUint;
    }

    public int getCourseUint() {
        return courseUint;
    }

    public void setCourseDisplayName(String courseDisplayName) {
        this.courseDisplayName = courseDisplayName;
    }

    public String getCourseDisplayName() {
        return courseDisplayName;
    }

    public void setCourseDay(String courseDay) {
        this.courseDay = courseDay;
    }

    public String getCourseDay() {
        return courseDay;
    }

    public void setCourseDateString(String courseDateString) {
        this.courseDateString = courseDateString;
    }

    public String getCourseDateString() {
        return courseDateString;
    }

    public void setCourseDate(Date courseDate) {
        this.courseDate = courseDate;
    }

    public Date getCourseDate() {
        return courseDate;
    }

    public void setIsInExam(Boolean isInExam) {
        this.isInExam = isInExam;
    }

    public Boolean getIsInExam() {
        return isInExam;
    }
}
