package one.lisp;

/**
 * Created by bialy on 7/12/15.
 */



class Dog {
    String name;
    String says;
}



public class Exe5 {

    public static void main(String[] args) {
        Dog d1 = new Dog();
        Dog d2 = new Dog();
        d1.name = "spot";
        d1.says = "Ruff!";
        d2.name = "scruffy";
        d2.says = "Wurf";

        Dog d3 = d1;

        System.out.println("d1.name: " + d1.name + " d1. say: " + d1.says);

        System.out.println("d2.name: " + d2.name + " d2. say: " + d2.says);


        System.out.println(d3.equals(d1));
    }
}
