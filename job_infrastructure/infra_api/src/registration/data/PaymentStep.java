package registration.data;
import finance.data.RecievementPayment;
import java.math.BigDecimal;
import java.util.Date;

public class PaymentStep {
private Date createDate;
private Registration registration;
private RecievementPayment receivementPaymentFinance;
private Date nextPayment;
private BigDecimal paymentStepId;

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setReceivementPaymentFinance(RecievementPayment receivementPaymentFinance) {
        this.receivementPaymentFinance = receivementPaymentFinance;
    }

    public RecievementPayment getReceivementPaymentFinance() {
        return receivementPaymentFinance;
    }

    public void setNextPayment(Date nextPayment) {
        this.nextPayment = nextPayment;
    }

    public Date getNextPayment() {
        return nextPayment;
    }

    public void setPaymentStepId(BigDecimal paymentStepId) {
        this.paymentStepId = paymentStepId;
    }

    public BigDecimal getPaymentStepId() {
        return paymentStepId;
    }
}
