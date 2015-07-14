package one.lisp;

/**
 * Created by bialy on 7/13/15.
 * Coin-flipping
 */

import java.util.*;

public class Exe7 {
    public static void main(String[] args) {

        Random rand = new Random();

        if ( rand.nextInt()%2 == 0) {
            System.out.printf("正面");
        } else {
            System.out.printf("反面");
        }
    }
}
