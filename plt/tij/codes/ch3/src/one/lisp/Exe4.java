package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */

import java.util.Random;

import static net.mindview.util.Print.*;

public class Exe4 {

    public static void main(String[] args) {

        Random rand = new Random();
        float distance = rand.nextFloat();
        float time = rand.nextFloat();

        float velocity = distance / time;
        print("Velocity : " + velocity);

    }
}
