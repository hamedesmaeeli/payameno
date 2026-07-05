package test;

import convert.SidaConverter;

public class TestSidaCoverter {
    public TestSidaCoverter() {
        super();
    }

    public static void main(String[] args) {
        TestSidaCoverter sidaCoverter = new TestSidaCoverter();
        SidaConverter s = new SidaConverter();
        //s.importStudentsFromSida();
        //s.importSidaEntekhabVahed();
        s.importImages();
    }
}
