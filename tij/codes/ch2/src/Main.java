public class Main {

    public static void main(String[] args) {
        System.out.println("Hello World!");

        DataOnly d = new DataOnly();
        System.out.println(d.i);

        System.out.println("next:");
        int i=5;
        System.out.println(i);

        /*
        int j;
        System.out.println(j);
        // j cannot be used without being initiated
        */

        // static test
        System.out.println("\nStatic test:");
        StaticTest.fun_static();
        StaticTest s = new StaticTest();
        System.out.println(s.i = 12);
        StaticTest s2 = new StaticTest();
        s2.i = 33;
        StaticTest.fun_static();
        s.fun_static();

    }
}

class Recursion {

    Recursion r1;
    Recursion r2;
}

class StaticTest {
    static int i = 54;
    int j = 43;
    static void fun_static () {
        System.out.println(i);
        // System.out.println(j);
        // cannot be referenced from a static context
    }
}

class Scope {
    int x;
    static void test () {

        int x;

        for (int i=0; i<10; i++){
            // int x; // illegal
            // int x has defined
            int y;
            String s = new String ("a string");
        }

        // System.out.println(s);
        // cannot resolve symbol s
    }

}

class DataOnly {
    int i;
    float f;
    boolean b;
}

