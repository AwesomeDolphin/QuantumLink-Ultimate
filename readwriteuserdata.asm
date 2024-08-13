       .encoding "petscii_upper"

        .label SETLFS = $FFBA
        .label SETNAM = $FFBD
        .label OPEN = $FFC0
        .label CLOSE = $FFC3
        .label CHKIN = $FFC6
        .label CHKOUT = $FFC9
        .label CLRCHN = $FFCC
        .label CHRIN = $FFCF
        .label CHROUT = $FFD2
        .label LOAD = $FFD5
        .label SAVE = $FFD8
        .label SETMSG = $FF8D

        
        .segment Q9903H1 [outPrg="9903h1.prg", start=$6000]
                .segmentout [segments="UserManagerAccess"]
                
        .segmentdef UserManagerAccess [min=$6000, max=$63ff]

        .segment UserManagerAccess
        * = $6000
writeentry:
        jmp writecode
readentry:
        jmp readcode
readoldcode:
        // Pass in drive number as A (780)
        pha
        tax
        lda #$06
        tay
        jsr SETLFS
        lda #$1
        ldx #<directchan
        ldy #>directchan
        jsr SETNAM
        jsr OPEN
        bcs error1
        jsr CLRCHN
        pla
        tax
        lda #$0f
        tay
        jsr SETLFS
        lda #uname_end-uname
        ldx #<uname
        ldy #>uname
        jsr SETNAM
        jsr OPEN
        bcs error2
        jsr CLRCHN
        
        ldx #$06
        jsr CHKIN

        ldy #$00
readsector:
        jsr CHRIN
        sta $c000,y
        iny
        bne readsector

        lda #$0f
        jsr CLOSE
        lda #$06
        jsr CLOSE

        jsr CLRCHN

        ldx #$6e
        ldy #$00
decrypt:
        txa
        eor $c000,y
        sta $c000,y
        inx
        iny
        bne decrypt

        lda #$00
        rts
error1:
        pla
error2:
        lda #$01
        rts

readcode:
        lda $0328
        sta readrestorelow+1
        lda #$80
        sta $0328
        lda $0329
        sta readrestorehigh+1
        lda #$e6
        sta $0329
        lda #$02
        ldx $ba
        ldy #$02
        jsr SETLFS
        lda #$08
        ldx #<loadfilename
        ldy #>loadfilename
        jsr SETNAM
        lda #$00
        jsr LOAD
readrestorelow:
        lda #$00
        sta $0328
readrestorehigh:
        lda #$00
        sta $0329
        lda #$00
        rts

writecode:
        lda $0328
        sta writerestorelow+1
        lda #$80
        sta $0328
        lda $0329
        sta writerestorehigh+1
        lda #$e6
        sta $0329
        lda #$02
        ldx $ba
        ldy #$02
        jsr SETLFS
        lda #$0b
        ldx #<savefilename
        ldy #>savefilename
        jsr SETNAM
        lda #$00
        sta $fb
        lda #$12
        sta $fc
        lda #$fb
        ldx #$fc
        ldy #$12
        jsr SAVE

        lda #$0f
        ldx $ba
        ldy #$0f
        jsr SETLFS
        lda #$00
        jsr SETNAM
        jsr OPEN
        ldx #$0f
        jsr CHKOUT
        ldy #$00
sendcommand:
        lda initializecommand,y
        jsr CHROUT
        iny
        cpy #$03
        bne sendcommand
        jsr CLRCHN
        lda #$0f
        jsr CLOSE

writerestorelow:
        lda #$00
        sta $0328
writerestorehigh:
        lda #$00
        sta $0329

        lda #$00
        rts

loadfilename:
        .text "USERDATA"
savefilename:
        .text "@0:USERDATA"
initializecommand:
        .text "I0:"
directchan:
        .text "#"
uname:  .text "U1: 6 0 18 15"
uname_end: