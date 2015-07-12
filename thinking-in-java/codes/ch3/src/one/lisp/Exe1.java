package one.lisp;

import java.util.*;

import static net.mindview.util.Print.*;

public class Exe1 {
    public static void main(String[] args) {
        print("hello, world");
        System.out.printf("Hello, world");

        /*
        *
        int a;
        int b = a;
        // variable a might not have been initialized

        *******

        int a = 4;
        4 = a;
        */
        Tank t = new Tank();
        t.level = 12;
    }
}
