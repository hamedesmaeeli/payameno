package registration.data;

import finance.data.Course;

import java.math.BigDecimal;

public class CourseField {
    private BigDecimal CourseFieldId;
    private Course course;
    private Field field;
    private boolean isFinal;
    private int unitCount;
    public CourseField() {
        super();
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Course getCourse() {
        return course;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public Field getField() {
        return field;
    }

    public void setIsFinal(boolean isFinal) {
        this.isFinal = isFinal;
    }

    public boolean isIsFinal() {
        return isFinal;
    }

    public void setUnitCount(int unitCount) {
        this.unitCount = unitCount;
    }

    public int getUnitCount() {
        return unitCount;
    }

    public void setCourseFieldId(BigDecimal CourseFieldId) {
        this.CourseFieldId = CourseFieldId;
    }

    public BigDecimal getCourseFieldId() {
        return CourseFieldId;
    }
}
