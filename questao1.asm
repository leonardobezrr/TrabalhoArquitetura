.data 
#Area de dados da memoria principal
	print1: .asciiz "Informe o dividendo: \n"
	print2: .asciiz "Informe o divisor: \n"
	msg1: .asciiz "Quociente= "
	msg2: .asciiz "Resto= " #mensagens a serem exibidas para o
	# usuario
	espaco: .byte ' '
.text
#Area de intrução pra o programa

	li $v0, 4   #printar string
	la $a0, print1
	syscall #printar "Informe o dividendo: \n"

	li $v0, 5 #leitura de int
	syscall     #pedindo o dividendo
	
	move $t0, $v0   #guardando o dividendo
	
	li $v0, 4   #printar string
	la $a0, print2
	syscall #printar "Informe o divisor: \n"
	
	li $v0, 5
	syscall     #pedindo o divisor
	
	move $t1, $v0    #quardando o divisor
	
	move $t2,$t0    #resto=dividendo
	
	move $t3,$zero  #quociente=0
	
	while:
		bgt $t1,$t2,saida # resto > divisor 
		sub $t2,$t2,$t1 # resto = resto - divisor
		addi $t3,$t3,1 # somar 1 ao quociente
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
