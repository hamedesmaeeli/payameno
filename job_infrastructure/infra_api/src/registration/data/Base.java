
package registration.data;

import java.math.BigDecimal;

public class Base {
    private BigDecimal id;
    private String name;
    public Base() {
        super();
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
