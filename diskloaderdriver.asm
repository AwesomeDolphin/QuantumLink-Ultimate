       .encoding "petscii_upper"

        .label SETLFS = $FFBA
        .label SETNAM = $FFBD
        .label CHROUT = $FFD2
        .label LOAD = $FFD5
        .label SETMSG = $FF90

        .label TL_SOFTIEC = $DF1B
        .label TL_CTRLSTATUS = $DF1C
        .label TL_CMDDAT_ID = $DF1D
        .label TL_RESPONSE = $DF1E
        .label TL_STATUS = $DF1F
        
        .label SYSTEM_DRIVE = $02

        .segment QLinkLoader [outPrg="dsc.prg", start=$9ff8]
                .segmentout [segments="Initialization"]
                .segmentout [segments="Refresher"]
                .segmentout [segments="Relocater"]
                .segmentout [segments="Loader"]
                .segmentout [segments="BasicStrap"]
                
        .segmentdef Initialization [min=$9ff8, max=$a016]
        .segmentdef Refresher [min=$d000, max=$d019, fill]
        .segmentdef Relocater [min=$a031, max=$a042]
        .segmentdef Loader [min=$a043, max=$a3ff, fill]
        .segmentdef BasicStrap [min=$9f00, max=$9fff]

        .segment Initialization
        * = $9ff8
// Get pure RAM system
        sei
        lda #$34
        sta $01
        lda #$17
        sta $fb
        lda #$a0
        sta $fc
        lda #$00
        sta $fd
        lda #$d0
        sta $fe
        lda #$06
        sta $ff
        jsr memcpy
        jmp refresh

        .segment Refresher
        * = $d000
refresh:
        jsr refreshcpy
        jmp loader
refreshcpy:
        lda #$00
        sta $fb
        lda #$d0
        sta $fc
        lda #$17
        sta $fd
        lda #$a0
        sta $fe
        lda #$06
        sta $ff

        .segment Relocater
        * = $a031
memcpy:
        ldy #$00
!loop:
        lda ($fb),y
        sta ($fd),y
        iny
        bne !loop-
        inc $fc
        inc $fe
        dec $ff
        bne !loop-
        rts

        .segment Loader
        * = $a043
loader:
        sei
        lda #$34
        sta $01
        lda #$00
        bne setsettings
        lda #$01
        sta $d032
        sta loader+6
        lda #$00
        ldy #$00
initprotectedpage:
        sta $d600,y
        sta $a600,y
        iny
        bne initprotectedpage
        jsr initdetects
setsettings:
        lda $d600
        sta $ba
        sta SYSTEM_DRIVE
        lda $0330
        sta load_iload
        lda $0331
        sta load_iload + 1
        lda $d601
        bne nofastload
        lda #<load_newroutine
        sta $0330
        lda #>load_newroutine
        sta $0331
nofastload:
        lda #$36
        sta $01

        ldx $0328
        ldy #$1b
copyvect:
        lda $fd30,y
        sta $0314,y
        dey
        bpl copyvect
        stx $0328
        
        cli
        lda #$0f
        sta $d031
        lda #$00
        sta $d020
        sta $d021
        lda #$0b
        sta $d011
        lda #$40
        sta $0313
        lda #$13
        sta $0318
        lda #$03
        sta $0319
        
        lda #$00
        jsr SETMSG

        lda #$02
        ldx $ba
        ldy #$02
        jsr SETLFS

        lda #$03
        ldx #$35
        ldy #$03
        jsr SETNAM

        lda #$00
        jsr LOAD

// Set for parse
        lda #$00
        sta $fb
        lda #$aa
        sta $fc
        ldy #$00

scancommand:
        lda ($fb),y
        beq doloadhunk
scannext:
        iny
        bne scancommand
 //       beq loaderror
        jmp $fce2

// Y contains length of file name
// $fb points to filename
doloadhunk:
        tya
        sta $fd
        ldx $fb
        ldy $fc
        jsr SETNAM

        lda #$00
        jsr LOAD

// point to load address
        lda $fd
        clc
        adc $fb
        sta $fb
        ldy #$01
        lda ($fb),y
        sta $2b
        iny
        lda ($fb),y
        sta $2c

// point to next file name
        lda $fb
        clc
        adc #$03
        sta $fb
        ldy #$00
        lda ($fb),y
        bne scannext

// Load is finished
        lda load_iload
        sta $0330
        lda load_iload+1
        sta $0331
        lda #$00
        sta $0338
        lda $ae
        sta $2d
        lda $af
        sta $2e

        lda #$00
        sta $d031

        lda #$00
        sta $fb
        lda #$a4
        sta $fc
        lda #$00
        sta $fd
        lda #$9f
        sta $fe
        lda #$01
        sta $ff
        jsr memcpy

        jmp gobasic

initdetects:
        lda #$36
        sta $01
        ldx #$01

        // Yellow text, black background
        lda #$00
        sta $d020
        sta $d021
        lda #$07
        sta $0286
        lda #$93
        jsr $ffd2
        lda #$1b
        sta $d011

        // Save system drive
        lda $ba
        sta $a600

        // Detect UCI
        jsr detectultdos

        // Detect turbo
        PrintNullTerm(stringturbo)
        lda $d031
        cmp #$ff
        bne hasturbo
        PrintNullTerm(stringnot)
hasturbo:
        PrintNullTerm(stringconfigurable)

        lda #$ff
        clc
        adc $a2
delay:
        cmp $a2
        bne delay

        lda #$0b
        sta $d011

        // Copy protected memory block under I/O
        sei
        lda #$34
        sta $01
        ldy #$00
copyprotmem:
        lda $a600,y
        sta $d600,y
        iny
        bne copyprotmem

        rts

detectultdos:
        PrintNullTerm(stringuci)
        lda TL_CMDDAT_ID
        cmp #$c9
        beq uciavail
        PrintNullTerm(stringnot)
        ldx #$01
        jmp checknoci

uciavail:
        PrintNullTerm(stringavailable)
        PrintNullTerm(stringhyperload)
        ldx #$00
        lda #$05
        sta TL_CMDDAT_ID
        lda #$01
        sta TL_CMDDAT_ID
        jsr executecommand
        bcs detectultdos
        jsr checkstatusok
        bne checkfail
        ldy #$00
checknext:
        lda TL_CTRLSTATUS
        and #$80
        beq checkfail
        lda expectedmessage,y
        beq checkdone
        iny
        cmp TL_RESPONSE
        beq checknext
checkfail:
        PrintNullTerm(stringnot)
        ldx #$01
checkdone:
        jsr flushdata
        jsr acceptwait
checknoci:
        stx $a601
        PrintNullTerm(stringavailable)

        cpx #$01
        beq nosoftiec
        // Detect SoftIEC
        PrintNullTerm(stringsoftiec)
        lda $ba
        cmp $df1b
        beq iecinuse
        PrintNullTerm(stringnot)
iecinuse:
        PrintNullTerm(stringselected)
nosoftiec:
        rts

.macro PrintNullTerm(targetstr) {
        ldy #$00
printnext:
        lda targetstr,y
        beq printdone
        jsr $ffd2
        iny
        jmp printnext
printdone:
}

stringnot:
        .text "NOT "
        .byte 0
stringavailable:
        .text "AVAILABLE"
        .byte 13, 0
stringconfigurable:
        .text "CONFIGURABLE"
        .byte 13,0
stringselected:
        .text "SELECTED"
        .byte 13,0

stringuci:
        .text "UCI: "
        .byte 0
stringhyperload:
        .text "HYPERLOAD: "
        .byte 0
stringturbo:
        .text "TURBO: "
        .byte 0
stringsoftiec:
        .text "SOFT IEC: "
        .byte 0

load_newroutine:
        pha
        lda $df1b
        cmp $ba
        bne oldload
        pla
        jsr setup_load
        bne oldload
        jsr do_load
        bne oldload
        rts

oldload:
        pla
        jmp (load_iload)
load_iload:
        .byte 0,0

setup_load:
        ldx #$00
        lda #$05
        sta TL_CMDDAT_ID // TARGET IEC
        lda #$10
        sta TL_CMDDAT_ID // LOAD_SU
        sta TL_CMDDAT_ID // SECONDARY != 0
        stx TL_CMDDAT_ID // VERIFY = 0
        stx TL_CMDDAT_ID // LOAD ADDR = 0 (not used, no relocation)
        stx TL_CMDDAT_ID
        stx TL_CMDDAT_ID // END ADDR = 0 (not used, no relocation)
        stx TL_CMDDAT_ID
        
        ldy #$00
sendnextchar:
        lda ($bb),y
        sta TL_CMDDAT_ID
        iny
        cpy $b7
        bne sendnextchar
sentname:
        jsr executecommand
        bcs setup_load
        lda TL_STATUS
        tax
        jsr acceptwait
        txa
        rts

do_load:
        ldx #$00
        lda #$05
        sta TL_CMDDAT_ID // TARGET IEC
        lda #$11
        sta TL_CMDDAT_ID // LOAD_EX
        lda #$10
        sta TL_CMDDAT_ID // SECONDARY != 0
        stx TL_CMDDAT_ID // VERIFY = 0
        jsr executecommand
        lda TL_STATUS
        sta statuscode
        lda TL_STATUS
        sta $ae
        lda TL_STATUS
        sta $af
        jsr flushstatus
        jsr flushdata
        jsr acceptwait
        lda statuscode
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

checknumstatusok:
        lda TL_STATUS
        sta statuscode
        jsr flushstatus
        lda statuscode
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

executecommand:
        lda #$01
        sta TL_CTRLSTATUS
        jsr waitidle
        rts

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

statuscode:
        .byte 0,0

expectedmessage:
        .text "SOFTWARE IEC TARGET"
        .byte 0

basicstrap:

        .segment BasicStrap
        * = $9f00
gobasic:
        lda #$93
        jsr $ffd2
        dec $2b
        lda $2b
        sta $0281
        lda $2c
        sta $0282
        lda #$00
        sta $0283
        lda #$a0
        sta $0284
        ldy #$00
copykeys:
        lda keypresses,y
        sta $0277,y
        iny
        cpy #$04
        bne copykeys
        sty $c6
        lda $d021
        sta $0286
        lda #$37
        sta $01
        jsr $e453
        jsr $e3e0
        ldx #$fb
        txs
        lda #$00
        jsr SETMSG
        jsr $a68e
        jsr $a663
        jmp $a52d

keypresses:
        .byte $47, $cf, $30, $0d
