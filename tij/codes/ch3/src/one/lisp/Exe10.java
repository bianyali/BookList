package one.lisp;

/**
 * Created by bialy on 7/13/15.
 */


import static  net.mindview.util.Print.*;

public class Exe10 {

    public static void main(String[] args) {
        int b1 = 0xaaaaaaaa;

        // print(Integer.toBinaryString(b));

        int b2 = ~b1;
        int b3 = b1 & b2;
        int b4 = b2 ^ b3;
        int b5 = b1 | b2;
        print(Integer.toBinaryString(b1));
        print(Integer.toBinaryString(b2));
        print(Integer.toBinaryString(b3));
        print(Integer.toBinaryString(b4));
        print(Integer.toBinaryString(b5));

    }
}
