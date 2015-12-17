package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */

import static net.mindview.util.Print.*;

public class AutoInc {

    public static void main(String[] args) {

        int i = 1;
        print("i : " + i);
        print("++i : " + ++i); // Pre-increment
        print("i : " + i);
        print("i++ : " + i++); // Post-increment
        print("i : " + i);
        print("--i : " + --i); // Pre-decrement
        print("i : " + i);
        print("i-- : " + i--); // Post-decrement
        print("i : " + i);
    }
}
