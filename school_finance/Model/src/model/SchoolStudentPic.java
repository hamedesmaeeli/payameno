package model;

import registration.data.DanaStudent;
import registration.data.School;
import registration.data.Student;

public class SchoolStudentPic {
    private Student student;
    private School  school;
    private Student DanaStudent;
    private Boolean hasPic;
    public SchoolStudentPic() {
        super();
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Student getStudent() {
        return student;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public School getSchool() {
        return school;
    }

   

    public void setHasPic(Boolean hasPic) {
        this.hasPic = hasPic;
    }

    public Boolean getHasPic() {
        return hasPic;
    }
}
