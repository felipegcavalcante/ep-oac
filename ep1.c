#include <stdio.h>

// Função auxiliar para somar os elementos de uma linha específica
int soma_linha(int matriz[][4], int num_colunas, int linha_alvo) {
    linha_alvo -= 1;
    int soma = 0;

    // Loop através das colunas para somar os elementos da linha alvo
    for (int j = 0; j < num_colunas; j++) {
        soma += matriz[linha_alvo][j];
    }

    return soma;
}

int main() {
    // Definindo a matriz 3x4
    int matriz[3][4] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12}
    };


    int num_colunas = 4;  // Número de colunas da matriz
    int linha_alvo = 1;   // Linha que queremos somar

    // Chamar a função auxiliar para calcular a soma da linha alvo
    int soma = soma_linha(matriz, num_colunas, linha_alvo);

    // Imprimir o resultado da soma
    printf("%d\n", soma);

    return 0;
}
