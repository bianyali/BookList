package one.lisp;

/**
 * Created by bialy on 7/13/15.
 */


import static net.mindview.util.Print.*;

public class Exe8 {
    public static void main(String[] args) {
        long l1 = 12L;
        long l2 = 432L;

        long l3 = 0X123fffL;
        long l4 = 01236L;

        print(Long.toBinaryString(l1));
        print(Long.toBinaryString(l2));
        print(Long.toBinaryString(l3));
        print(Long.toBinaryString(l4));

    }
}
