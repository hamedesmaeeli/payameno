package finance.data;

import java.math.BigDecimal;

public class Course {
    public Course() {
        super();
    }
    private BigDecimal courseId ;
    private String courseName;
    private int courseUnits;
    private String DisplayName;
    private String courseCode;
    private Boolean isFinal;
    private String description;
    
    public void setCourseId(BigDecimal courseId) {
        this.courseId = courseId;
    }

    public BigDecimal getCourseId() {
        return courseId;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseUnits(int courseUnits) {
        this.courseUnits = courseUnits;
    }

    public int getCourseUnits() {
        return courseUnits;
    }

    public void setDisplayName(String DisplayName) {
        this.DisplayName = DisplayName;
    }

    public String getDisplayName() {
        return DisplayName;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setIsFinal(Boolean isFinal) {
        this.isFinal = isFinal;
    }

    public Boolean getIsFinal() {
        return isFinal;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
