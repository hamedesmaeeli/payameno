package view;

import finance.data.Account;

import finance.data.AccountBank;
import finance.data.RecievePayType;

import finance.process.AccountManager;

import java.math.BigDecimal;

import java.util.Date;

import javax.faces.event.ActionEvent;

import oracle.adf.controller.TaskFlowId;

public class AccountingBean {
    
    private String taskFlowId = "/WEB-INF/cashAccounting.xml#cashAccounting";
    private int todayRecivedChecksCount;
    private int todayRegisteredFactorCount;
    private BigDecimal cashCurrentAmount;
    private BigDecimal todayRegisteredFactorAmount;
    private BigDecimal todayReceviedChecksAmount;
    public AccountingBean() {
    AccountManager am = new AccountManager();
    cashCurrentAmount = am.getAccountBankAccounting(am.getCash());
        }
    public TaskFlowId getDynamicTaskFlowId() {
        return TaskFlowId.parse(taskFlowId);
    }
    public void changetoaccountingReigen(ActionEvent actionEvent) {
        // Add event code here...
        taskFlowId = "/WEB-INF/banksAccountAccounting.xml#banksAccountAccounting";
    }
    public void changeAccountingToCash(ActionEvent actionEvent) {
        // Add event code here...
        taskFlowId = "/WEB-INF/cashAccounting.xml#cashAccounting";
    }
    public void setTaskFlowId(String taskFlowId) {
        this.taskFlowId = taskFlowId;
    }

    public String getTaskFlowId() {
        return taskFlowId;
    }


    public void changeAcoutingToCheck(ActionEvent actionEvent) {
        // Add event code here...
        taskFlowId = "/WEB-INF/checksAccounting.xml#checksAccounting";
    }
    public void changeAcoutingToDebitrosInCurrentTerm(ActionEvent actionEvent) {
        // Add event code here...
        taskFlowId = "/WEB-INF/debitorsInCurrentTermFlow.xml#debitorsInCurrentTermFlow";
    }
    public void setCashCurrentAmount(BigDecimal cashCurrentAmount) {
        this.cashCurrentAmount = cashCurrentAmount;
    }

    public BigDecimal getCashCurrentAmount() {
        return cashCurrentAmount;
    }
}