package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */

import static net.mindview.util.Print.*;

class Letter_gain {
    float x;
}


public class Exe3 {

    static void f1 (Letter_gain l) {
        l.x = 12;
    }

    static void f2 (Letter_gain l) {
        Letter_gain l2 = new Letter_gain();
        l2.x = -12;
        l = l2;
    }

    public static void main(String[] args) {

        Letter_gain l = new Letter_gain();
        l.x = 0;
        print("1: l.x: " + l.x);

        f1(l);
        print("1: l.x: " + l.x);

        l.x=0;
        f2(l);
        print("1: l.x: " + l.x);

    }
}
