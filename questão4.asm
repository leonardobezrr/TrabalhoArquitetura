.data
perg_vetor: .asciiz "Informe o tamanho do vetor: "
elemento: .asciiz "Informe o "
elementoCont: .asciiz "º vetor: "

blank: " " 
_break:"\n"
.text
.globl main
main:
li $t1,0 #valor de p
jal tam_vetor
jal read_vetor
jal _break_
jal Print_vetor
jal _break_
move $a0, $t1 #t1 vai armazenar o valor de p
move $a2,$s7 #s7 vai armazenar o tamanho do vetor

jal ordenar
jal Print_vetor
jal Exit

_break_:
la  $a0,_break
li $v0,4
syscall
jr $ra

Print_vetor:
li $s1,0 # s1 vai ser o índece
loop:
bge $s1,$s7,else
sll $s2,$s1,2 
addu $t0,$s0,$s2
li $v0,4
la $a0, blank
syscall
lw $a0,($t0)
li $v0,1
syscall
addi $s1,$s1,1
j loop

else:
jr $ra

tam_vetor:
la $a0, perg_vetor
li $v0,4
syscall
li $v0,5
syscall
move $s7,$v0
jr $ra

read_vetor:
#alocação de memória
# multiplicando o tamanho do vetor por 4, pois $a0 irá receber o número de bytes necessários, e um inteiro possui 4 bytes, logo
# tamVetor(número de elemtos do vetor) x 4
sll $t4,$s7,2 

move $a0,$t4
li $v0,9
syscall
move $s0,$v0 # $s0 armazena a primeira posição de memória alocada e consequentemente a nossa primeria posição do vetor

li $s1, 0 # inicializando o registrador com o valor do indice

loop2:
bge $s1,$s7,else
# faz a o promt dos elementos do vetor
la $a0, elemento
li $v0,4
syscall
addi $a0,$s1,1
li $v0,1
syscall
la $a0, elementoCont
li $v0,4
syscall
li $v0,5
syscall
#armazena os elementos do vetor na memória alocada
sll $t3,$s1,2 # vou multiplicar o indice por 4 e armazenar em $t3 o valor do offset onde deve ser armazenado o inteiro
addu $a1, $s0, $t3 # somando o endereço da memoria alocada na heap e somando com o offset
sw $v0, ($a1)
# incremetando o índece
addi $s1,$s1,1
j loop2

ordenar:
# move $a0, $t1 #t1 armazena o valor de p
# move $a1,$s0  # armazena o endereço inicial do vetor
# move $a2,$s7 #s7 armazena o tamanho do vetor

addi $sp,$sp,-4 #Armazenei apenas o $ra pois não dependemos de nehum tipo de retorno do procedimento recursivo realizado anteriormente
sw $ra, 0($sp) 
bge $a0,$a2,return
add $a3,$a0,$zero # a3 irá armazenar nosso índice i.
jal loop_3
addi $a0,$a0,1
jal ordenar

return:
lw $ra, 0($sp) 
addi $sp, $sp, 4
jr $ra

loop_3:
bge $a3,$a2, volte

addi $sp,$sp,-4
sw $ra, 0($sp)
#offset em relação ao índece i
sll $t2,$a3,2
#offset em relação ao índice p
sll $t3,$a0,2
#somando os offset
addu $t4,$t2,$s0 # lembrando que $s0 armazena o emdereço da memória alocada  # $t4 armazena o endereço i do vetor
addu $t5,$t3,$s0 # lembrando que $s0 armazena o emdereço da memória alocada  # $t5 armazena o endereço de p do vetor

#trazendo os resultados dessas posições de memória
lw $s1, 0($t4) #$s1 armazena o conteúdo de v[i]
lw $s2, 0($t5) #$s2 armazena o conteúdo de v[p]
jal if
addi $a3,$a3,1
j loop_3

volte:
lw $ra, 0($sp)
addi $sp,$sp,4
jr $ra

if:
bge $s1,$s2, else
move $t6,$s1
sw $t6, 0($t5)
sw $s2, 0($t4)
jr $ra

Exit:
li $v0,10
syscall
