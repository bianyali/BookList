//: Property.java

import java.util.*;



/** The first Thinking in Java example program.
 * Lists system information on current machine.
 * @author Yali Bian
 * @author http://lisp.one
 * @version 1.0
 */
public class Property {

    /** Sole entry point to class & application
     * @param args array of string arguemts
     * @return No return value
     * */
    public static void main (String [] args){
        System.out.println(new Date());
        Properties p = System.getProperties();
        p.list(System.out);

        System.out.println("--- Memory Usage:");
        Runtime rt = Runtime.getRuntime();
        System.out.println( "Total Memory = "
                + rt.totalMemory()
                + " Free memory = "
                + rt.freeMemory());
    }
} ///:~
