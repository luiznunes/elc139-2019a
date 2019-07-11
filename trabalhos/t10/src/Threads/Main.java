package Threads;

public class Main {

    public static void main(String[] args) {
        int n = Runtime.getRuntime().availableProcessors();
        System.out.println("Esta máquina tem " + n + " processadores");

        long start = System.nanoTime();
        Array array = new Array();
        Contador[] thread = new Contador[n];
        for(int i=0;i<n;i++){
            thread[i] = new Contador(array);
            thread[i].start();
        }
        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("Time elapsed: "+timeElapsed);
    }
}







