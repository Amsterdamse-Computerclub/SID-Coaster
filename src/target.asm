#import "sprite.asm"

.const target_start = $5000


target_spawn:
    /* TARGET INIT */
    // Find first unused target
    ldx #0
    lda target_pos,X
!l:
    beq !l+
    inx
    lda target_pos,X
    jmp !l-
!l:
    txa
    sta zp_target_num

    // Initialize target values
    lda #40
    sta target_pos,X

    /* SPRITE INIT */
    // Set sprite num
    lda zp_target_num
    adc #1
    sta zp_spr_num

    // Set x position
    lda #255
    sta zp_spr_pos_low
    lda #1
    sta zp_spr_pos_up
    jsr spr_set_pos_x

    // Set y position
    lda #line_y_pos
    sta zp_spr_pos_low
    jsr spr_set_pos_y

    //Set shape
    lda #spr_ptr(avatar)
    sta spr_shape,X

    // Enable sprite
    jsr spr_enable

    // Set color
    lda #WHITE
    sta spr_col,X
    rts


target_kill:
    lda zp_target_num
    sta zp_spr_num
    jsr spr_disable
    rts


target_step:
    ldx #7
    lda target_pos,X
!l:
    beq target_step_end
    lda target_pos,X
    beq !l+
    sbc 1
    sta target_pos,X
    txa
    sta zp_spr_num
    lda #8
    sta zp_spr_pos_low
    jsr spr_move_left
!l:
    dex
    jmp !l-
target_step_end:
    txa
    sta zp_target_num
    rts


*=target_start
// Target pos
target_pos:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

// Target type
target_type:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
