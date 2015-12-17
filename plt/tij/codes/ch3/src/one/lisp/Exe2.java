package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */

import static net.mindview.util.Print.*;

class Tank1 {
    float level;
}

public class Exe2 {

    public static void main(String[] args) {

        Tank1 t1 = new Tank1();
        t1.level = -12;
        Tank1 t2 = new Tank1();
        t2.level = 1;
        print("1: t1.level: " + t1.level +
                ", t2.level" + t2.level);

        t1 = t2;
        print("2: t1.level: " + t1.level +
                ", t2.level" + t2.level);

        t1.level = 321;
        print("3: t1.level: " + t1.level +
                ", t2.level" + t2.level);
    }

}
