.data
#cadastrando frases
	perg1: .asciiz "Base: "
	perg2: .asciiz "Expoente: "
	resp: .asciiz "Resultado: "
	
.text 

	li $v0,4 		
	la $a0,perg1		# printando "Base: "
	syscall
	
	li $v0, 5		#recebendo um inteiro
	syscall
	move $t0, $v0 		#guardando inteiro em um registrador $t0 (BASE)
	
	li $v0,4
	la $a0,perg2		#printadno "Expoente: "
	syscall
	
	li $v0, 5		#recebendo outro inteiro
	syscall			
	move $t1, $v0 		#guardando em $t1 (EXPOENTE)
	
	beqz  $t1,zero
	
	move $t2, $zero		#$t2 (CONTADOR)
	
	move $t4,$t0		#Base
	
	subi $t5, $t1, 1	# (Expoente - 1)
	
	while:
		beq $t2, $t5, saida	#Se contador for == (expo - 1) vá para saida
		mul $s0, $t0, $t4 	
		move $t4, $s0		
		addi $t2, $t2, 1
		j while
	saida:
		
		li $v0,4
		la $a0,resp	#Printando "Resultado: "
		syscall
		
		li $v0, 1
		move $a0, $t4	#Exibindo inteiro (Resultado da exponencial)
		syscall
		j end
	
	zero:
	
		addi $t6,$zero,1	#valor 1 ($t6)
		
		li $v0,4
		la $a0,resp	#Printando "Resultado: "
		syscall
		
		li $v0, 1
		move $a0, $t6	#Exibindo inteiro (Resultado da exponencial)
		syscall
	end:
		
