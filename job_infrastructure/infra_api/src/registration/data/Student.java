package registration.data;

import finance.data.Account;

import java.math.BigDecimal;

import java.util.Date;

public class Student {
    
    private String name;
    private String family;
    private String nationalId;
    private String identifierCode;
    private String identifierSerial;
    private int identifierChar;
    private BigDecimal studentCode;
    private String fatherName;
    private Date dateOfBirth;
    private String description;
    private StudentStatus studentStatus;
    private Organization organization;
    private Date created_date;
    private Date lastModified;
    private Field lastField;
    private Level lastLevel;
    private String mobile;
    private String phone;
    private String address;
    private String pishMadrak;
    private String diplomMadrak;
    private String archiveCode;
    public Student() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getFamily() {
        return family;
    }

    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }

    public String getNationalId() {
        return nationalId;
    }

    public void setIdentifierCode(String identifierCode) {
        this.identifierCode = identifierCode;
    }

    public String getIdentifierCode() {
        return identifierCode;
    }

    public void setIdentifierSerial(String identifierSerial) {
        this.identifierSerial = identifierSerial;
    }

    public String getIdentifierSerial() {
        return identifierSerial;
    }

   

    public void setStudentCode(BigDecimal studentCode) {
        this.studentCode = studentCode;
    }

    public BigDecimal getStudentCode() {
        return studentCode;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setStudentStatus(StudentStatus studentStatus) {
        this.studentStatus = studentStatus;
    }

    public StudentStatus getStudentStatus() {
        return studentStatus;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastField(Field lastField) {
        this.lastField = lastField;
    }

    public Field getLastField() {
        return lastField;
    }

    public void setLastLevel(Level lastLevel) {
        this.lastLevel = lastLevel;
    }

    public Level getLastLevel() {
        return lastLevel;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    

    public void setIdentifierChar(int identifierChar) {
        this.identifierChar = identifierChar;
    }

    public int getIdentifierChar() {
        return identifierChar;
    }

    public void setArchiveCode(String archiveCode) {
        this.archiveCode = archiveCode;
    }

    public String getArchiveCode() {
        return archiveCode;
    }

    public void setPishMadrak(String madrakCode) {
        this.pishMadrak = madrakCode;
    }

    public String getPishMadrak() {
        return pishMadrak;
    }

    public void setDiplomMadrak(String diplomMadrak) {
        this.diplomMadrak = diplomMadrak;
    }

    public String getDiplomMadrak() {
        return diplomMadrak;
    }
}
