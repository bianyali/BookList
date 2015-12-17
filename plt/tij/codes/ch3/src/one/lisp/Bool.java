package one.lisp;

import net.mindview.util.RandomGenerator;

/**
 * Created by bialy on 7/13/15.
 * Relational and logical operators
 */


import java.util.*;
import static net.mindview.util.Print.*;

public class Bool {

    public static void main(String[] args) {
        Random random = new Random(44);

        int i = random.nextInt(100);
        int j = random.nextInt(100);
        print("i = " + j);
        print("j = " + j);

        print("i > j : " + (i > j));
        print("i < j : " + (i < j));

        print("i >= j : " + (i >= j));
        print("i <= j : " + (i <= j));

        print("i == j : " + (i == j));
        print("i != j : " + (i != j));



    }
}

