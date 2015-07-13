package one.lisp;

/**
 * Created by bialy on 7/13/15.
 */
public class Exponents {

    public static void main(String[] args) {
        // Uppercase and lowercase 'e' are the same;
        float expFloat = 1.39e-43f;
        expFloat = 1.39E-43f;
        System.out.println(expFloat);
        double expDouble = 457e47d; // 'd' is optional
        double expDouble2 = 47e47; // Automatically double

        System.out.println(expDouble);
        float expFloat2 = 1.39e+4f;
        System.out.println(expFloat2);
    }
}
