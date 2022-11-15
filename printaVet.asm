.data
	meuVet: .space 12
	novaL: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	li $v0, 5
	syscall
	
	move $s1, $v0
	
	li $v0, 5
	syscall
	
	move $s2, $v0
	
	addi $t0, $zero, 0
	
	sw $s0, meuVet($t0)
		addi $t0, $t0, 4
	sw $s1, meuVet($t0)
		addi $t0, $t0, 4
	sw $s2, meuVet($t0)
		addi $t0, $t0, 4
	
	
	
	#limpar $t0
	addi $t0, $zero, 0
	#printar os elementos do array
	while:
		beq $t0, 12, saida
		
		lw $t6, meuVet($t0)
		
		addi $t0, $t0, 4
		
		li $v0, 1
		move $a0, $t6
		syscall
		
		li $v0, 4
		la $a0, novaL
		syscall 
		
		j while
	saida:
		li $v0, 10
		syscall
	
	
	