[Programação Paralela](https://github.com/AndreaInfUFSM/elc139-2019a) > Trabalho 8


### Professora: Andrea Charao
### Aluno: Luiz Gustavo Nunes

### Parte 1
### Foi criado um método novo para o processamento dos loops com a tag para funcionar multi-threads no CUDA.
- wavecuda1.cu -> https://github.com/luiznunes/elc139-2019a/blob/master/trabalhos/t8/wavecuda1.cu

| Tamanho	    | Quantidade    | Wave.cpp      | Wavecuda1     |
|-------------  |------------   |-----------    |-----------    |
| 1024          | 100           | 5.3746 s      | 0.6591 s      |
| 1024          | 200           | 10.4839 s     | 0.6515 s      |
| 512           | 32            | 0.4350 s      | 0.2731 s      |
| 512           | 64            | 0.9084 s      | 0.2931 s      |


A execução com threads teve um desempenho muito superior ao sem paralelismo, com a maior carga de processamento concentrada nos laços de repetição.
PNG com todos os resultados -> https://github.com/luiznunes/elc139-2019a/blob/master/trabalhos/t8/results1.png

### Parte 2
### Nesta etapa foi modificado apenas o gerenciamento de memória, o que resultou em um ganho pequeno referente a alocação.
### Quando a memória foi alocada no host em outros testes o tempo de alocação/free ficou bem menor, porém a iteração no laço ficou extremamente lenta, isto se dá pelo fato de não ser implementado a cópia de uma variável local em cada thread.
### Este teste tem melhora de desempenho conforme vai aumentando o tamanho da grid.

- wavecuda2.cu -> https://github.com/luiznunes/elc139-2019a/blob/master/trabalhos/t8/wavecuda2.cu

| Tamanho	    | Quantidade    | Wave.cpp      | Wavecuda2     |
|-------------  |------------   |-----------    |-----------    |
| 1024          | 100           | 5.1978 s      | 0.6481 s      |
| 1024          | 200           | 10.4367 s     | 0.6358 s      |
| 512           | 32            | 0.4258 s      | 0.2912 s      |
| 512           | 64            | 0.8795 s      | 0.2886 s      |

PNG com todos os resultados -> https://github.com/luiznunes/elc139-2019a/blob/master/trabalhos/t8/results2.png
