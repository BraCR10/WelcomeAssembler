;An example assembly language program   SAMPLE.ASM
;   Objetive: To demonstrate the use of some I/O
;   routines and to show the structure
;   of assembly language programs.
;   inputs: As prompted
;   outputs: As per inputs
%include "io.mac"

.DATA
name_msg    db  'Ingrese su nombre: ',0
query_msg   db  'Cuantas veces quiere repetir el mensaje?: ',0
confirm_msg1 db  'Repetir mensaje: ',0
confirm_msg2 db   ' veces? (S/N) ',0
welcome_msg db     'Bienvenido al el lenguaje Ensamblador ',0

.UDATA
user_name resb 16 ;buffer for user name
response resb 1

.CODE
    .STARTUP
    PutStr name_msg
    GetStr user_name,16
ask_count:
    PutStr query_msg
    GetInt CX
    PutStr confirm_msg1
    PutInt CX
    PutStr confirm_msg2
    GetCh [response]
    cmp byte [response],'S'
    jne ask_count
display_msg:
    PutStr welcome_msg
    PutStr user_name
    nwln
    loop display_msg
    .EXIT