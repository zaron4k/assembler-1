format PE GUI 4.0
entry start

include 'D:\FASM\INCLUDE\win32a.inc'

section '.idata' import data readable writeable
    library kernel32, 'kernel32.dll', user32, 'user32.dll'
    import kernel32, ExitProcess, 'ExitProcess'
    import user32, MessageBoxA, 'MessageBoxA', wsprintfA, 'wsprintfA'

section '.data' data readable writeable
    Caption db "????????",0
    Text db "P = %d",0
    buf db 256 dup(0)
    a dd 5
    b dd 7

section '.code' code readable executable
start:
    mov eax, [a]      
    add eax, [b]      
    imul eax, 2       

    push eax
    push Text
    push buf
    call [wsprintfA]  ; ??????????: ???????? wsprintfA ?? User32.dll
    add esp, 12     

    push 0
    push Caption
    push buf
    push 0
    call [MessageBoxA]  ; ??????????: ?????????? MessageBoxA
    add esp, 16     

    push 0
    call [ExitProcess]  ; ??????????: ?????????? ExitProcess ?? Kernel32.dll
