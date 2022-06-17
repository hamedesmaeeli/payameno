package view;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.math.BigDecimal;

import java.net.MalformedURLException;
import java.net.URL;

import java.nio.charset.Charset;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Date;

import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.faces.application.FacesMessage;

import javax.faces.context.FacesContext;

import model.SchoolStudentPic;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.jbo.Row;

import org.eclipse.persistence.internal.jpa.metadata.mappings.AccessMethodsMetadata;

import registration.data.DanaRegUnit;
import registration.data.DanaRegisterStudent;
import registration.data.DanaStudent;
import registration.data.Registration;
import registration.data.School;
import registration.data.Student;
import registration.data.Term;

import registration.process.RegistrationManager;

import report.access.AccessDbManage;

public class SchoolManageBean {
    School currentSchool = new School();
    Term currentTerm = new Term();
    DanaStudent createDanaStudent = new DanaStudent();
    String kartName;
    Student noPicStudent = new Student();
    public SchoolManageBean() {
        super();
    }

    public void setCurrentSchool(School currentSchool) {
        this.currentSchool = currentSchool;
    }

    public School getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentTerm(Term currentTerm) {
        this.currentTerm = currentTerm;
    }

    public Term getCurrentTerm() {
        return currentTerm;
    }

    public String goToNoPicSts() {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
           this.currentTerm = rm.getCurrentTerm();
           returned = "noPicSts";
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
    }

    public void setCreateDanaStudent(DanaStudent createDanaStudent) {
        this.createDanaStudent = createDanaStudent;
    }

    public DanaStudent getCreateDanaStudent() {
        return createDanaStudent;
    }

    public String registerCreateStudent() {
        // Add event code here...
        String returned="";
        
        RegistrationManager rm = new RegistrationManager();
        
            if(rm.createDanaStudent(this.currentSchool, this.createDanaStudent)!=-1)
            {
            Utility.showFacesMessage("create student was successfull", FacesMessage.SEVERITY_INFO);    
            returned="back";
        }else {
            Utility.showFacesMessage("there is error in create student", FacesMessage.SEVERITY_ERROR);
           
        }
        return returned;
    }

    public String gotoCreateDanaSt() {
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
           this.createDanaStudent = new DanaStudent();
           this.createDanaStudent.setSex(1);
        
           returned = "newDanaStudent";
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
        
    }

    public void downloadKartJalase(FacesContext facesContext,
                                   OutputStream outputStream) {
        
        // Add event code here...
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
           this.currentTerm = rm.getCurrentTerm();
        URL url1=    this.getClass().getClassLoader().getResource("view/SchoolManageBean.class"); 
               //this.getClass().getClassLoader().getResource("transaction/access/rahnamayi.accdb");  
           System.out.println("print "+ url1.getFile());
           
        ArrayList<DanaRegisterStudent> danaStudents= rm.getDanaRegisteredStudents(this.currentSchool, this.currentTerm);
            ArrayList<DanaRegUnit> danaRegisters = rm.getDanaRegUnits(currentSchool,currentTerm);
        AccessDbManage adm = new AccessDbManage();
        adm.createConnection();
            
        PreparedStatement pr;
            try {
               for(int i=0;i<danaStudents.size();i++)
               {  
                  pr = adm.getConnection().prepareStatement("insert into register_students(st_code,st_name,st_family,father_name,year,term,major_code,major_name,image_name) values (?,?,?,?,?,?,?,?,?)");
                   pr.setBigDecimal(1,danaStudents.get(i).getStudentCode() );
                   ;
            //       pr.setString(2,  new String(danaStudents.get(i).getFirstName().getBytes(), Charset.forName("UTF-8"))    );
                //   CharsetDetector
                 //  pr.setString(2,"U+062D U+0627 U+0645 U+062F" );
                   pr.setString(2,danaStudents.get(i).getFirstName() );
                   pr.setString(3,danaStudents.get(i).getLastName() );
                   pr.setString(4,danaStudents.get(i).getFatherName() );
                   pr.setString(5,danaStudents.get(i).getTimeyear() );
                   pr.setString(6,danaStudents.get(i).getTimeDore() );
                   pr.setInt(7,danaStudents.get(i).getMajorCode() );
                   pr.setString(8,danaStudents.get(i).getMajorName() );
                   pr.setString(9,danaStudents.get(i).getImageName() );
                   pr.executeUpdate();
               
               }
                
                for(int i=0;i<danaRegisters.size();i++) {
                    pr = adm.getConnection().prepareStatement("insert into entekhab_vahed(st_code,course_code,year,term,school) values (?,?,?,?,?)");    
                    pr.setBigDecimal(1, danaRegisters.get(i).getStCod());
                    pr.setBigDecimal(2, danaRegisters.get(i).getCourseCode());
                    pr.setInt(3, danaRegisters.get(i).getYear());
                    pr.setInt(4, danaRegisters.get(i).getTerm());
                    pr.setBigDecimal(5, danaRegisters.get(i).getSchoolCode());
                    pr.executeUpdate();
                }
                adm.getConnection().close();
               File picParent = new File(adm.getOutputFile().getParent()+"\\img"); 
                picParent.mkdir();
               rm.downloadPicsStudents(this.currentSchool,this.currentTerm,picParent.getPath());
               
               //create a zip file from 
               
               
               
                           
               this.zipFiles(adm.getOutputFile().getParent(), adm.getOutputFile().getParentFile().getParent()+"\\"+adm.getOutputFile().getParentFile().getName()+".Zip");
           //     this.zipFiles(adm.getOutputFile().getParent(), adm.getOutputFile().getParentFile().getParent()+"\\test.Zip"); 
                 File zipOutputFile = new File(adm.getOutputFile().getParentFile().getParent()+"\\"+adm.getOutputFile().getParentFile().getName()+".Zip");  
               //
               InputStream is = new FileInputStream(zipOutputFile);
       //         InputStream is = new FileInputStream(adm.getOutputFile()); 
                // initialize  
                byte[] buffer = new byte[8192]; // tweaking this number may increase performance  
                int len;  
                while ((len = is.read(buffer)) != -1)  
                {  
                    outputStream.write(buffer, 0, len);  
                }  
                is.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
                                   }
    public String goToRegisteredStudents() {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
           this.currentTerm = rm.getCurrentTerm();
           returned = "regStudents";
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
    }

    public String goToUngraguated() {
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
      
           returned = "ungraguated";
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
    }
    /*
         * zip the folders
         */
        private void zipFolder(String srcFolder, String destZipFile) throws Exception {
            ZipOutputStream zip = null;
            FileOutputStream fileWriter = null;
            /*
             * create the output stream to zip file result
             */
            fileWriter = new FileOutputStream(destZipFile);
            zip = new ZipOutputStream(fileWriter);
            /*
             * add the folder to the zip
             */
            addFolderToZip("", srcFolder, zip);
            /*
             * close the zip objects
             */
            zip.flush();
            zip.close();
        }

        /*
         * recursively add files to the zip files
         */
        private void addFileToZip(String path, String srcFile, ZipOutputStream zip, boolean flag) throws Exception {
            /*
             * create the file object for inputs
             */
            File folder = new File(srcFile);

            /*
             * if the folder is empty add empty folder to the Zip file
             */
            if (flag == true) {
                zip.putNextEntry(new ZipEntry(path + "/" + folder.getName() + "/"));
            } else { /*
                     * if the current name is directory, recursively traverse it
                     * to get the files
                     */
                if (folder.isDirectory()) {
                    /*
                     * if folder is not empty
                     */
                    addFolderToZip(path, srcFile, zip);
                } else {
                    /*
                     * write the file to the output
                     */
                    byte[] buf = new byte[1024];
                    int len;
                    FileInputStream in = new FileInputStream(srcFile);
                    zip.putNextEntry(new ZipEntry(path + "/" + folder.getName()));
                    while ((len = in.read(buf)) > 0) {
                        /*
                         * Write the Result
                         */
                        zip.write(buf, 0, len);
                    }
                }
            }
        }

        /*
         * add folder to the zip file
         */
        private void addFolderToZip(String path, String srcFolder, ZipOutputStream zip) throws Exception {
            File folder = new File(srcFolder);

            /*
             * check the empty folder
             */
            if (folder.list().length == 0) {
                System.out.println(folder.getName());
                addFileToZip(path, srcFolder, zip, true);
            } else {
                /*
                 * list the files in the folder
                 */
                for (String fileName : folder.list()) {
                    if (path.equals("")) {
                        addFileToZip(folder.getName(), srcFolder + "/" + fileName, zip, false);
                    } else {
                        addFileToZip(path + "/" + folder.getName(), srcFolder + "/" + fileName, zip, false);
                    }
                }
            }
        }
    public boolean zipFiles(String srcFolder, String destZipFile) {
            boolean result = false;
            try {
                System.out.println("Program Start zipping the given files");
                /*
                 * send to the zip procedure
                 */
                zipFolder(srcFolder, destZipFile);
                result = true;
                System.out.println("Given files are successfully zipped");
            } catch (Exception e) {
                System.out.println("Some Errors happned during the zip process");
            } finally {
                return result;
            }
        }

    public void setKartName(String kartName) {
        this.kartName = kartName;
    }

    public String getKartName() {
        return kartName;
    }

    public String selectCourseAction() {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
           this.currentTerm = rm.getCurrentTerm();
           returned = "showList";
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
        
    }

    public String goToDownloadPic() {
        // Add event code here...
        
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getNoPicsStudentsIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO  
           this.noPicStudent = (Student)((DCDataRow)row).getDataProvider(); 
                   
           returned = "otherShools";
                   }
        else {
           System.out.println("please select a student");
        }
        return returned;
                        
    }

    public void setNoPicStudent(Student noPicStudent) {
        this.noPicStudent = noPicStudent;
    }

    public Student getNoPicStudent() {
        return noPicStudent;
    }

    public String exchangePicFromSchoolToSchool() {
        // Add event code here...
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getSchoolsHasPicForStudentIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO  
         SchoolStudentPic  schoolStPic=    (SchoolStudentPic)((DCDataRow)row).getDataProvider(); 
        if(schoolStPic.getHasPic() == true)
        {
        
        RegistrationManager rm = new RegistrationManager();
        rm.copyStudentPicFromSchoolToSchool(schoolStPic.getStudent(), schoolStPic.getSchool(),this.currentSchool);
           returned = "exchangePic";
        }
        else {
            Utility.showFacesMessage("no pic found", FacesMessage.SEVERITY_INFO);
        }
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
        
    }

    public void refreshNoPicBinding() {
        // Add event code here...
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("getSchoolsHasPicForStudentIterator");
                iter.executeQuery();
    }

    public String transferPics() {
        String returned="";
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allSchoolIterator");
                
                Row row = iter.getCurrentRow();
        
              if(row !=null) {
         //TODO
           
           this.currentSchool = (School)((DCDataRow)row).getDataProvider(); 
                      
           RegistrationManager rm  = new RegistrationManager();
           
          rm.transferPicsStudents(this.currentSchool);
           
                   }
        else {
           System.out.println("please select a school");
        }
        return returned;
    }
}
