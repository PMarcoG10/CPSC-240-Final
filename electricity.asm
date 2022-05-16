;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Marco Gabriel
;  Author email: marcog10@csu.fullerton
;  Section: CPSC 240-07
;
;Program information
;  Program name: Electric Power Program
;
;  Purpose: Displays the tics and Calcultes the current 
;
;=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;
;===== Begin code area ===========================================================================================================

extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern atof

global electricity
;====================Declaring Texts==================================
segment .data
clock_data db "The time on the clock is now %lu.",10,0

night_day_prompt db "We turn your night into day.",10,0

enter_emf db "Please enter the emf value (volts): ",0

; to format the users input
lf_format db "%lf",0

enter_resistance db "Please enter the resistance (ohms): ",0

computed_current db "The computed current is %lf amps.",10,0

return_message db "The Electric Power will send the current to the caller.",10,0

end_time db "The end time on the clock is now %lu tics",10,0

segment .bss

segment .text

electricity:

;=========== Back up all the GPRs whether used in this program or not =========================================================

push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14
push       r15                                              ;Back up r15
pushf 

;=====Print the tics
cpuid
rdtsc

shl rdx, 32
add rax, rdx
mov r15, rax

mov rax, 0
mov rdi, clock_data
mov rsi, r15
call printf

;=====Prints out the night and day prompt
mov rax, 0
mov rdi, night_day_prompt
call printf

;======Enter the emf value
mov rax, 0
mov rdi, enter_emf
call printf

mov rax, 1
mov rdi, lf_format
mov rsi, rsp
call scanf
movsd xmm14, [rsp]

;=====Enter resistance value
mov rax, 0
mov rdi, enter_resistance
call printf

mov rax, 1
mov rdi, lf_format
mov rsi, rsp
call scanf
movsd xmm13, [rsp]

;==== Math part I(Current) = Emf / Resistance
;xmm14 has emf
;xmm13 has resistance

divsd xmm14, xmm13 ; emf/ resitance
movsd xmm12, xmm14 ; current stored in xmm12

;=====Displays the computed current
mov rax, 1
mov rdi, computed_current
movsd xmm0, xmm12
call printf

;======Will display the return message
mov rax, 0
mov rdi, return_message
call printf

;=====Display the end time
mov rax, 0
mov rdi, end_time
mov rsi, r15
call printf

;return to the driver
movsd xmm0, xmm12

;===== Restore original values to integer registers ===============================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret ; return