#importonce

#import "zp.asm"

.const vic             = 0
.const vic_start       = $2000
.const spr_enable_addr = $D015
.const spr_pos_x       = $D000
.const spr_pos_x_up    = $D010
.const spr_pos_y       = $D001
.const spr_shape       = vic_start + $03F8
.const spr_col         = $D027

.const line_y_pos = 178


.function spr_ptr(addr) {
    .return (addr-vic)/64
}


spr_enable:
    clc
    lda #%00000001
    ldx zp_spr_num
!l:
    beq !l+
    rol
    dex
    jmp !l-
!l:
    ora spr_enable_addr
    sta spr_enable_addr
    rts


spr_disable:
    clc
    lda #%11111110
    ldx zp_spr_num
!l:
    beq !l+
    rol
    dex
    jmp !l-
!l:
    and spr_enable_addr
    sta spr_enable_addr
    rts


spr_set_pos_x:
    clc
    lda zp_spr_num
    rol
    tax
    lda zp_spr_pos_low
    sta spr_pos_x,X
    lda zp_spr_pos_up
    beq spr_set_x_up_0
    jmp spr_set_x_up_1

spr_set_x_up_1:
    clc
    lda #%00000001
    ldx zp_spr_num
!l:
    bne !l+
    rol
    dex
    jmp !l-
!l:
    ora spr_pos_x_up
    sta spr_pos_x_up
    rts


spr_set_x_up_0:
    clc
    lda #%11111110
    ldx zp_spr_num
!l:
    bne !l+
    rol
    dex
    jmp !l-
!l:
    and spr_pos_x_up
    sta spr_pos_x_up
    rts


spr_set_pos_y:
    clc
    lda zp_spr_num
    rol
    tax
    lda zp_spr_pos_low
    sta spr_pos_y,X
    rts


spr_move_left:
    clc
    lda zp_spr_num
    rol
    tax
    lda spr_pos_x,X
    sec
    sbc zp_spr_pos_low
    sta spr_pos_x,X
    bcs spr_move_left_end
    clc
    lda #%11111110
    ldx zp_spr_num
!l:
    beq spr_move_left_store_up
    rol
    dex
spr_move_left_store_up:
    and spr_pos_x_up
    sta spr_pos_x_up
spr_move_left_end:

    rts
