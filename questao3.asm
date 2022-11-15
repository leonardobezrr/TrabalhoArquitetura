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

	beq $1, $zero, resuUm
	j mainEnd

resuUm:

	addi $t3, $t3, 1#resultado=1
	li $v0, 1
	move $a0, $t3
	syscall
	j encerraPro
	
encerraPro:
	li $v0, 10
	syscall