        .encoding "petscii_upper"

        .label TL_SOFTIEC = $DF1B
        .label TL_CTRLSTATUS = $DF1C
        .label TL_CMDDAT_ID = $DF1D
        .label TL_RESPONSE = $DF1E
        .label TL_STATUS = $DF1F
        .label SOCKET = $03

        .segment Q0701H1 [outPrg="0107h1.prg", min=$0d00, max=$0fff]
        serialdriver($0d00, $0f00)

        .segment Q1806H2 [outPrg="1806h2.prg", min=$9600, max=$98ff]
        serialdriver($9600, $9800)
        
        
.macro serialdriver(startaddress, ethernetaddress) {
        * = startaddress
        brk
        brk
        brk
        jmp init
        nop
serial:
        inx
        stx $b5
        ldx #<intmode
        ldy #>intmode
        stx $0318
        sty $0319
        lda #<pollmode
        sta $c616
        lda #>pollmode
        sta $c617
        lda $dd0d
        rts

intmode:
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
        beq l9670
        lda #$00
        sta $dd06
        lda $0296
        sta $dd07
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
l9670:
        txa
        and #$01
        beq l96bd
        lda $dd00
        and #$fb
        ora $b5
        sta $dd00
        lda $b4
        beq l9696
        dec $b4
        beq l968f
        lsr $b6
        bcs l968f
        lda #$00
        beq l9691
l968f:
        lda #$04
l9691:
        sta $b5
        jmp l96bd
l9696:
        sta $b5
        lda #$09
        sta $b4
        ldy $029d
        cpy $029e
        beq l96ae
        lda ($f9),y
        sta $b6
        inc $029d
        jmp l96bd
l96ae:
        lda #$01
        sta $dd0d
        lda $02a1
        and #$fe
        ora #$80
        sta $02a1
l96bd:
        txa
        and #$02
        beq l9705
        ldx $a9
        bne l96f2
        lsr $a7
        ror $aa
        dec $a8
        bne l9705
        ldy $029b
        iny
        cpy $029c
        beq l96fa
        sty $029b
        dey
        lda $aa
        sta ($f7),y
l96df:      
        lda #$02
        sta $dd0d
        lda $02a1
        and #$fd
        ora #$90
        sta $02a1
        sta $a9
        bne l9705
l96f2:
        lda $a7
        bne l96df
        sta $a9
        beq l9705
l96fa:
        lda #$04
        ora $0297
        sta $0297
        jmp l96df
l9705:
        lda $02a1
        sta $dd0d
        pla
        tay
        pla
        tax
        pla
        rti

pollmode:
        lda $02a1
        cmp #$82
        bne l9736
        lda $029b
        cmp l9745
        bne l9736
        dec l9744
        beq l9728
        jmp $c53c
l9728:
        lda $02a1
        eor #$12
        sta $02a1
        sta $dd0d
        lda $dd0d
l9736:
        lda $029b
        sta l9745
        lda #$00
        sta l9744
        jmp $c53c
l9744:
        brk
l9745:
        brk
        brk

init:
        php
        sei
        ldx $01
        lda #$34
        sta $01
        lda $d602
        stx $01
        plp
        cmp #$08
        beq inituci
        ldx #$ff
        stx $a9
        jmp serial
        
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

        ldy #$00
copydriver:
        lda ethernetaddress,y
        sta startaddress,y
        iny
        bne copydriver
        rts
        
ethernetdriverbegin:
        * = ethernetaddress
        .pseudopc startaddress {
restart:
        nop
        nop
        nop
        jmp inituci
        
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


statuscode:
        .byte 0,0
recvlength:
        .byte 0, 0
        }
        
ethernetdriverend:
}
