#import "zp.asm"

// --- Music interupt ---
// TODO: doc string
irq_top:
	pha
	txa
	pha
	tya
	pha

	inc $d020
	jsr music.play
	dec $d020

	// demp de percussie als de joystick ingedrukt is
	lda $dc00
	and #%10000
	bne !l+

	inc screen
	lda #0
	sta zp_dfl_v2ctl

!l:

	jsr col_scroll

	pla
	tay
	pla
	tax
	pla
irq_dummy:
	asl $d019
	rti


// --- Color scrolling ---
// TODO: doc string
col_scroll:
	// push new color at end
	ldx col_index
	lda colors, x
	sta colram + line_offset + 40 - 1

	// move left
	ldx #0
	ldy #40
!l:
	lda colram + line_offset + 1, x
	sta colram + line_offset, x
	inx
	dey
	bne !l-

	// col_index = (col_index + 1) % 32
	inc col_index
	lda col_index
	and #31
	sta col_index

	rts

col_index:
	.byte 0
colors:
	.byte 13, 13, 2, 2, 11, 11, 3, 3, 14, 14, 15, 15, 6, 6, 8, 8, 10, 10, 5, 5, 1, 1, 9, 9, 0, 0, 12, 12, 7, 7, 4, 4

