.data
    matriz: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    num_linhas: .word 3  # Número de linhas da matriz
    num_colunas: .word 4  # Número de colunas da matriz
    linha_alvo: .word 3  # Linha que queremos somar

.text
.globl main
    main:
        # Carregar número de colunas e linha alvo
        lw $t1, num_colunas   # $t1 = número de colunas
        lw $t2, linha_alvo    # $t2 = linha alvo

        # Calcular o offset inicial da linha alvo
        subi $t2, $t2, 1      # Ajustar linha alvo para seu indice (subtrair 1)
        mul $t3, $t2, $t1     # $t3 = indice da linha * número de colunas
        sll $t3, $t3, 2       # $t3 = índice da linha * 4 (cada elemento tem 4 bytes)

        # Inicializar acumulador da soma da linha
        li $t4, 0  # $t4 = Soma acumulada da linha

        # Loop através das colunas
        li $t5, 0  # $t5 = contador de colunas
    loop:
        bge $t5, $t1, saida  # Se o contador de colunas >= número de colunas, sair do loop

        # Calcular o endereço do elemento atual
        sll $t6, $t5, 2       # $t6 = $t5 * 4 (cada elemento tem 4 bytes)
        add $t7, $t3, $t6     # $t7 = offset da linha + offset da coluna
        lw $t9, matriz($t7)   # Carregar elemento da matriz

        # Somar o elemento ao acumulador da linha
        add $t4, $t4, $t9

        # Incrementar o contador de colunas
        addi $t5, $t5, 1

        # Repetir o loop
        j loop

    saida:
        # O resultado da soma da linha está em $t4
        move $a0, $t4 # Move o valor de $t4 para $a0
        li $v0, 1 # Instrução para imprimir o valor de um inteiro que está em $a0
        syscall

        # Para este exemplo, apenas terminamos o programa
        li $v0, 10  # Código de syscall para terminar o programa
        syscall
