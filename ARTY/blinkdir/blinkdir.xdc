## Arty constraints file
## chapter: 2
## project: blinkspeed

#Clock signal
## Clock signal
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { CLK }]; #IO_L13P_T2_MRCC_15 Sch=uclk
create_clock -add -name sys_clk_pin -period 83.333 -waveform {0 41.667} [get_ports { CLK }];
#set_property -dict { PACKAGE_PIN R2    IOSTANDARD SSTL135 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_34 Sch=ddr3_clk[200]
#create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000}  [get_ports { CLK100MHZ }];


#Reset
set_property -dict { PACKAGE_PIN H13   IOSTANDARD LVCMOS33 } [get_ports { RST }]; #IO_L20P_T3_A20_15 Sch=btn[3]


#LEDs
set_property PACKAGE_PIN E18  [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]

set_property PACKAGE_PIN F13  [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]

set_property PACKAGE_PIN E13  [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]

set_property PACKAGE_PIN H15 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]

#Buttons
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { BTN}]; #IO_L18N_T2_A23_15 Sch=btn[0]

#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { BTN[1] }]; #IO_L19P_T3_A22_15 Sch=btn[1]

#set_property PACKAGE_PIN B9 [get_ports {BTN[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {BTN[2]}]

##VGAs
#set_property PACKAGE_PIN V15 [get_ports {VGA_R[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[0]}]

#set_property PACKAGE_PIN U16 [get_ports {VGA_R[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[1]}]

#set_property PACKAGE_PIN P14 [get_ports {VGA_R[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[2]}]

#set_property PACKAGE_PIN T11 [get_ports {VGA_R[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[3]}]

#set_property PACKAGE_PIN R12 [get_ports {VGA_G[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[0]}]

#set_property PACKAGE_PIN T14 [get_ports {VGA_G[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[1]}]

#set_property PACKAGE_PIN T15 [get_ports {VGA_G[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[2]}]

#set_property PACKAGE_PIN T16 [get_ports {VGA_G[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[3]}]

#set_property PACKAGE_PIN N15 [get_ports {VGA_B[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[0]}]

#set_property PACKAGE_PIN M16 [get_ports {VGA_B[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[1]}]

#set_property PACKAGE_PIN V17 [get_ports {VGA_B[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[2]}]

#set_property PACKAGE_PIN U18 [get_ports {VGA_B[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[3]}]

#set_property PACKAGE_PIN R17 [get_ports {VGA_HS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_HS}]

#set_property PACKAGE_PIN P17 [get_ports {VGA_VS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_VS}]

##Uart
#set_property PACKAGE_PIN A9  [get_ports {RXD}]
#set_property IOSTANDARD LVCMOS33 [get_ports {RXD}]

#set_property PACKAGE_PIN D10 [get_ports {TXD}]
#set_property IOSTANDARD LVCMOS33 [get_ports {TXD}]

##Switches
#set_property PACKAGE_PIN A8  [get_ports {SW[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]

#set_property PACKAGE_PIN C11 [get_ports {SW[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[1]}]

#set_property PACKAGE_PIN C10 [get_ports {SW[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[2]}]

#set_property PACKAGE_PIN A10 [get_ports {SW[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SW[3]}]
