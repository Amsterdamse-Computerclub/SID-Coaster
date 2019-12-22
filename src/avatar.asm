#import "zp.asm"
#import "sprite.asm"

init_avatar:
    // Set sprite num
    lda #0
    sta zp_spr_num

    // Set x position
    lda #75
    sta zp_spr_pos_low
    lda #0
    sta zp_spr_pos_up
    jsr spr_set_pos_x

    // Set y position
    lda #line_y_pos
    sta zp_spr_pos_low
    jsr spr_set_pos_y

    //Set shape
    lda #spr_ptr(avatar)
    sta spr_shape

    // Enable sprite
    jsr spr_enable

    // Set color
    lda #WHITE
    sta spr_col
    rts


*=$3800
.align 64
avatar:
    .byte %00000000,%00000000,%00000000
    .byte %00000000,%00000000,%00000000
    .byte %00000000,%00000000,%00000000
    .byte %00000110,%00000000,%01100000
    .byte %00000110,%00000000,%01100000
    .byte %00000001,%10000001,%10000000
    .byte %00000001,%10000001,%10000000
    .byte %00000111,%11111111,%11100000
    .byte %00000111,%11111111,%11100000
    .byte %00011110,%01111110,%01111000
    .byte %00011110,%01111110,%01111000
    .byte %01111111,%11111111,%11111110
    .byte %01111111,%11111111,%11111110
    .byte %01100111,%11111111,%11100110
    .byte %01100111,%11111111,%11100110
    .byte %01100110,%00000000,%01100110
    .byte %01100110,%00000000,%01100110
    .byte %00000001,%11100111,%10000000
    .byte %00000001,%11100111,%10000000
    .byte %00000000,%00000000,%00000000
    .byte %00000000,%00000000,%00000000
