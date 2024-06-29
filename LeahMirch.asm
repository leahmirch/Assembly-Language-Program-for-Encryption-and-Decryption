; Encryption Program (Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc
KEY = 239 ; any value between 1-255

.data
    sEncrypt BYTE "Cipher text: ",0
    sDecrypt BYTE "Decrypted: ",0
    buffer BYTE "Leah Mirch",0
    bufSize DWORD LENGTHOF buffer

.code
main PROC
    ; call InputTheString ; we've removed this because we're using a hardcoded string
    call TranslateBuffer ; encrypt the buffer
    mov edx,OFFSET sEncrypt ; display encrypted message
    call DisplayMessage
    call TranslateBuffer ; decrypt the buffer
    mov edx,OFFSET sDecrypt ; display decrypted message
    call DisplayMessage

    exit
main ENDP

;-----------------------------------------------------
DisplayMessage PROC
    pushad
    call WriteString
    mov edx,OFFSET buffer ; display the buffer
    call WriteString
    call Crlf
    call Crlf
    popad
    ret
DisplayMessage ENDP

;-----------------------------------------------------
TranslateBuffer PROC
    pushad
    mov ecx,bufSize ; loop counter
    mov esi,0 ; index 0 in buffer
L1:
    xor buffer[esi],KEY ; translate a byte
    inc esi ; point to next byte
    loop L1

    popad
    ret
TranslateBuffer ENDP
END main
