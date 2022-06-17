package registration.data;

import java.math.BigDecimal;

public class Level {
    private BigDecimal id;
    private String name;
    public Level() {
        super();
    }
    public Level(BigDecimal id,String name) {
        this.id =id;
        this.name =name;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
