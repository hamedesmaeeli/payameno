package views;

import java.math.BigDecimal;

import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.Registration;
import registration.data.Student;
import registration.data.Term;

public class DebtorInTerm {
    Student student ;
    BigDecimal debitValue;
    Term term ;
    Registration registration;
    Field field;
    Level level;
    Organization organization;
    public DebtorInTerm() {
        super();
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getStudent() {
        return student;
    }

    public void setDebitValue(BigDecimal debitValue) {
        this.debitValue = debitValue;
    }

    public BigDecimal getDebitValue() {
        return debitValue;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Term getTerm() {
        return term;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public Field getField() {
        return field;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Level getLevel() {
        return level;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Organization getOrganization() {
        return organization;
    }
}
