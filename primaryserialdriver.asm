        .encoding "petscii_upper"

        .label TL_SOFTIEC = $DF1B
        .label TL_CTRLSTATUS = $DF1C
        .label TL_CMDDAT_ID = $DF1D
        .label TL_RESPONSE = $DF1E
        .label TL_STATUS = $DF1F
        .label SOCKET = $03
        .segment SerialDriverProg [outPrg="0011h1.prg", start=$0c80, max=$0fff]
                .segmentout [segments="SerialDriver"]
        
        .segmentdef SerialDriver[start=$0c80]
        
        .segment SerialDriver
waitidle:
        clc
        lda TL_CTRLSTATUS
        tay
        and #$30
        cmp #$10
        beq waitidle
        tya
        and #$08
        beq idleok
        lda #$0C
        sta TL_CTRLSTATUS
waitreset:
        lda TL_CTRLSTATUS
        and #$04
        bne waitreset
idleok:
        clc
        rts

acceptwait:
        lda TL_CTRLSTATUS
        lda #$02
        sta TL_CTRLSTATUS
waitaccept:
        lda TL_CTRLSTATUS
        and #$02
        bne waitaccept
        lda TL_CTRLSTATUS
        bne acceptwait
        rts

checkstatusok:
        lda TL_STATUS
        sta statuscode
        lda TL_STATUS
        sta statuscode+1
        jsr flushstatus
        lda statuscode
        ora statuscode+1
        sec
        sbc #$30
        rts

flushstatus:
        lda TL_CTRLSTATUS
        and #$40
        beq flushdone
        lda TL_STATUS
        jmp flushstatus

flushdata:
        lda TL_CTRLSTATUS
        and #$80
        beq flushdone
        lda TL_RESPONSE
        jmp flushdata

flushdone:
        rts

        * = $0d00
        brk
        brk
        brk
        jmp init
serial:
        lda #$37
        sta $01
        ldx #$15
l0d0c:
        lda $fec0,x
        sta $0e65,x
        dex
        bpl l0d0c
        pla
        sta $01
        ldx #$ff
        stx $a9
        inx
        stx $b5
        ldx #$37
        ldy #$0d
        stx $0318
        sty $0319
        lda #$30
        sta $c616
        lda #$0e
        sta $c617
        lda $dd0d
        rts
        pha
        txa
        pha
        tya
        pha
        lda #$7f
        sta $dd0d
        lda $dd01
        and #$01
        sta $a7
        lda $dd0d
        and $02a1
        tax
        and #$10
        beq l0d8f
        lda $0293
        and #$0f
        asl
        tay
        lda $0e66,y
        sta $dd07
        sta $0296
        lda #$00
        sta $dd06
        lda #$11
        sta $dd0f
        txa
        ora $dd0d
        and $02a1
        tax
        lda $02a1
        and #$ef
        ora #$82
        sta $02a1
        lda $0299
        sta $dd06
        lda $029a
        sta $dd07
        lda #$08
        sta $a8
l0d8f:
        txa
        and #$01
        beq l0ddc
        lda $dd00
        and #$fb
        ora $b5
        sta $dd00
        lda $b4
        beq l0db5
        dec $b4
        beq l0dae
        lsr $b6
        bcs l0dae
        lda #$00
        beq l0db0
l0dae:   
        lda #$04
l0db0:   
        sta $b5
        jmp l0ddc
l0db5:   
        sta $b5
        lda #$09
        sta $b4
        ldy $029d
        cpy $029e
        beq l0dcd
        lda ($f9),y
        sta $b6
        inc $029d
        jmp l0ddc
l0dcd:   
        lda #$01
        sta $dd0d
        lda $02a1
        and #$fe
        ora #$80
        sta $02a1
l0ddc:   
        txa
        and #$02
        beq l0e24
        ldx $a9
        bne l0e11
        lsr $a7
        ror $aa
        dec $a8
        bne l0e24
        ldy $029b
        iny
        cpy $029c
        beq l0e19
        sty $029b
        dey
        lda $aa
        sta ($f7),y
l0dfe:   
        lda #$02
        sta $dd0d
        lda $02a1
        and #$fd
        ora #$90
        sta $02a1
        sta $a9
        bne l0e24
l0e11:    
        lda $a7
        bne l0dfe
        sta $a9
        beq l0e24
l0e19:   
        lda #$04
        ora $0297
        sta $0297
        jmp l0dfe
l0e24:   
        lda $02a1
        sta $dd0d
        pla
        tay
        pla
        tax
        pla
        rti
        lda $02a1
        cmp #$82
        bne l0e55
        lda $029b
        cmp $0e64
        bne l0e55
        dec $0e63
        beq l0e47
        jmp $c53c
l0e47:   
        lda $02a1
        eor #$12
        sta $02a1
        sta $dd0d
        lda $dd0d
l0e55:   
        lda $029b
        sta $0e64
        lda #$00
        sta $0e63
        jmp $c53c

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
init:
        php
        sei
        ldx $01
        lda #$34
        sta $01
        lda $d602
        bne dialtypesaved
        lda $1200
        sta $d602
dialtypesaved:
        stx $01
        plp
        cmp #$08
        beq inituci
        lda $01
        pha
        jmp serial
inituci:
        lda #<altchrout
        sta $0326
        lda #>altchrout
        sta $0327
        lda #<altgetin
        sta $032a
        lda #>altgetin
        sta $032b
        lda #<altb800
        sta $c543
        lda #>altb800
        sta $c544
        lda #<altckin
        sta $031e
        lda #>altckin
        sta $031f
        rts

connectuci:
        lda #$03
        sta TL_CMDDAT_ID
        lda #$07
        sta TL_CMDDAT_ID
        lda $12db
        sta TL_CMDDAT_ID
        lda $12dc
        sta TL_CMDDAT_ID
        ldy #$00
sendname:
        lda $12dd,y
        cmp #$80
        beq donename
        sta TL_CMDDAT_ID
        iny
        jmp sendname
donename:
        jsr executecommand
        lda TL_RESPONSE
        sta SOCKET
        jsr flushdata
        jsr checkstatusok
        jsr acceptwait
        rts

readsocket:
        lda #$03
        sta TL_CMDDAT_ID
        lda #$10
        sta TL_CMDDAT_ID
        lda SOCKET
        sta TL_CMDDAT_ID
        lda #$ff
        sta TL_CMDDAT_ID
        lda #$00
        sta TL_CMDDAT_ID
        jsr executecommand
        lda TL_RESPONSE
        lda TL_RESPONSE
        ldy #$00
readnext:
        lda TL_CTRLSTATUS
        and #$80
        beq doneread
        lda TL_RESPONSE
        sta ($f7),y
        iny
        bne readnext
doneread:
        sty $029b
        lda #$00
        sta $029c
        jsr acceptwait
        rts

writesocket:
        ldx #$03
        stx TL_CMDDAT_ID
        ldx #$11
        stx TL_CMDDAT_ID
        ldx SOCKET
        stx TL_CMDDAT_ID
        sta TL_CMDDAT_ID
        jsr executecommand
        jsr flushdata
        jsr flushstatus
        jsr acceptwait
        rts
    
altchrout:
        sta $97
        txa
        pha
        tya
        pha
        lda SOCKET
        beq oldchrout
        lda $9a
        cmp #$02
        bne oldchrout
        lda $97
        jsr writesocket
        pla
        tay
        pla
        tax
        rts
oldchrout:
        pla
        tay
        pla
        tax
        lda $97
        jmp $f1ca

altgetin:
        lda SOCKET
        beq oldgetin
        lda $99
        cmp #$02
        bne oldgetin
        ldy $029c
        cpy $029b
        bne oldgetin
        jsr readsocket
oldgetin:
        jmp $f13e

altckin:
        jsr $f30f
        beq open
        jmp $f701
open:
        jsr $f31f
        lda $ba
        cmp #$02
        bne oldckin
        sta $99
        clc
        rts
oldckin:
        jmp $f219

executecommand:
        lda #$01
        sta TL_CTRLSTATUS
        jsr waitidle
        rts

altb800:
        ldy $029c
        cpy $029b
        bne nob800read
        jsr readsocket
nob800read:
        jmp $b800


statuscode:
        .byte 0,0
recvlength:
        .byte 0, 0
