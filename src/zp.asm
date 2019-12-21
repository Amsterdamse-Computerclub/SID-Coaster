#importonce

/*
Zeropage constants

De 6510 heeft dat alle geheugenaddressen van 0-255 ($00-$ff) sneller
toegankelijk zijn dan de rest, waardoor veel gebruikte globale vars hier
geplaatst zijn.

Alle globale constanten zijn hier gedocumenteerd en allemaal geprefixt met zp_,
om dit duidelijker aan te geven.
*/

// 0-1 gereserveerd voor C64 hardware, niet aanpassen!
.const zp_banks = 1

/** Deflake player constants. gegenereerd, dus niet aanpassen! */
// voice 1
.const zp_dfl_base = 4
.const zp_dfl_v1freq_lo  = zp_dfl_base + 0
.const zp_dfl_v1freq_hi  = zp_dfl_base + 1
.const zp_dfl_v1pulse_lo = zp_dfl_base + 2
.const zp_dfl_v1pulse_hi = zp_dfl_base + 3
.const zp_dfl_v1ctl      = zp_dfl_base + 4
.const zp_dfl_v1atkdec   = zp_dfl_base + 5
.const zp_dfl_v1susrel   = zp_dfl_base + 6
// voice 2
.const zp_dfl_v2freq_lo  = zp_dfl_base + 7
.const zp_dfl_v2freq_hi  = zp_dfl_base + 8
.const zp_dfl_v2pulse_lo = zp_dfl_base + 9
.const zp_dfl_v2pulse_hi = zp_dfl_base + 10
.const zp_dfl_v2ctl      = zp_dfl_base + 11
.const zp_dfl_v2atkdec   = zp_dfl_base + 12
.const zp_dfl_v2susrel   = zp_dfl_base + 13
// voice 3
.const zp_dfl_v3freq_lo  = zp_dfl_base + 14
.const zp_dfl_v3freq_hi  = zp_dfl_base + 15
.const zp_dfl_v3pulse_lo = zp_dfl_base + 16
.const zp_dfl_v3pulse_hi = zp_dfl_base + 17
.const zp_dfl_v3ctl      = zp_dfl_base + 18
.const zp_dfl_v3atkdec   = zp_dfl_base + 19
.const zp_dfl_v3susrel   = zp_dfl_base + 20
// filter and global volume
.const zp_dfl_cutoff_lo  = zp_dfl_base + 21
.const zp_dfl_cutoff_hi  = zp_dfl_base + 22
.const zp_dfl_resctl     = zp_dfl_base + 23
.const zp_dfl_filter     = zp_dfl_base + 24
