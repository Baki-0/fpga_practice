`timescale 1ns / 1ps
`include "regfile.v"

module testbench ();



  initial begin
    $dumpfile("regfile_test.vcd");
    $dumpvars(0, regriletest);
  end

endmodule //testbench
