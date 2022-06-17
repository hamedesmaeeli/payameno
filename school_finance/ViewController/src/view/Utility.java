package view;

import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;
import oracle.adf.view.rich.component.rich.data.RichTreeTable;
import oracle.adf.view.rich.context.AdfFacesContext;



import oracle.binding.AttributeBinding;
import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;
import oracle.jbo.uicli.binding.JUCtrlHierBinding;
import oracle.jbo.uicli.binding.JUCtrlHierNodeBinding;

import org.apache.myfaces.trinidad.model.CollectionModel;
import org.apache.myfaces.trinidad.model.RowKeySet;

import org.basa.tejarat.ftms.core.datatime.CalendarConversion;
import org.basa.tejarat.ftms.core.datatime.IranianDate;

public class Utility {
    public static Object getTreeTableSelectedRow(RichTreeTable treeTable) {
        Object selectedRow = null;
        CollectionModel treeModel = (CollectionModel)treeTable.getValue();
        JUCtrlHierBinding treeBinding =
            (JUCtrlHierBinding)treeModel.getWrappedData();
        RowKeySet rks = treeTable.getSelectedRowKeys();
        if (rks == null)
            return null;
        System.out.println("selected rows : " + rks.isEmpty());
        if (!rks.isEmpty()) {
            List firstSet = (List)rks.iterator().next();
            JUCtrlHierNodeBinding node =
                treeBinding.findNodeByKeyPath(firstSet);
            DCDataRow dr = (DCDataRow)node.getRow();
            selectedRow = dr.getDataProvider();

        }

        return selectedRow;
    }

    public static void refreshComponent(UIComponent component) {
        AdfFacesContext adfFacesContext = AdfFacesContext.getCurrentInstance();
        adfFacesContext.addPartialTarget(component);

    }

    public static void showFacesMessage(String text, FacesMessage.Severity severity) {
        FacesMessage fm = new FacesMessage(text);
        fm.setSeverity(severity);
        FacesContext.getCurrentInstance().addMessage(null, fm);
    }

    public static Row getViewObjectTableSingleSelectedRow(String iteratorName) {
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding dcItteratorBindings =
            bindings.findIteratorBinding(iteratorName);

        // Get an object representing the table and what may be selected within it
        ViewObject voTableData = dcItteratorBindings.getViewObject();

        // Get selected row
        Row rowSelected = voTableData.getCurrentRow();
        return rowSelected;

    }

    public static BindingContainer getBinding() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public static AttributeBinding getAttributeBinging(String parameter) {
        return (AttributeBinding)getBinding().getControlBinding(parameter);
    }

    public static OperationBinding getOperationBinding(String operationBinding) {

        return getBinding().getOperationBinding(operationBinding);
    }
    public String showFarsiDate(Date date) {
        IranianDate id = new IranianDate(date);
        return id.getIranianDate();
    }

}