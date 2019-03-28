#### ELC 139-2019 Andrea Charão
#### Aluno: Luiz Gustavo Nunes
#### 2019/01
#### Programação Paralela

Trabalho realizado em um computador com Ubuntu 16.04 64 bits com processador AMD de 8 cores.

Questões Pthreads:
1- Explique como se encontram implementadas as 4 etapas de projeto: particionamento, comunicação, aglomeração, mapeamento (use trechos de código para ilustrar a explicação).

Particionamento:
	O particionamento se dá através da função dotprod_worker(void), que é chamada em:
```
for (i = 0; i < nthreads; i++) {
      pthread_create(&threads[i], &attr, dotprod_worker, (void *) i);
}
```
Este "for" tem como critério de iteração, o número de threads informado na execução do programa. Dentro da função dotprod_worker(void) tem alguns parâmetros responsáveis pela divisão do vetor entre o número de threads:

```
offset = representa a ID de cada thread para controle interno.
wsize = informa o tamanho do vetor que cada thread irá possuir.
start = produto de offset com wsize, que representa a posição de início de cada parte.
end = soma de start com wsize, representa a posição final de cada parte.
```

Comunicação:
A comunicação se dá no seguinte trecho de código:
```
    read_mutex_lock (&mutexsum);
    dotdata.c += mysum;
    hread_mutex_unlock (&mutexsum);
```
mysum acumula a soma parcial de cada thread, e na de armazenar em dotdata.c, que é global e acessível por todas as threads, é realizado um lock na variável de controle e liberado após armazenar a soma.
Com isso não corre o risco de mais de uma thread tentar acessar o mesmo registro simultâneamente.

2- Considerando o tempo (em microssegundos) mostrado na saída do programa, qual foi a aceleração (speedup) com o uso de threads?


#### A execução foi realizada 3 vezes com cada número de threads, foi testado com 1,2,4 e 8 threads, as respectivas médias foram:

##### ./pthreads_dotprod 1 1000000 2000
##### média 1 thread = 8843581

##### ./pthreads_dotprod 2 500000 2000
##### média 2 threads = 4499354

##### ./pthreads_dotprod 4 250000 2000
##### média 4 threads = 2313797

##### ./pthreads_dotprod 8 125000 2000
##### média 8 threads = 1308865

#### Segue o speedup referente a cada teste:
|         |                |                 |         | 
|---------|----------------|-----------------|---------| 
| Threads | Tempo 1 thread | Tempo N threads | Speedup | 
| 2       | 8843581        | 4499354         | 1.97    | 
| 4       | 8843581        | 2313797         | 3.82    | 
| 8       | 8843581        | 1308865         | 6.76    | 

### 3) - 4)

##### ./pthreads_dotprod 1 500000 3000
##### média 1 thread = 6488420

##### ./pthreads_dotprod 2 250000 3000
##### média 2 threads = 3177664

##### ./pthreads_dotprod 4 125000 3000
##### média 4 thread =  1586008

##### ./pthreads_dotprod 8 62500 3000
##### média 8 threads = 863088

|         |                |                 |         | 
|---------|----------------|-----------------|---------| 
| Threads | Tempo 1 thread | Tempo N threads | Speedup | 
| 2       | 6488420        | 3177664         | 2.04    | 
| 4       | 6488420        | 1586008         | 4.09    | 
| 8       | 6488420        | 863088         | 7.52    | 

##### ./pthreads_dotprod 1 1000000 2000
##### média 1 thread = 8843581

##### ./pthreads_dotprod 2 500000 2000
##### média 2 threads = 4499354

##### ./pthreads_dotprod 4 250000 2000
##### média 4 threads = 2313797

##### ./pthreads_dotprod 8 125000 2000
##### média 8 threads = 1308865

|         |                |                 |         | 
|---------|----------------|-----------------|---------| 
| Threads | Tempo 1 thread | Tempo N threads | Speedup | 
| 2       | 8843581        | 4499354         | 1.97    | 
| 4       | 8843581        | 2313797         | 3.82    | 
| 8       | 8843581        | 1308865         | 6.76    | 

##### ./pthreads_dotprod 1 2000000 4000
##### média 1 thread = 35388292

##### ./pthreads_dotprod 2 1000000 4000
##### média 2 threads = 17925168

##### ./pthreads_dotprod 4 500000 4000
##### média 4 thread =  9331699

##### ./pthreads_dotprod 8 250000 4000
##### média 8 threads = 6718201

|         |                |                 |         | 
|---------|----------------|-----------------|---------| 
| Threads | Tempo 1 thread | Tempo N threads | Speedup | 
| 2       | 35388292        | 17925168         | 1.97    | 
| 4       | 35388292        | 9331699         | 3.79    | 
| 8       | 35388292        | 6718201         | 5.27    |


5- Explique as diferenças entre pthreads_dotprod.c e pthreads_dotprod2.c. Com as linhas removidas, o programa está correto?

##### - Não está correto, estas linhas funcionam como um semáforo para controlar quem vai gravar algum registro, sem ela as threads iriam sobrescrever o mesmo valor e dar inconscistência no resultado.
