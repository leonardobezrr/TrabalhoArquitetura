.data 
#Area de dados da memoria principal
	msg1: .asciiz "Quociente = "
	msg2: .asciiz "Resto = " #mensagens a serem exibidas para o
	# usuario
	espaco: .byte ' '
.text
#Area de intrução pra o programa

	li $v0, 5 #leitura de int
	syscall     #pedindo o dividendo
	
	move $t0, $v0   #guardando o dividendo
	
	li $v0, 5
	syscall     #pedindo o divisor
	
	move $t1, $v0    #quardando o divisor
	
	move $t2,$t0    #resto=dividendo
	
	move $t3,$zero  #quociente=0
	
	while:
		bgt $t1,$t2,saida
		sub $t2,$t2,$t1
		addi $t3,$t3,1
		j while
	saida:
		li $v0, 4   #printar string
		la $a0, msg1
		syscall #printar msg1 quoci
		
		li $v0, 1   #printar int
		move $a0,$t3    #quociente
		syscall#print
		
		li $v0, 4
		la $a0, espaco
		syscall #printar espaco
		
		li $v0, 4
		la $a0, msg2
		syscall #printar msg2 rest
		
		li $v0, 1#printar int
		move $a0,$t2#resto
		syscall#print

