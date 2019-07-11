package Executors;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Main {

    public static void main(String[] args) {

        int n = Runtime.getRuntime().availableProcessors();
        System.out.println("Esta máquina tem " + n + " processadores");

        long start = System.nanoTime();
        Array array = new Array();
        Contador contador = new Contador(array);
        ExecutorService executor = Executors.newFixedThreadPool(n);

        for(int i=0;i<n;i++){
            executor.submit(() -> {
                String threadName = Thread.currentThread().getName();
                System.out.println(threadName);
                contador.work();
            });
        }

        executor.shutdown();

        try {
            executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
        } catch (InterruptedException ignored) { }

        long finish = System.nanoTime();
        long timeElapsed = finish - start;
        System.out.println("Time elapsed: "+timeElapsed);
    }
}







