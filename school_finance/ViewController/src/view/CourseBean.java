package view;

import finance.data.Course;

import finance.process.AccountManager;

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

import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.faces.application.FacesMessage;

import javax.faces.context.FacesContext;

import javax.faces.event.ActionEvent;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.bean.DCDataRow;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.model.binding.DCIteratorBinding;

import oracle.adf.view.rich.component.rich.data.RichTable;

import oracle.jbo.Key;
import oracle.jbo.Row;

import oracle.jbo.RowSetIterator;

import org.apache.myfaces.trinidad.model.RowKeySet;

import registration.data.CourseField;
import registration.data.DanaRegUnit;
import registration.data.DanaRegisterStudent;
import registration.data.ExamCourse;
import registration.data.ExamTime;
import registration.data.Field;
import registration.data.Level;
import registration.data.Organization;
import registration.data.Registration;
import registration.data.School;
import registration.data.Student;
import registration.data.StudentStatus;
import registration.data.Term;

import registration.process.RegistrationManager;

import report.ReportManagment;

import report.access.AccessDbManage;

import test.FarsiCalendarConversion;

public class CourseBean {
    int CountUnit = 1;
    boolean isFinal = false;
    
    ExamTime newExamTime;
    ExamTime selectedExamTime;
    int newExamTimeYear;
    int newExamTimeMonth;
    int newExamTimeDay;
    int calculatedMaxDay;
    private RichTable selectedCourseTable;
    private RichTable selectedCoursesTable;
    private RichTable coursesForExamTimeTable;
    private RichTable coursesExamTimeTable;
    private RichTable examTimesInTermTable;


    public CourseBean() {
        RegistrationManager rm = new RegistrationManager();
        selectedTerm = rm.getCurrentTerm();
        Date date = new Date();
        FarsiCalendarConversion fc = new FarsiCalendarConversion(date);
        newExamTimeYear = fc.getIranianYear();
        newExamTimeMonth = fc.getIranianMonth();
        newExamTimeDay = fc.getIranianDay();
        calculatedMaxDay = this.calculateMaxMonthDay();
    }
    private Term selectedTerm ;
    private Course selectedCourse;

    public void setSelectedTerm(Term selectedTerm) {
        this.selectedTerm = selectedTerm;
    }

    public Term getSelectedTerm() {
        return selectedTerm;
    }


    public void setSelectedCourse(Course SelectedCourse) {
        this.selectedCourse = SelectedCourse;
    }

    public Course getSelectedCourse() {
        return selectedCourse;
    }

    public String studentListInCourse() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allCoursesIterator");

        Row row = iter.getCurrentRow();
        if (row != null) {
            this.selectedCourse = (Course)((DCDataRow)row).getDataProvider();
         //   System.out.println("father name :" +           this.currentStudent.getFatherName());
            returned = "studentList";
            
        } else {
            Utility.showFacesMessage("please select a course", FacesMessage.SEVERITY_INFO);   
        }
        return returned;
        
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
   

    public void downloadKart(FacesContext facesContext,
                             OutputStream outputStream) {
        // Add event code here...
        DCBindingContainer bindings =
                    (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCIteratorBinding iter =
                    (DCIteratorBinding)bindings.findIteratorBinding("allLevelsIterator");                
                Row row = iter.getCurrentRow();
              Level level ;
              if(row !=null) {
         //TODO
           level = (Level)((DCDataRow)row).getDataProvider();        
           RegistrationManager rm  = new RegistrationManager();
           Term currentTerm = rm.getCurrentTerm();
            
        URL url1=    this.getClass().getClassLoader().getResource("view/CourseBean.class"); 
               //this.getClass().getClassLoader().getResource("transaction/access/rahnamayi.accdb");  
           System.out.println("print "+ url1.getFile());
           
       
        ArrayList<Student> registerdStudents = rm.searchStudents(true, new Field(new BigDecimal(-1),""), new Level(new BigDecimal(-1),""), new Organization(new BigDecimal(-1),""), new StudentStatus(new BigDecimal(-1),""));
        
        ArrayList<Course>  registerdCourses ; 
        
        AccessDbManage adm = new AccessDbManage();
        adm.createConnection();       
        PreparedStatement pr;
        PreparedStatement pr2;
        Registration registration;    
        BigDecimal tempBig =  new BigDecimal(0);
            try {
               for(int i=0;i<registerdStudents.size();i++)
               {  
                   registration = rm.getRegistrationFromStudentAndTerm(registerdStudents.get(i),currentTerm);
                   registerdCourses = rm.findCoursesRegistered(registration);
                   pr = adm.getConnection().prepareStatement("insert into register_students(st_code,st_name,st_family,father_name,year,term,major_code,major_name,image_name) values (?,?,?,?,?,?,?,?,?)");
                   pr.setBigDecimal(1,registerdStudents.get(i).getStudentCode() );
                   
            //       pr.setString(2,  new String(danaStudents.get(i).getFirstName().getBytes(), Charset.forName("UTF-8"))    );
                //   CharsetDetector
                 //  pr.setString(2,"U+062D U+0627 U+0645 U+062F" );
                   pr.setString(2,registerdStudents.get(i).getName() );
                   pr.setString(3,registerdStudents.get(i).getFamily() );
                   pr.setString(4,registerdStudents.get(i).getFatherName() );
                   pr.setString(5,String.valueOf(currentTerm.getYear()));
                   pr.setString(6,String.valueOf(currentTerm.getDore()) );
                   pr.setInt(7,Integer.valueOf(String.valueOf(registration.getField().getId())));
                   pr.setString(8,registration.getField().getName());
                   pr.setString(9,"img/"+registerdStudents.get(i).getStudentCode()+".jpg");
                   pr.executeUpdate();
                   
                   for(int j=0;j<registerdCourses.size();j++) {
                       pr2 = adm.getConnection().prepareStatement("insert into entekhab_vahed(st_code,course_code,year,term,school) values (?,?,?,?,?)");    
                       pr2.setBigDecimal(1, registerdStudents.get(i).getStudentCode() );
                       pr2.setBigDecimal(2, new BigDecimal( registerdCourses.get(j).getCourseCode()));
                       pr2.setInt(3, Integer.valueOf( String.valueOf(currentTerm.getYear())));
                       pr2.setInt(4, Integer.valueOf(  String.valueOf(currentTerm.getDore())));
                       pr2.setBigDecimal(5, new BigDecimal("123"));
                       pr2.executeUpdate();
                   }                                                                     
               }
               adm.getConnection().close();
               File picParent = new File(adm.getOutputFile().getParent()+"\\img"); 
                picParent.mkdir();
               rm.downloadPicsStudents(currentTerm,picParent.getPath());
               
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
              else {
                  
              }
                             }

    public String courseFields() {
        // Add event code here...
        
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allCoursesIterator");

        Row row = iter.getCurrentRow();
        if (row != null) {
            this.selectedCourse = (Course)((DCDataRow)row).getDataProvider();
         //   System.out.println("father name :" +           this.currentStudent.getFatherName());
            returned = "CourseFields";
            
        } else {
            Utility.showFacesMessage("please select a course", FacesMessage.SEVERITY_INFO);   
        }
        return returned;
    }
    public String registerFieldsToCourse() {
        System.out.println("******in registerFieldsToCourse ");    
        String returned = "";
        RegistrationManager rm = new RegistrationManager();
        RowKeySet selectedEmps = this.selectedCourseTable.getSelectedRowKeys();    
        Iterator selectedEmpIter = selectedEmps.iterator();
        DCBindingContainer bindings =
                          (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding empIter = bindings.findIteratorBinding("getAllAvailableFieldsForCourseIterator");
        RowSetIterator empRSIter = empIter.getRowSetIterator();
        while(selectedEmpIter.hasNext()){
            
           Key key = (Key)((List)selectedEmpIter.next()).get(0);
           Row currentRow = empRSIter.getRow(key);
             if(currentRow !=null){
             Field field =  (Field)((DCDataRow)currentRow).getDataProvider();
             CourseField courseField = new CourseField();
             if(field !=null)
             {
             System.out.println("Filed id = "+field.getId()+ "unit = "+this.CountUnit+" isFinal ="+this.isFinal);
             courseField.setField(field);
             courseField.setIsFinal(this.isFinal);
             courseField.setUnitCount(this.CountUnit);
              courseField.setCourse(this.selectedCourse);
              rm.addFieldToCourse(courseField) ;          
             //rm.addCourseToRegistration(newRegistration,course);
             }
             else {
                 Utility.showFacesMessage("please select a Field",FacesMessage.SEVERITY_INFO  );
             }
        //    System.out.println(currentRow.getAttribute("Ename"));
         }
             }
        //    Utility.refreshComponent(registerCourseTable);
        
        /*        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          Course course =  (Course)((DCDataRow)row).getDataProvider();     
          rm.addCourseToRegistration(newRegistration,course);
          Utility.refreshComponent(registerCourseTable);    
          
        returned = "refreshSelectedCourse";
        }
        else{
            Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
        }
        */
         returned = "selectCourse";
        return returned;
    }

    public void setSelectedCourseTable(RichTable selectedCourseTable) {
        this.selectedCourseTable = selectedCourseTable;
    }

    public RichTable getSelectedCourseTable() {
        return selectedCourseTable;
    }

    public void setCountUnit(int CountUnit) {
        this.CountUnit = CountUnit;
    }

    public int getCountUnit() {
        return CountUnit;
    }

    public void setIsFinal(boolean isFinal) {
        this.isFinal = isFinal;
    }

    public boolean isIsFinal() {
        return isFinal;
    }

    public String deleteFieldFromCourse() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("getFieldsFromCourseIterator");
        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          CourseField courseField =  (CourseField)((DCDataRow)row).getDataProvider();     
          rm.deleteFieldFromCourse(courseField);
          //System.out.println("result= "+result+" courseId="+course.getCourseId()+" reg_id = "+ newRegistration.getId());
          Utility.refreshComponent(selectedCoursesTable);
        returned = "deleteField";
        }
        else{
            Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
        }
        return returned;
        
    }

    public void setSelectedCoursesTable(RichTable selectedCoursesTable) {
        this.selectedCoursesTable = selectedCoursesTable;
    }

    public RichTable getSelectedCoursesTable() {
        return selectedCoursesTable;
    }

    public String goToExam()
    {
        RegistrationManager rm = new RegistrationManager();
        this.selectedTerm = rm.getCurrentTerm();
        // Add event code here...
        return "exam";
    }

    public void setNewExamTime(ExamTime newExamTime) {
        this.newExamTime = newExamTime;
    }

    public ExamTime getNewExamTime() {
        return newExamTime;
    }

    public void setNewExamTimeYear(int newExamTimeYear) {
        this.newExamTimeYear = newExamTimeYear;
    }

    public int getNewExamTimeYear() {
        return newExamTimeYear;
    }

    public void setNewExamTimeMonth(int newExamTimeMonth) {
        this.newExamTimeMonth = newExamTimeMonth;
    }

    public int getNewExamTimeMonth() {
        return newExamTimeMonth;
    }

    public void setNewExamTimeDay(int newExamTimeDay) {
        this.newExamTimeDay = newExamTimeDay;
    }

    public int getNewExamTimeDay() {
        return newExamTimeDay;
    }

    public String createNewExamTime() {
        // Add event code here...
       String returned="";
        System.out.println( "year="+ newExamTimeYear+"mounth "+ newExamTimeMonth+" Day="+newExamTimeDay);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allExamHoursIterator");
        Row row = iter.getCurrentRow();
        FarsiCalendarConversion fc = new FarsiCalendarConversion ();
        fc.setIranianDate(newExamTimeYear, newExamTimeMonth, newExamTimeDay);
        System.out.println("GregorianDate "+fc.getGregorianDate());
        RegistrationManager rm = new RegistrationManager();
        ExamTime examTime =  new ExamTime();
        examTime.setTerm(this.selectedTerm);
        try {
            examTime.setExamDate(sdf.parse(fc.getGregorianDate()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (row != null) {
                      {
                String str=  (String)((DCDataRow)row).getDataProvider();
                System.out.println("str= "+str);
               examTime.setExamHour(str);
                rm.addExamTimeToTerm(examTime);
                returned = "newExamTime";
            }
        }
        
                return returned;
    }
    public int calculateMaxMonthDay() {
        FarsiCalendarConversion fc = new FarsiCalendarConversion ();
        fc.setIranianDate(newExamTimeYear-1, newExamTimeMonth, newExamTimeDay);
        System.out.println("is leap"+this.isLeapYear(fc.getGregorianYear()));
        int out =0;
        if(this.newExamTimeMonth >=1 &&this.newExamTimeMonth<=6)
            out=31;
        else if(this.newExamTimeMonth>=7&this.newExamTimeMonth<12)
            out =30;
        else if(this.newExamTimeMonth ==12) {
            if(this.isLeapYear(fc.getGregorianYear())) {
         
                out = 30;
            }
            else
                out=29;
        }
        else
            out=-1;//error mount day
        return out;
    }

    public void changeMonthExamTime(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        System.out.println("new Month = "+ (Integer)valueChangeEvent.getNewValue()+" maxDay = "+this.calculateMaxMonthDay());
        this.calculatedMaxDay = this.calculateMaxMonthDay();
    }

    public void changeYearNewExamTime(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        System.out.println("new Year = "+ (Integer)valueChangeEvent.getNewValue());
        this.calculatedMaxDay = this.calculateMaxMonthDay();
    }

    public void setCalculatedMaxDay(int calculatedMaxDay) {
        this.calculatedMaxDay = calculatedMaxDay;
    }
    public int getCalculatedMaxDay() {
        return calculatedMaxDay;
    }
    private static boolean isLeapYear(int year) 
        {
            //1583 was the first year of the Gregorian Calendar
            
            assert year >= 1583; 
             
            return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
        }

    public String examTimeCourses() {
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("getAllTermExamTimesIterator");
        System.out.println("***** iter ="+iter);
        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          this.selectedExamTime   =  (ExamTime)((DCDataRow)row).getDataProvider();     
          //System.out.println("result= "+result+" courseId="+course.getCourseId()+" reg_id = "+ newRegistration.getId());
        returned = "examDetail";
        }
        else{
            Utility.showFacesMessage("please select a examCourse",FacesMessage.SEVERITY_INFO  );
        }
        return returned;
        
    }

    public void setSelectedExamTime(ExamTime selectedExamTime) {
        this.selectedExamTime = selectedExamTime;
    }

    public ExamTime getSelectedExamTime() {
        return selectedExamTime;
    }
    public String addCourseToExamTime() {
        // Add event code here...
        String returned = "";
        RegistrationManager rm = new RegistrationManager();
        RowKeySet selectedEmps = this.coursesForExamTimeTable.getSelectedRowKeys();    
        Iterator selectedEmpIter = selectedEmps.iterator();
        DCBindingContainer bindings =
                          (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding empIter = bindings.findIteratorBinding("allCoursesIterator");
        RowSetIterator empRSIter = empIter.getRowSetIterator();
        ExamCourse examCourse ;
        
        Course course;
        while(selectedEmpIter.hasNext()){
         examCourse = new ExamCourse();  
           Key key = (Key)((List)selectedEmpIter.next()).get(0);
           Row currentRow = empRSIter.getRow(key);
             if(currentRow !=null){
              course =  (Course)((DCDataRow)currentRow).getDataProvider();
             if(course  !=null)
             {
                 examCourse.setExamtime(this.selectedExamTime);
                 examCourse.setCourse(course);
              rm.addCourseToExamTime(examCourse) ;          
             //rm.addCourseToRegistration(newRegistration,course);
             }
             else {
                 Utility.showFacesMessage("please select a Course",FacesMessage.SEVERITY_INFO  );
             }
        //    System.out.println(currentRow.getAttribute("Ename"));
         }
             }
       
        
       
         returned = "addCourse";
        return returned;
    }

    public void setCoursesForExamTimeTable(RichTable coursesForExamTimeTable) {
        this.coursesForExamTimeTable = coursesForExamTimeTable;
    }

    public RichTable getCoursesForExamTimeTable() {
        return coursesForExamTimeTable;
    }

    public String deleteCourseFromExam() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("getAllExamCourseFromExamTimeIterator");
        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          ExamCourse examCourse=  (ExamCourse)((DCDataRow)row).getDataProvider();     
          rm.deleteCourseFromExamTime(examCourse);
          //System.out.println("result= "+result+" courseId="+course.getCourseId()+" reg_id = "+ newRegistration.getId());
          Utility.refreshComponent(coursesExamTimeTable);
        returned = "deleteCourseFromExam";
        }
        else{
            Utility.showFacesMessage("please select a course",FacesMessage.SEVERITY_INFO  );
        }
        return returned;
        
        
    }

    public void setCoursesExamTimeTable(RichTable coursesExamTimeTable) {
        this.coursesExamTimeTable = coursesExamTimeTable;
    }

    public RichTable getCoursesExamTimeTable() {
        return coursesExamTimeTable;
    }

    public String deleteExamTime() {
        // Add event code here...
        String returned = "";
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("getAllTermExamTimesIterator");
        Row row = iter.getCurrentRow();
        RegistrationManager rm = new RegistrationManager();
        if (row != null) {
          ExamTime examTime=  (ExamTime)((DCDataRow)row).getDataProvider();     
          rm.deleteExamTimeFromTerm(examTime);
          //System.out.println("result= "+result+" courseId="+course.getCourseId()+" reg_id = "+ newRegistration.getId());
          Utility.refreshComponent(examTimesInTermTable);
        returned = "deleteExamTime";
        }
        else{
            Utility.showFacesMessage("please select a examTime",FacesMessage.SEVERITY_INFO  );
        }
        return returned;        
    }

    public void setExamTimesInTermTable(RichTable examTimesInTermTable) {
        this.examTimesInTermTable = examTimesInTermTable;
    }

    public RichTable getExamTimesInTermTable() {
        return examTimesInTermTable;
    }

    public void printKartKoli(FacesContext facesContext,
                              OutputStream outputStream) {
        ReportManagment rm = new ReportManagment();
        String prtinUrl= rm.runrReportKartEmtehanKoli();
        System.out.println("print url" + prtinUrl);
        URL url;
                   InputStream is;
                   try {
                       url = new URL(prtinUrl);
                       is = url.openStream();
                       
                       // initialize  
                       byte[] buffer = new byte[4096]; // tweaking this number may increase performance  
                       int len;  
                       while ((len = is.read(buffer)) != -1)  
                       {  
                           outputStream.write(buffer, 0, len);  
                       }  
                       is.close();  
                   } catch (FileNotFoundException e) {
                       e.printStackTrace();
                   } catch (IOException e) {
                       e.printStackTrace();
                   } 
    }

    public void printKartField(FacesContext facesContext,
                               OutputStream outputStream) {
        // Add event code here...
        
        DCBindingContainer bindings =
            (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
        DCIteratorBinding iter =
            (DCIteratorBinding)bindings.findIteratorBinding("allFieldsIterator");
        Row row = iter.getCurrentRow();
        if (row != null) {
            Field field=  (Field)((DCDataRow)row).getDataProvider();
            ReportManagment rm = new ReportManagment();
            String prtinUrl= rm.runrReportKartWithField(field.getId());
            System.out.println("print url" + prtinUrl);
            URL url;
                       InputStream is;
                       try {
                           url = new URL(prtinUrl);
                           is = url.openStream();
                           
                           // initialize  
                           byte[] buffer = new byte[4096]; // tweaking this number may increase performance  
                           int len;  
                           while ((len = is.read(buffer)) != -1)  
                           {  
                               outputStream.write(buffer, 0, len);  
                           }  
                           is.close();  
                       } catch (FileNotFoundException e) {
                           e.printStackTrace();
                       } catch (IOException e) {
                           e.printStackTrace();
                       } 
        }
        else{
            Utility.showFacesMessage("please select a Field",FacesMessage.SEVERITY_INFO  );
        }
        
        
        
    }
}
