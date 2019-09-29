//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sun Sep 29 14:23:15 2019
//Host        : DESKTOP-FR63RD9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    LED,
    RST,
    RXD,
    TXD);
  input CLK;
  output [3:0]LED;
  input RST;
  input RXD;
  output TXD;

  wire CLK;
  wire [3:0]LED;
  wire RST;
  wire RXD;
  wire TXD;

  design_1 design_1_i
       (.CLK(CLK),
        .LED(LED),
        .RST(RST),
        .RXD(RXD),
        .TXD(TXD));
endmodule
