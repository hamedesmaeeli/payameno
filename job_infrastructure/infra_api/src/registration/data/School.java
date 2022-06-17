package registration.data;

import java.math.BigDecimal;

public class School {
    BigDecimal Id;
    String description;
    String dbService;
    String dbName;
    String host;
    
    public School() {
        super();
    }

    public void setId(BigDecimal Id) {
        this.Id = Id;
    }

    public BigDecimal getId() {
        return Id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDbService(String dbService) {
        this.dbService = dbService;
    }

    public String getDbService() {
        return dbService;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getDbName() {
        return dbName;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getHost() {
        return host;
    }
}
