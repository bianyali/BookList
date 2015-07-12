package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */
public class EqualMethods2 {

    public static void main(String[] args) {
        Value v1 = new Value();
        Value v2 = new Value();
        v1.x = v2.x = 100;

        System.out.println(v1.equals(v2));
    }
}


class Value {
    int x;
}
