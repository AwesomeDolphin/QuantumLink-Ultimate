        .segment LoadScreenData [outPrg="0007h1.prg", start=$400]
// screen character data
screen:
    *=$0400
	.byte	$05, $20, $5E, $20, $F7, $20, $20, $38, $20, $20, $20, $04, $37, $20, $20, $11, $20, $20, $20, $20, $37, $20, $00, $20, $53, $20, $20, $57, $20, $20, $20, $20, $20, $20, $20, $07, $20, $06, $FE, $AA
	.byte	$47, $20, $63, $20, $66, $20, $20, $51, $20, $20, $20, $04, $1D, $20, $20, $B7, $20, $20, $20, $20, $D0, $20, $EC, $20, $E1, $20, $20, $F9, $20, $20, $20, $20, $18, $20, $20, $68, $20, $53, $8A, $61
	.byte	$43, $47, $1C, $20, $06, $7B, $20, $FC, $20, $20, $20, $00, $77, $61, $20, $F9, $20, $71, $20, $20, $DD, $20, $7C, $20, $B2, $20, $20, $6F, $20, $EF, $20, $20, $84, $68, $20, $1E, $20, $C7, $7C, $34
	.byte	$57, $0A, $0B, $20, $F9, $10, $20, $DD, $20, $0A, $20, $EB, $E2, $FA, $20, $BF, $20, $A8, $20, $20, $79, $20, $9B, $46, $AC, $20, $20, $F2, $20, $30, $20, $20, $4A, $0B, $20, $A2, $20, $7E, $DA, $C2
	.byte	$14, $4B, $3D, $20, $38, $B3, $20, $C1, $20, $EC, $20, $CA, $30, $6B, $20, $B4, $F8, $7E, $20, $20, $4E, $20, $11, $98, $35, $20, $20, $11, $20, $02, $20, $20, $C0, $40, $20, $C0, $20, $E6, $DE, $3B
	.byte	$6D, $0D, $A9, $20, $7B, $A4, $20, $DE, $20, $2D, $73, $97, $9D, $79, $20, $7E, $55, $B4, $20, $20, $AD, $20, $28, $F5, $07, $20, $20, $C1, $20, $97, $20, $20, $88, $E8, $20, $32, $20, $8B, $3C, $9C
	.byte	$02, $51, $CE, $20, $A4, $34, $20, $12, $20, $FC, $44, $29, $83, $C2, $20, $38, $49, $59, $20, $20, $4E, $20, $ED, $BA, $C9, $20, $20, $DD, $20, $7D, $20, $20, $73, $D3, $20, $DE, $20, $BA, $51, $0E
	.byte	$44, $42, $D4, $20, $13, $91, $20, $9C, $20, $D8, $FE, $EE, $EB, $B1, $20, $A0, $E0, $79, $20, $20, $52, $20, $DC, $D7, $40, $20, $20, $31, $20, $E6, $20, $20, $77, $17, $20, $35, $20, $55, $38, $A0
	.byte	$4E, $45, $79, $20, $26, $DC, $20, $DD, $20, $23, $9C, $20, $BD, $8C, $20, $74, $B7, $61, $20, $20, $AB, $20, $3E, $7C, $9E, $20, $20, $AF, $20, $6B, $20, $20, $5F, $7D, $20, $9C, $20, $7A, $CF, $6C
	.byte	$20, $4F, $20, $20, $B2, $20, $20, $1E, $20, $61, $33, $20, $B7, $7B, $20, $AC, $00, $DD, $20, $20, $EF, $20, $20, $34, $AD, $20, $20, $20, $20, $2C, $20, $20, $34, $20, $20, $DC, $20, $20, $13, $72
	.byte	$20, $50, $20, $20, $E3, $20, $20, $90, $20, $FB, $7C, $20, $AA, $6F, $20, $A6, $20, $E9, $20, $20, $79, $20, $20, $6B, $DC, $20, $20, $20, $20, $FC, $20, $20, $9C, $20, $20, $5B, $20, $20, $BA, $42
	.byte	$20, $52, $20, $20, $12, $20, $20, $9B, $20, $C8, $7C, $F2, $77, $DB, $20, $A6, $20, $3A, $20, $20, $6A, $20, $92, $9F, $20, $20, $20, $13, $20, $81, $20, $20, $95, $E1, $20, $E6, $20, $D1, $1E, $C0
	.byte	$48, $5A, $20, $20, $20, $07, $20, $09, $20, $D6, $F8, $1A, $20, $E5, $20, $42, $20, $C1, $20, $20, $20, $20, $65, $9C, $20, $20, $20, $2D, $20, $33, $20, $20, $49, $13, $20, $51, $20, $6F, $D6, $9A
	.byte	$4C, $4C, $20, $20, $20, $F4, $20, $EA, $20, $A6, $D3, $12, $20, $7C, $20, $20, $6D, $66, $20, $20, $20, $20, $68, $20, $20, $20, $20, $AD, $20, $0C, $20, $20, $19, $3E, $20, $7E, $20, $9C, $26, $B3
	.byte	$54, $20, $20, $20, $20, $AC, $20, $BD, $20, $31, $80, $DA, $20, $20, $20, $20, $90, $EC, $20, $20, $20, $20, $AD, $20, $20, $20, $20, $D7, $20, $20, $20, $20, $FC, $F9, $20, $20, $20, $D8, $20, $1C
	.byte	$49, $20, $20, $20, $20, $5F, $20, $20, $20, $89, $76, $FC, $20, $20, $20, $20, $80, $42, $20, $20, $20, $20, $A3, $20, $20, $20, $20, $3B, $20, $20, $20, $20, $AC, $A1, $20, $20, $20, $1D, $20, $20
	.byte	$0E, $20, $20, $20, $20, $7B, $20, $20, $20, $ED, $04, $20, $20, $20, $20, $20, $71, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $D6, $20, $20, $20, $20, $20, $FF, $20, $20, $20, $98, $20, $20
	.byte	$20, $20, $20, $20, $20, $CB, $20, $20, $20, $20, $5F, $20, $20, $20, $20, $20, $5A, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $55, $43, $49, $49, $20, $55, $55, $43, $49, $55, $49, $49, $55, $72, $49, $49, $20, $55, $55, $72, $49, $49, $20, $55, $72, $49, $55, $49, $49, $49, $4E, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $42, $20, $42, $42, $20, $42, $6B, $43, $73, $42, $42, $42, $20, $42, $20, $42, $20, $42, $42, $5D, $42, $42, $20, $20, $42, $20, $42, $42, $42, $6B, $74, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $4A, $43, $4D, $4A, $43, $4B, $4B, $20, $4A, $4A, $4A, $4B, $20, $71, $20, $4A, $43, $4B, $4B, $20, $4A, $4A, $43, $4A, $71, $4B, $4A, $4A, $4B, $4B, $4D, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $20, $20, $20, $20, $20, $6C, $62, $20, $6C, $62, $20, $7B, $20, $20, $62, $20, $20, $62, $20, $6C, $62, $20, $6C, $62, $20, $62, $7B, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $20, $20, $20, $20, $20, $E1, $20, $61, $E1, $6F, $20, $61, $20, $E1, $20, $61, $E1, $20, $61, $E1, $20, $61, $E1, $6F, $20, $61, $E1, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $20, $20, $20, $20, $20, $E1, $E2, $7B, $E1, $77, $20, $61, $20, $E1, $20, $61, $E1, $E2, $61, $E1, $20, $61, $E1, $77, $20, $61, $E1, $20, $20, $20, $20, $20, $20, $20, $20, $20
	.byte	$20, $20, $20, $20, $20, $20, $20, $20, $20, $7C, $20, $7E, $7C, $E2, $20, $E2, $7E, $20, $E2, $20, $7C, $20, $7E, $7C, $E2, $20, $7C, $E2, $20, $E2, $7E, $20, $20, $20, $20, $20, $20, $20, $20, $20



        .segment LoadColorData [outPrg="0007h2.prg", start=$d800]
// screen color data
color:
    *=$d800
	.byte	$05, $0E, $05, $0E, $05, $05, $0E, $05, $0E, $0E, $0E, $05, $05, $0E, $0E, $05, $0E, $0E, $0E, $0E, $05, $05, $05, $0E, $05, $0E, $05, $05, $05, $05, $05, $0E, $05, $0E, $0E, $05, $0E, $05, $05, $05
	.byte	$05, $0E, $05, $0E, $05, $05, $0E, $05, $0E, $0E, $0E, $05, $05, $0E, $0E, $05, $0E, $0E, $0E, $0E, $05, $0E, $05, $0E, $05, $0E, $0E, $05, $0E, $05, $0E, $0E, $05, $0E, $0E, $05, $0E, $05, $05, $05
	.byte	$05, $05, $05, $0E, $05, $05, $0E, $05, $0E, $0E, $0E, $05, $05, $05, $0E, $05, $0E, $05, $0E, $0E, $05, $0E, $05, $0E, $05, $0E, $0E, $05, $05, $05, $0E, $0E, $05, $05, $0E, $05, $0E, $05, $05, $05
	.byte	$05, $05, $05, $0E, $05, $05, $0E, $05, $0E, $05, $0E, $05, $05, $05, $0E, $05, $0E, $05, $0E, $0E, $05, $0E, $05, $05, $05, $0E, $0E, $05, $05, $05, $0E, $0E, $05, $05, $0E, $05, $0E, $05, $05, $05
	.byte	$0D, $05, $05, $0E, $05, $05, $0E, $05, $0E, $05, $0E, $0D, $05, $05, $0E, $05, $05, $05, $0E, $0E, $05, $0E, $05, $05, $05, $0E, $0E, $05, $05, $05, $0E, $0E, $05, $05, $0E, $05, $0E, $05, $05, $05
	.byte	$0D, $05, $0D, $0E, $05, $05, $0E, $05, $0E, $05, $05, $0D, $05, $05, $0E, $05, $05, $05, $0E, $0E, $05, $0E, $05, $05, $05, $0E, $0E, $0D, $05, $05, $0E, $0E, $05, $05, $0E, $05, $0E, $05, $05, $05
	.byte	$0D, $05, $0D, $0E, $05, $0D, $0E, $05, $0E, $05, $05, $0D, $05, $05, $0E, $05, $0D, $05, $0E, $0E, $05, $0E, $05, $05, $05, $0E, $0E, $0D, $0E, $05, $0E, $0E, $05, $0D, $0E, $05, $0E, $0D, $05, $05
	.byte	$0D, $05, $0D, $0E, $0D, $0D, $0E, $05, $0E, $05, $05, $01, $05, $05, $0E, $05, $0D, $05, $0E, $0E, $05, $0E, $05, $05, $0D, $0E, $0E, $0D, $0E, $05, $0E, $0E, $05, $0D, $0E, $05, $0E, $0D, $05, $05
	.byte	$01, $0D, $01, $0E, $0D, $01, $0E, $05, $0E, $05, $05, $0E, $0D, $05, $0E, $05, $0D, $05, $05, $05, $0D, $0E, $01, $05, $0D, $0E, $0E, $01, $0E, $05, $0E, $0E, $05, $01, $0E, $05, $0E, $01, $05, $05
	.byte	$05, $0D, $0E, $0E, $0D, $0E, $0E, $0D, $0E, $05, $05, $0E, $0D, $05, $0E, $0D, $01, $05, $0E, $0E, $0D, $0E, $0E, $0D, $0D, $0E, $0E, $0E, $0E, $05, $05, $0E, $05, $0E, $0E, $05, $0E, $0E, $05, $05
	.byte	$05, $0D, $0E, $0E, $0D, $0E, $0E, $0D, $0E, $0D, $05, $0E, $0D, $0D, $0E, $0D, $0E, $05, $0E, $0E, $0D, $0E, $0E, $0D, $01, $0E, $0E, $0E, $0E, $05, $05, $0E, $05, $0E, $0E, $0D, $0E, $0E, $0D, $05
	.byte	$05, $0D, $0E, $0E, $01, $0E, $0E, $0D, $0E, $0D, $05, $05, $01, $0D, $0E, $0D, $0E, $05, $0E, $0E, $01, $0E, $05, $0D, $0E, $0E, $0E, $05, $0E, $05, $05, $0E, $05, $05, $0E, $0D, $0E, $05, $0D, $0D
	.byte	$05, $0D, $0E, $0E, $0E, $05, $0E, $0D, $0E, $0D, $05, $05, $0E, $0D, $0E, $01, $0E, $0D, $0E, $0E, $0E, $0E, $05, $01, $0E, $0E, $0E, $05, $0E, $05, $0E, $0E, $05, $05, $0E, $0D, $0E, $05, $0D, $0D
	.byte	$05, $01, $0E, $0E, $0E, $05, $0E, $0D, $0E, $0D, $0D, $0D, $0E, $01, $0E, $0E, $05, $0D, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $0E, $0E, $05, $0E, $01, $05, $05, $0D, $05, $0E, $01, $0E, $05, $01, $0D
	.byte	$0D, $0E, $0E, $0E, $0E, $05, $0E, $01, $0E, $0D, $0D, $0D, $0E, $0E, $0E, $0E, $0D, $0D, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $0E, $0E, $0D, $0E, $05, $0E, $0E, $0D, $0D, $0E, $0E, $0E, $0D, $0E, $01
	.byte	$0D, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $0E, $0D, $0D, $01, $0E, $0E, $0E, $0E, $0D, $01, $0E, $0E, $0E, $0E, $01, $0E, $0E, $0E, $0E, $0D, $05, $0E, $0E, $0E, $01, $0D, $0E, $0E, $0E, $0D, $0E, $0E
	.byte	$01, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $0E, $01, $0D, $0E, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $01, $05, $05, $05, $05, $05, $01, $05, $05, $05, $01, $0E, $0E
	.byte	$0E, $0E, $0E, $0E, $05, $01, $0E, $0E, $0E, $0E, $01, $0E, $0E, $0E, $0E, $0E, $01, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $05, $05, $05, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0D, $07, $07, $07, $02, $0D, $02, $04, $04, $04, $03, $03, $03, $0E, $0E, $0E, $0A, $0D, $0A, $07, $07, $07, $02, $0D, $04, $04, $04, $03, $03, $03, $0E, $0E, $0D, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0D, $07, $0D, $07, $02, $0D, $02, $04, $04, $04, $03, $03, $03, $0E, $0E, $0E, $0A, $0D, $0A, $07, $07, $07, $02, $0E, $0E, $04, $0E, $03, $03, $03, $0E, $0E, $0D, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0D, $07, $07, $07, $02, $02, $02, $04, $0E, $04, $03, $03, $03, $0E, $0E, $0E, $0A, $0A, $0A, $07, $0E, $07, $02, $02, $04, $04, $04, $03, $03, $03, $0E, $0E, $0D, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0E, $0E, $0E, $0D, $0E, $0E, $05, $05, $0E, $05, $05, $0E, $05, $0E, $0D, $05, $0E, $0D, $05, $0D, $05, $05, $0D, $05, $05, $0E, $05, $05, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $05, $0D, $05, $05, $05, $0D, $05, $0E, $05, $0D, $05, $05, $0D, $05, $05, $0D, $05, $05, $05, $0E, $05, $05, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0D, $0D, $0D, $0D, $0D, $0E, $0D, $0E, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0E, $0D, $0D, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
	.byte	$0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $01, $0E, $01, $01, $01, $0E, $01, $01, $0D, $01, $0D, $01, $0D, $01, $01, $01, $0D, $01, $01, $0E, $01, $01, $0D, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E