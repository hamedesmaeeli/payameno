package view;

import javax.faces.event.ActionEvent;

import oracle.adf.controller.TaskFlowId;

public class reportBean {
    private String taskFlowId = "/WEB-INF/report2.xml#report2";
    private String taskFlowId2="/WEB-INF/report1.xml#report1";
    public reportBean() {
    }

    public TaskFlowId getDynamicTaskFlowId() {
        return TaskFlowId.parse(taskFlowId);
    }

    public String showReport2() {
        // Add event code here...
        return null;
    }

    public void changeReport2(ActionEvent actionEvent) {
        // Add event code here...
        taskFlowId  ="/WEB-INF/report1.xml#report1";
    }
}
