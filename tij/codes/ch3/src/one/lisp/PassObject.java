package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */


import static net.mindview.util.Print.*;

class Letter {
    char c;
}

public class PassObject {

    static void f(Letter y) {
        y.c = 'z';
    }

    static void fg(Letter y) {
        Letter x = new Letter();
        x.c = 'm';
        y = x;
    }

    public static void main(String[] args) {
        Letter x = new Letter();
        x.c = 'a';
        print("1: x.c: " + x.c);
        f(x);
        print("2: x.c: " + x.c);
        fg(x);
        print("3: x.c: " + x.c);
    }
}
