package view;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GeneralBean {
    public GeneralBean() {
       
    }

    public String logout() {
        // Add event code here...
        
        FacesContext context = FacesContext.getCurrentInstance();
                HttpSession session = (HttpSession)context.getExternalContext().getSession(true);
                session.invalidate();
        
        ExternalContext ectx = FacesContext.getCurrentInstance().getExternalContext();
        HttpServletResponse response = (HttpServletResponse)ectx.getResponse();
        String url = ectx.getRequestContextPath()+"/adfAuthentication? logout=true&end_url=/faces/login.html";
        
         try {
        response.sendRedirect(url);
         } catch (Exception ex) {
         ex.printStackTrace();
        }
        return null;
    }
}
