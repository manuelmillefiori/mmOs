; Bootloader generico
;;org 0x7c00
bits 16
start:
    jmp boot

;; Definizioni di variabili e costanti
msg db "Benvenuto in mmOS!", 0

;; Processo di boot
boot:
    ;; Nessuna interruzione
    cli

    ;; Tutto ciò che dobbiamo inizializzare
    cld

    ;; ****************
    ;; Lettura dati dal floppy
    ;mov ax, 0x50

    ;; Imposto il buffer
    ;mov es, ax
    ;xor bx, bx

    ;mov al, 2           ; Leggo 2 settori
    ;mov ch, 0           ; Track 0
    ;mov cl, 2           ; Settore da leggere
    ;mov dh, 0           ; Head number
    ;mov dl, 0           ; Drive number
    ;
    ;mov ah, 0x02        ; Leggo i settori dal disco
    ;int 0x13            ; Chiamo la routine di lettura del BIOS
    ;
    ;jmp 0x50:0x0        ; Jump ed esecuzione del settore
    ;; ****************

    ;; ****************
    ;; Stampa del messaggio

    mov si, msg          ; Conservo l'indirizzo del messaggio per la
                         ; stampa della stringa

    call print_string    ; Invoco la procedura per la stampa della stringa
    ;; ****************

    ;; Halt del sistema
    hlt

;; Procedura per la stampa di una stringa
print_string:
    mov ah, 0x0e

;; Flag per stampare carattere
;; per carattere
.repeat_next_char:
    lodsb                   ; Ottengo il carattere dalla stringa
    cmp al, 0               ; Verifico se siamo arrivati alla
                            ; fine della stringa

    je .done_print          ; Se il carattere è 0, la stringa
                            ; è finita

    int 0x10                ; Codice di interrupt per la stampa
                            ; del carattere dal registro "al"

    jmp .repeat_next_char   ; Se non è 0 ripeto la stampa
                            ; del carattere

.done_print:
    ;; Carriage return
    mov al, 13
    int 0x10

    ;; New line
    mov al, 10
    int 0x10

    ret                     ; return

;; Dobbiamo avere 512 byte,
;; quindi puliamo il resto con degli 0
times 510 - ($-$$) db 0

;; Firma di avvio (boot signature)
dw 0xaa55
