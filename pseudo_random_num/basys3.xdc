## Clock (not used for static display, but you may want it later)
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports {clk}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
## SW[3:0] — Slide Switches 0 to 7
set_property PACKAGE_PIN V17 [get_ports {seed[0]}]
set_property PACKAGE_PIN V16 [get_ports {seed[1]}]
set_property PACKAGE_PIN W16 [get_ports {seed[2]}]
set_property PACKAGE_PIN W17 [get_ports {seed[3]}]
set_property PACKAGE_PIN W15 [get_ports {seed[4]}]
set_property PACKAGE_PIN V15 [get_ports {seed[5]}]
set_property PACKAGE_PIN W14 [get_ports {seed[6]}]
set_property PACKAGE_PIN W13 [get_ports {seed[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seed[*]}]

## seg[6:0] — Seven Segment Segments a–g
set_property PACKAGE_PIN W7  [get_ports {seg[6]}]  ;# Segment a
set_property PACKAGE_PIN W6  [get_ports {seg[5]}]  ;# Segment b
set_property PACKAGE_PIN U8  [get_ports {seg[4]}]  ;# Segment c
set_property PACKAGE_PIN V8  [get_ports {seg[3]}]  ;# Segment d
set_property PACKAGE_PIN U5  [get_ports {seg[2]}]  ;# Segment e
set_property PACKAGE_PIN V5  [get_ports {seg[1]}]  ;# Segment f
set_property PACKAGE_PIN U7  [get_ports {seg[0]}]  ;# Segment g
set_property PACKAGE_PIN V7  [get_ports {dp}]  ;# Decimal point (DP)
set_property IOSTANDARD LVCMOS33 [get_ports {dp}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

## an[3:0] — Seven Segment Anode Control (active-low)
set_property PACKAGE_PIN U2  [get_ports {an[0]}]   ;# Rightmost digit
set_property PACKAGE_PIN U4  [get_ports {an[1]}]
set_property PACKAGE_PIN V4  [get_ports {an[2]}]
set_property PACKAGE_PIN W4  [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports {rst}]
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {set}]
