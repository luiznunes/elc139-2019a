/*
 *  Exemplo de programa para calculo de produto escalar em paralelo, usando POSIX threads.
 *  andrea@inf.ufsm.br
 */

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct 
 {
   double *a;
   double *b;
   double c; 
   int wsize;
   int rank;
   int repeat; 
 } dotdata_t;

// Variaveis globais, acessiveis por todas threads
dotdata_t dotdata;

/*
 * Funcao executada por uma thread
 */
void *dotprod_worker()
{
   int i, k;
   // long offset = (long) arg;
   double *a = dotdata.a;
   double *b = dotdata.b;     
   int wsize = dotdata.wsize;
   int rank = dotdata.rank;
   int start = (rank)*wsize;
   int end = start + wsize;
   double mysum;

   for (k = 0; k < dotdata.repeat; k++) {
      mysum = 0.0;
      for (i = start; i < end ; i++)  {
         mysum += (a[i] * b[i]);
      }
   }

   dotdata.c += mysum;
}

/*
 * Tempo (wallclock) em microssegundos
 */ 
long wtime()
{
   struct timeval t;
   gettimeofday(&t, NULL);
   return t.tv_sec*1000000 + t.tv_usec;
}

/*
 * Preenche vetor
 */ 
void fill(double *a, int size, double value)
{  
   int i;
   for (i = 0; i < size; i++) {
      a[i] = value;
   }
}

/*
 * Funcao principal
 */ 
int main(int argc, char **argv)
{

   int np, my_rank;

   MPI_Init (&argc, &argv);

   MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
   MPI_Comm_size(MPI_COMM_WORLD,&np);

   int wsize, repeat;
   long start_time, end_time;

   if ((argc != 3)) {
      printf("Uso: %s <worksize> <repetitions>\n", argv[0]);
      exit(EXIT_FAILURE);
   }

   wsize = atoi(argv[1]);  // worksize = tamanho do vetor de cada thread
   repeat = atoi(argv[2]); // numero de repeticoes dos calculos (para aumentar carga)

   // Cria vetores
   dotdata.a = (double *) malloc(wsize*np*sizeof(double));
   fill(dotdata.a, wsize*np, 0.01);
   dotdata.b = (double *) malloc(wsize*np*sizeof(double));
   fill(dotdata.b, wsize*np, 1.0);
   dotdata.c = 0.0;
   dotdata.wsize = wsize;
   dotdata.rank = my_rank;
   dotdata.repeat = repeat;

   // Calcula c = a . b em np, medindo o tempo
   start_time = wtime();
   dotprod_worker();
   end_time = wtime();

   free(dotdata.a);
   free(dotdata.b);

   double global_sum;
   MPI_Reduce(&dotdata.c, &global_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

   long min_start_time, max_end_time;
   MPI_Reduce(&start_time, &min_start_time, 1, MPI_LONG, MPI_MIN, 0, MPI_COMM_WORLD);
   MPI_Reduce(&end_time, &max_end_time, 1, MPI_LONG, MPI_MAX, 0, MPI_COMM_WORLD);

   if (my_rank == 0) {
      printf("Total sum = %f\n", global_sum);
      printf("Time: %ld usec\n", (max_end_time - min_start_time));
   }

   MPI_Finalize();

   return EXIT_SUCCESS;
}

