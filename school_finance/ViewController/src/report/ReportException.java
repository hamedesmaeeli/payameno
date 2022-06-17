package report;

public class ReportException extends Exception {
    public static String SQL_ERROR = "JASPER_SQL_ERROR";
    public static String FILL_ERROR = "JASPER_FILL_ERROR";
    public static String NOT_FOUND_ERROR = "JASPER_NOT_FOUND_ERROR";
    public static String EXPORT_ERROR = "JASPER_EXPORT_ERROR";

    public ReportException(String message) {
        super(message);
    }
}
