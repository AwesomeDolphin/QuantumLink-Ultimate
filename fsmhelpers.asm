      .encoding "petscii_upper"

      .label SYSTEM_DRIVE = $02

        .segment Q0004H1 [outPrg="0004h1.prg", start=$ee00]
                .segmentout [segments="Seg004h1"]
                
        .segmentdef Seg004h1 [min=$ee00, max=$f37f]

        .segment Seg004h1

          * = $ee00
          jmp lee98
          jmp $ee9b
          jmp $ee9e
          jmp $eea1
          jmp leea8
          jmp $eeaf
          jmp leee1
          jmp lef07
          jmp lef16
          jmp $c57e
          jmp lefd1
          jmp lef2b
          jmp lefbe
          jmp lefc4
          jmp $f033
          jmp lf056
          jmp $ef78
          jmp lef7a
          jmp lef7b
          jmp lef92
          jmp lefab
          jmp lf074
          jmp lf071
          jmp lf0e0
          jmp lf0f0
          jmp lf139
          jmp lf17d
          jmp lf199
          jmp lf1b1
          jmp lf1f2
          jmp lf221
          jmp lf228
          jmp lf290
          jmp lf28a
          jmp lf294
          jmp lf16f
          jmp $eeb2
          ora ($00,x)
          asl
          .byte $14    //%00010100
          asl $3228,x
          .byte $3c    //%00111100 '<'
          lsr $50
          .byte $5a    //%01011010 'z'
          .byte $64    //%01100100 'd'
          ror $8278
          sty $a096
          tax
          ldy $be,x
          iny
          .byte $d2    //%11010010
          .byte $dc    //%11011100
          inc $f0
          jmp $f2e3
          jmp $f2e6
          jmp $f2ec
          jmp $f350
          jmp $f357
lee98:
          ldy #$00
          bit $0ba0
          bit $16a0
          bit $8fa0
          ldx #$ce
          jmp $f41b
leea8:
             ldy #$4b
          ldx #$f3
          jmp $f41b
leeaf:     lda #$20
          bit $4ca9
          sta leed2
          jsr $f41e
          inx
          stx $eecd
          tya
          and #$0f
          clc
          adc #$01
          cmp $c7f1
          beq leed2
          tya
          and #$f0
          ora #$00
          tay
          jmp $f421
leed2:
             jsr $f421
          jsr $f466
          jsr $f430
          clc
          adc #$01
          jmp $f439
leee1:
         lda #$20
          ldy #$0a
leee5:
         dey
          sta $ce01,y
          bne leee5
          ldy $ceb8
          lda $ca00,y
          sta $ce00
          beq lef06
          tax
          clc
          adc $ee6f,y
          tay
leefc:     lda $ceff,y
          sta $ce00,x
          dey
          dex
          bne leefc
lef06:     rts
lef07:     jsr $c536
          lda #$00
          sta $dc0e
          lda #$34
          sta $01
          jmp $d000
lef16:     ldx #$1f
lef18:     inx
          sec
          sbc #$0a
          bcs lef18
          adc #$3a
          tay
          cpx #$21
          bcc lef2a
          txa
          ora #$10
          tax
          tya
lef2a:     rts
lef2b:     tax
          cpx #$00
          beq lef4f
          ldy #$0b
          sty $cd8f
          dey
lef36:     lda $ef6d,y
          sta $cd8f,y
          dey
          bne lef36
          txa
          jsr lef16
          sty $cd9a
          bcc lef4e
          stx $cd9b
          inc $cd8f
lef4e:     rts
lef4f:     ldy #$10
          sty $cd8f
lef54:     lda $ef5d,y
          sta $cd8f,y
          dey
          bne lef54
          rts
          .byte $54    //%01010100 't'
          php
          ora $20
          bvc lef76
          .byte $0f    //;%00001111
          .byte $07    //;%00000111
          .byte $12    //;%00010010
          ora ($0d,x)
          jsr $0944
          .byte $13    //;%00010011
          .byte $0b    //;%00001011
          .byte $47    //;%01000111 'g'
          ora ($0d,x)
          ora $20
          .byte $44    //;%01000100 'd'
          ora #$13
lef76:     .byte $0b    //;%00001011
          jsr $2418
lef7a:     sec
lef7b:     php
          lda #$ff
          sta $f4ad
          jsr $f457
          lda #$01
          rol
          plp
          ror
          tax
          jsr $f418
          ldx #$00
          jmp $f418
lef92:     jsr lefa5
          ldx #$f3
          ldy #$3b
          jsr $f41b
          jsr lefb5
          jsr $eeaf
          jmp $ee9e
lefa5:     jsr $ef78
          jmp $f424
lefab:     jsr lefa5
          ldx #$f3
          ldy #$2c
          jsr $f41b
lefb5:     jsr lee98
          jsr $f427
          jmp $eeaf
lefbe:     jsr $ee9e
          jmp $eeaf
lefc4:     lda #$17
          pha
          lda #$f0
          pha
          lda #$1a
          ldx #$00
          ldy #$f0
          clc
lefd1:     sta $f013
          pla
          sta $efe6
          pla
          sta $efe8
          stx $eff5
          sty $eff6
          jsr lef7b
          ldx #$ff
          ldy #$ff
          jsr $f41b
          jsr $eeb2
          ldx #$01
leff1:     lda $ca1a,x
          cmp #$00
          bne lf011
          txa
          pha
          stx $ceb8
          jsr $f424
          jsr leea8
          jsr leee1
          jsr lee98
          jsr $f427
          jsr $eeb2
          pla
          tax
lf011:     inx
          cpx #$1a
          bne leff1
          rts
          .byte $1b    //%00011011
          bvc $f05f
          .byte $4f    //%01001111 'o'
          bvc $f069
          eor $20
          eor #$4e
          jsr $4854
          eor $20
          .byte $43    //%01000011 'c'
          eor $52,x
          .byte $52    //%01010010 'r'
          eor $4e
          .byte $54    //%01010100 't'
          jsr $4f52
          .byte $4f    //%01001111 'o'
          eor $ac3a
          clv
          dec.a $00ad
          dec.a $0099
          dex
          lda #$01
          sta $ca1a,y
          lda $ee6f,y
          sta $f04d
          ldy #$00
lf049:     lda $ce01,y
          sta $cf00,y
          iny
          cpy $ce00
          bne lf049
          rts
lf056:     ldy $ceb8
          lda #$00
          sta $ca1a,y
          lda $ee6f,y
          sta $f069
          ldy #$00
          lda #$20
lf068:     sta $cf00,y
          iny
          cpy #$0a
          bne lf068
          rts
lf071:     jsr lf0e0
lf074:     ldx #$03
lf076:     lda $f347,x
          sta $0338,x
          dex
          bpl lf076
          inx
          stx $d015
          jsr $ffcc
          lda #$93
          jsr $ffd2
          lda #$00
          jsr $ffbd
          lda #$0f
          ldx SYSTEM_DRIVE
          ldy #$0f
          jsr $ffba
          jsr $ffc0
          lda #$07
          ldx #$35
          ldy #$03
          jsr $ffbd
          lda #$0e
          ldx SYSTEM_DRIVE
          ldy #$0e
          jsr $ffba
          jsr $ffc0
          jsr $ffcc
          ldx #$0f
          jsr $ffc6
          jsr $ffcf
          cmp #$32
          bcc $f0c3
          lda #$00
          bit $ffa9
          sta $f49a
          jsr $ffcc
          lda #$0e
          jsr $ffc3
          lda #$0f
          jsr $ffc3
          ldy #$fe
          jsr $c530
          lda #$00
          sta $0338
          rts
lf0e0:     lda #$54
          ldy #$4c
          ldx #$4b
          sta $0335
          sty $0336
          stx $0337
          rts
lf0f0:     jsr lef7a
          jsr lf1b9
          sta $f1e3
lf0f9:     lda $f1e2
          cmp $1000
          beq lf12f
          ldy #$0a
          jsr lf1c9
          cmp $ca6c
          beq lf126
          iny
          jsr lf1c9
          bne lf126
          inc $f1e3
          jsr $f424
          jsr leea8
          jsr lf199
          jsr $ee9e
          jsr $f427
          jsr $eeb2
lf126:     jsr lf1cd
          inc $f1e2
          jmp lf0f9
lf12f:     ldx #$f1
          ldy #$e4
          jsr $f41b
          jmp $eeb2
lf139:     lda $cedf
          cmp $f1e3
          beq $f146
          bcc $f146
          lda #$01
          bit.a $00a9
          sta $f49a
          jsr lf1b9
lf14e:     ldy #$0a
          jsr lf1c9
          cmp $ca6c
          beq lf169
          iny
          jsr lf1c9
          bne lf169
          inc $f1e2
          lda $f1e2
          cmp $cedf
          beq lf16f
lf169:     jsr lf1cd
          jmp lf14e
lf16f:     ldy #$06
lf171:     jsr lf1c9
          sta $032f,y
          iny
          cpy #$09
          bne lf171
          rts
lf17d:     ldy #$0a
          jsr lf1c9
          sta $ce01
          sta $ca6c
          ldy #$01
lf18a:     iny
          jsr lf1c9
          sta $ce00,y
          cpy #$05
          bne lf18a
          sty $ce00
          rts
lf199:     ldy #$00
          sty $ce16
          jsr lf1c9
          tay
lf1a2:     jsr lf1c9
          sta $ce0b,y
          inc $ce16
          dey
          cpy #$0b
          bne lf1a2
          rts
lf1b1:     ldy #$09
          jsr lf1c9
          jmp lef2b
lf1b9:     lda #$10
          sta $f1cb
          lda #$01
          sta $f1ca
          lda #$00
          sta $f1e2
          rts
lf1c9:     lda $ffff,y
          rts
lf1cd:     ldy #$00
          jsr lf1c9
          sec
          adc $f1ca
          sta $f1ca
          lda $f1cb
          adc #$00
          sta $f1cb
          rts
          brk
          brk
          ora $2020
          jsr $2020
          .byte $53    //%01010011 's'
          ora #$07
          asl $4f20
          asl $06
lf1f2:     ldx #$08
          stx $ce00
          stx $ce0b
          stx $ce16
lf1fd:     lda $ce1e,x
          sta $ce00,x
          lda $ce26,x
          sta $ce0b,x
          lda $ce16,x
          sta $ce16,x
          dex
          bne lf1fd
          ldx #$03
          stx $ce8f
lf217:     lda $ce2e,x
          sta $ce8f,x
          dex
          bne lf217
          rts
lf221:     lda $ca64
          sta $f49a
          rts
lf228:     ldy $ce16
          sty $f289
          ldx #$00
lf230:     cpx $ce16
          beq lf253
          lda $ce17,x
          cmp #$ff
          beq $f255
          inx
          cpx #$29
          bne lf230
          cpy #$29
          bcc lf253
lf245:     lda $ce16,x
          dex
          beq lf251
          cmp #$20
          beq $f255
          bne lf245
lf251:     ldx #$28
lf253:     sec
          bit $18
          php
          stx $ce16
          jsr lefbe
          lda $f289
          plp
          php
          sbc $ce16
          beq lf287
          sta $f289
          ldx #$01
          ldy $ce16
          plp
          bcs lf273
          iny
lf273:     lda $ce17,y
          sta $ce16,x
          inx
          iny
          dec $f289
          bne lf273
          dex
          stx $ce16
          bne lf228
          rts
lf287:     plp
          rts
          brk
lf28a:     ldx #$16
          ldy #$17
          bne lf294
lf290:     ldx #$11
          ldy #$12
lf294:     lda $ceb8
          beq lf2d6
          stx $f2ca
          sty $f2cd
          jsr $f42d
          sty $f2d8
          stx $f2d9
          jsr lf2d7
          jsr lf2d7
          tax
lf2af:     jsr lf2d7
          sta $ce16
          ldy #$00
lf2b7:     jsr lf2d7
          sta $ce17,y
          iny
          cpy $ce16
          bcc lf2b7
          txa
          pha
          cmp #$01
          beq $f2cc
          lda #$00
          bit.a $00a9
          jsr $f415
          pla
          tax
          dex
          bne lf2af
lf2d6:     rts
lf2d7:     lda $ffff
          inc $f2d8
          bne lf2e2
          inc $f2d9
lf2e2:     rts
lf2e3:     lda #$ff
          bit.a $00a9
          sta $ced4
          rts
lf2ec:     lda $f488
          sta $f313
          lda $f489
          sta $f317
          lda $f48a
          sta $f320
          lda $f48b
          sta $f31a
          lda #$00
          jsr $f463
          tya
          jsr $f463
          inx
          inx
          inx
          sec
          tya
          sbc #$00
          tay
          txa
          sbc #$00
          tax
          cpx #$00
          bcc $f326
          bne lf323
          cpy #$00
          bcc $f326
lf323:     lda #$00
          bit $ffa9
          sta $f49a
          rts
          asl $054d
          .byte $13    //%00010011
          .byte $13    //%00010011
          ora ($07,x)
          ora $20
          lsr $12
          .byte $0f    //%00001111
          ora $203a
          .byte $0b    //%00001011
          eor $0901
          .byte $0c    //%00001100
          jsr $1246
          .byte $0f    //%00001111
          ora $203a
          bit $2c50
          .byte $52    //%01010010 'r'
          .byte $04    //%00000100
          jsr $2020
          jsr $01ad
          dec $9b8d
          .byte $f4    //%11110100
          rts
lf357:     ldy $f4a8
          jsr $f40f
          stx $f367
          sty $f366
          ldy #$09
lf365:     lda $ffff,y
          sta $ce01,y
          dey
          bpl lf365
          lda #$0a
          sta $ce00
          rts
