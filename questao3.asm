.text
main:
	#pedir dois int
	li $v0, 5
	syscall
	
	move $t0, $v0#base
	
	li $v0,5
	syscall
	
	move $t1, $v0#exp
	
	j power#entrando na função
	
mainEnd:
	li $v0, 1#printar int
	move $a0, $t3 #resultado
	syscall

power:

	move $t4, $t0
	subi $t5, $t1, 1

	beq $t1, $zero, resuUm
	while:
		beq $t2, $t5, saida
		mul $s0, $t0, $t4
		move $t4, $s0
		addi $t2, $t2, 1
		j while
	j mainEnd

resuUm:

	addi $t3, $t3, 1#resultado=1
	li $v0, 1
	move $a0, $t3
	syscall
	j encerraPro

saida:	
	li $v0, 1
	move $a0, $t4
	syscall
	j encerraPro
encerraPro:
	li $v0, 10
	syscall