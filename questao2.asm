.data 
#Area de dados da memoria principal
	msg1: .asciiz "Quociente = "
	msg2: .asciiz "Resto = " #mensagens a serem exibidas para o
	msg_par: .asciiz "Par"
	msg_impar: .asciiz "Impar"
	# usuario
	espaco: .byte ' '
.text
#Area de intruï¿½ï¿½o pra o programa

	li $v0, 5 #leitura de int
	syscall #pedindo o dividendo = numero
	
	move $t0, $v0 #quardando o dividendo = numero
	
	addi $s0,$zero,1 
	addi $s1,$s0,1 #guardando valor 2 
	
	move $t1,$s1#quardando o divisor
	
	move $t2,$t0#resto=dividendo
	
	move $t3,$zero#quociente=0
	
	while:
		bgt $t1,$t2,saida
		sub $t2,$t2,$t1
		addi $t3,$t3,1
		j while
	saida:		
		
		li $v0, 4 				#printar
		la $a0, msg2
		syscall #printar msg2    "resto = "
		
		li $v0, 1#printar int
		move $a0,$t2#resto				$t2 = resto
		syscall#print
		
		li $v0,4 
		la $a0,espaco			#printando espaço
		syscall
		
		beq $t2,$zero,par
		
		li $v0,4
		la $a0,msg_impar		#"Impar"
		syscall
		j fim
		par:
		
		li $v0,4
		la $a0,msg_par
		syscall
		
		fim:
		
		
		
