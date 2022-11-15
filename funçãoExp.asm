.text 
	li $v0, 5
	syscall
	
	move $t0, $v0 #a
	
	li $v0, 5
	syscall
	
	move $t1, $v0 #n
	
	move $t2, $zero#contador
	
	addi $t4, $t4, 2
	
	while:
		beq $t2, $t1, saida
		mul $s0, $t0, $t4
		move $t4, $s0
		addi $t2, $t2, 1
		j while
	saida:
		li $v0, 1
		move $a0, $t4
		syscall 
		