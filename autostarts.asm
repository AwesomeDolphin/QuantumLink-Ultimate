      .encoding "petscii_upper"

        .label SETLFS = $FFBA
        .label SETNAM = $FFBD
        .label OPEN = $FFC0
        .label CLOSE = $FFC3
        .label CHKOUT = $FFC9
        .label CLRCHN = $FFCC
        .label CHROUT = $FFD2
        .label LOAD = $FFD5
        .label SAVE = $FFD8
        .label SETMSG = $FF8D

        
        .segment Quantum [outPrg="quantum.prg", start=$02cd]
                .segmentout [segments="AutoStart"]
                .segmentout [segments="InitProgASK"]

        .segment ChangeAccess [outPrg="change access.prg", start=$02cd]
                .segmentout [segments="AutoStart"]
                .segmentout [segments="InitProgREG"]

        .segment Qdemo [outPrg="qdemo.prg", start=$02cd]
                .segmentout [segments="AutoStart"]
                .segmentout [segments="InitProgDMO"]
                
        .segmentdef AutoStart [min=$02cd, max=$0334]
        .segmentdef InitProgASK [min=$0335, max=$0338]
        .segmentdef InitProgREG [min=$0335, max=$0338]
        .segmentdef InitProgDMO [min=$0335, max=$0338]
        .segment AutoStart
autostart:
		* = $02cd
        lda #$EA
        sta $0328
        lda #$02
        sta $D020
        sta $D021
        lda #$0B
        sta $D011
        lda #$07
        ldx $ba
        ldy #$01
        jsr $FFBA
        lda #$03
        ldy #$02
        ldx #$F9
        jsr $FFBD
        lda #$00
        jsr $FFD5
        jmp $9FF8
vectors:
        * = $02f9
        .byte $44, $53, $43, $44, $45, $52, $32, $8b
        .byte $e3, $cd, $02, $7c, $a5, $1a, $a7, $e4
        .byte $a7, $86, $ae, $00, $00, $00, $00, $4c
        .byte $00, $00, $00, $31, $ea, $66, $fe, $47
        .byte $fe, $4a, $f3, $91, $f2, $0e, $f2, $50
        .byte $f2, $33, $f3, $57, $f1, $ca, $f1, $ed
        .byte $f6, $3e, $f1, $2f, $f3, $66, $fe, $a5
        .byte $f4, $ed, $f5, $00

        .segment InitProgASK
        * = $0335
        .text "ASK"
        .byte 00

        .segment InitProgREG
        * = $0335
        .text "REG"
        .byte 00

        .segment InitProgDMO
        * = $0335
        .text "DMO"
        .byte 00
