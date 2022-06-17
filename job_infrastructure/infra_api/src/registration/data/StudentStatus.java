package registration.data;

import java.math.BigDecimal;

public class StudentStatus {
    
    private BigDecimal statusId;
    private String name;
    public StudentStatus() {
       
    }
    public StudentStatus(BigDecimal statusId,String name) {
        this.statusId = statusId;
        this.name = name;
    }

    public void setStatusId(BigDecimal statusId) {
        this.statusId = statusId;
    }

    public BigDecimal getStatusId() {
        return statusId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
