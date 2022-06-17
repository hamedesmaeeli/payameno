package registration.data;

import finance.data.Course;

import java.math.BigDecimal;

public class ExamCourse {
    private BigDecimal examCourseId;
    private ExamTime examtime;
    private Course course;
    public ExamCourse() {
        super();
    }

    public void setExamCourseId(BigDecimal examCourseId) {
        this.examCourseId = examCourseId;
    }

    public BigDecimal getExamCourseId() {
        return examCourseId;
    }

    public void setExamtime(ExamTime examtime) {
        this.examtime = examtime;
    }

    public ExamTime getExamtime() {
        return examtime;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Course getCourse() {
        return course;
    }
}
