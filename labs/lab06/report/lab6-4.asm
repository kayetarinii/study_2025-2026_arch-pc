%include 'in_out.asm'
SECTION .data
formula: DB 'Вычисляем: y = 18(x+1)/6',0
msg: DB 'Введите x: ',0
rem: DB 'Результат y: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
; Показываем формулу
mov eax, formula
call sprintLF

; Запрашиваем x
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread

; Преобразуем в число
mov eax,x
call atoi

; Вычисляем y = 18(x+1)/6
add eax,1
mov ebx,18
mul ebx
mov ebx,6
xor edx,edx
div ebx

; Выводим результат
mov ebx,eax
mov eax,rem
call sprint
mov eax,ebx
call iprintLF

call quit
