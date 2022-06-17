package registration.data;

import java.math.BigDecimal;
import java.util.Date;

public class ExamTime {
    Term term;
    BigDecimal examTimeId;
    Date examDate;
    String examHour;
    String ExamDay;
    String ExamDateShamsi;
    
    public ExamTime() {
        super();
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Term getTerm() {
        return term;
    }

    public void setExamTimeId(BigDecimal examTimeId) {
        this.examTimeId = examTimeId;
    }

    public BigDecimal getExamTimeId() {
        return examTimeId;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamHour(String examHour) {
        this.examHour = examHour;
    }

    public String getExamHour() {
        return examHour;
    }

    public void setExamDay(String ExamDay) {
        this.ExamDay = ExamDay;
    }

    public String getExamDay() {
        return ExamDay;
    }

    public void setExamDateShamsi(String ExamDateShamsi) {
        this.ExamDateShamsi = ExamDateShamsi;
    }

    public String getExamDateShamsi() {
        return ExamDateShamsi;
    }
}
