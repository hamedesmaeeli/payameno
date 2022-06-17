package transaction;

import java.util.Date;

public class Utilty {
    public Utilty() {
      
    }
    public static java.sql.Date convertDateUtilToSQL(java.util.Date date ) {
        if (date !=null)
        return new java.sql.Date(date.getTime());
        else
            return null;
    }
    public static java.util.Date convertDateSQLToUtil( java.sql.Date  date ) {
        if(date !=null)
        return new java.util.Date(date.getTime());
        else
            return null;
    }
}
