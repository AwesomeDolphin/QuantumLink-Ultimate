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

        
        .segment Q0009H2 [outPrg="0009h2.prg", start=$6000]
                .segmentout [segments="UserManagerAccess"]
                
        .segmentdef UserManagerAccess [min=$6000, max=$63ff]

        .segment UserManagerAccess

saveuser:
		* = $6000
writecode:
		php
		sei
		ldx $01
		lda #$34
		sta $01
		lda $d600
		sta $ba
		stx $01
		plp
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

filler:
		* = $60CB
		brk
		brk
		brk
		jsr $EE33
		ldx #$61
		ldy #$24
		jsr $F41B
		lda #$00
		sta $60CC
		jsr $EE6C
		jsr $F424
		jsr $EE0C
		jsr $60FB
		jsr $EE00
		jsr $F427
		lda $60CC
		cmp $1232
		bcc $60DD
		jsr $EE6C
		rts
		ldx #$0A
		stx $CE00
		ldy $60CC
		lda $611A,Y
		tay
		lda $1233,Y
		sta $CE00,X
		dey
		dex
		bne $6107
		lda $60CC
		adc #$01
		sta $60CC
		rts

message1:
		* = $611a
		.byte $0e, $1d, $2c, $3b, $4a, $59, $68, $77, $86, $95, $21, $53

message2:
		* = $6126
		.byte $05, $0c, $05, $03, $14, $20, $15, $13, $05, $12, $20, $0e
		.byte $01, $0d, $05, $20, $14, $0f, $20, $13, $09, $07, $0e, $20
		.byte $0f, $0e, $20, $17, $09, $14, $08, $3a

untouched:
		* = $6146
		lda $1232
		sta $CEB8
		rts
		ldy #$17
		jmp $C530
		ldy #$64
		jsr $C530
		ldy $CE01
		jmp $C530
		ldy #$0D
		jmp $C530
		ldy #$7F
		jsr $C530
		ldy $CE16
		sty $C200
		lda $CE16,Y
		sta $C200,Y
		dey
		bne $616D
		rts
		lda #$00
		sta $0338
		jmp $EE15
		ldx $CEB8
		lda $6119,X
		tax
		ldy #$0A
		sty $CD00
		lda $1229,X
		and #$0F
		clc
		adc #$30
		sta $CD00,Y
		dey
		lda $1229,X
		and #$F0
		clc
		ror
		ror
		ror
		ror
		clc
		adc #$30
		sta $CD00,Y
		dex
		dey
		bne $618B
		ldy #$04
		sty $CE16
		lda $1208,Y
		sta $CE16,Y
		dey
		bne $61B0
		rts
		lda #$01
		sta $1232
		rts
		ldy #$0A
		ldx #$05
		lda $CE16,Y
		sec
		sbc #$30
		sta $6233
		dey
		lda $CE16,Y
		sec
		sbc #$30
		clc
		rol
		rol
		rol
		rol
		adc $6233
		sta $1232,X
		dex
		dey
		bne $61C4
		ldy #$0A
		lda $CE20,Y
		sta $1237,Y
		dey
		bne $61E5
		rts
		brk

message3:
		* = $61f0
		.byte $0f, $1e, $2d, $3c, $4b, $5a, $69, $78, $87

final:
		ldx $1232
		cpx #$0A
		bne $6201
		rts
		inc $1232
		lda $61EF,X
		tax
		ldy #$00
		lda $CE17,Y
		asl
		asl
		asl
		asl
		sta $1233,X
		iny
		lda $CE17,Y
		and #$0F
		eor $1233,X
		sta $1233,X
		inx
		iny
		cpy #$0A
		bne $620A
		lda $CE17,Y
		sta $1233,X
		inx
		iny
		cpy #$14
		bne $6226
		rts
		brk
		ldy #$04
		lda $CE16,Y
		sta $1208,Y
		dey
		bne $6236
		rts
		ldy #$F6
		jmp $C530
		rts
		lda #$FF
		bit.a $00A9
		sta $F380
		rts
		lda #$37
		sta $01
		sei
		lda #$7F
		sta $DD0D
		ldx #$02
		jsr $FFC3
		jsr $62AE
		ldx #$0F
		jsr $FFC9
		lda #$55
		jsr $FFD2
		lda #$3A
		jsr $FFD2
		lda #$0D
		jsr $FFD2
		jsr $FFCC
		ldx #$0F
		jsr $FFC3
		sei
		lda #$7F
		sta $DD0D
		lda #$00
		sta $0800
		inc $6286
		bne $6283
		inc $6287
		beq $62AB
		lda $6287
		cmp #$62
		beq $62A6
		cmp #$62
		beq $62A6
		cmp #$D0
		bne $6283
		lda #$DF
		sta $6287
		inc $6287
		bne $6292
		jmp ($FFFC)
		lda #$00
		jsr $FFBD
		lda #$0F
		ldx #$08
		ldy #$0F
		jsr $FFBA
		jmp $FFC0
		brk