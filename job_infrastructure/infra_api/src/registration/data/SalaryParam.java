package registration.data;

import java.math.BigDecimal;


public class SalaryParam {
    
    private BigDecimal fixSalary;
    private BigDecimal theorySalary;
    private BigDecimal actionSalary;
    private Term term;
    private Level level;
    private int  unitRate; 
    public SalaryParam() {

    }

    public void setFixSalary(BigDecimal fixSalary) {
        this.fixSalary = fixSalary;
    }

    public BigDecimal getFixSalary() {
        return fixSalary;
    }

    public void setTheorySalary(BigDecimal theorySalary) {
        this.theorySalary = theorySalary;
    }

    public BigDecimal getTheorySalary() {
        return theorySalary;
    }

    public void setActionSalary(BigDecimal actionSalary) {
        this.actionSalary = actionSalary;
    }

    public BigDecimal getActionSalary() {
        return actionSalary;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Term getTerm() {
        return term;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Level getLevel() {
        return level;
    }

    public void setUnitRate(int unitRate) {
        this.unitRate = unitRate;
    }

    public int getUnitRate() {
        return unitRate;
    }
}
