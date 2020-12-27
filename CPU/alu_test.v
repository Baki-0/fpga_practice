`timescale 1ns / 1ps
`include "alu.v"

module testbench();
  reg [3:0] alu_code;
  reg [63:0] input_data1;
  reg [63:0] input_data2;
  wire [63:0] alu_result;
  wire zero;

  alu alutest(alu_code, input_data1, input_data2, alu_result, zero);

  initial begin
    $dumpfile("alu_test.vcd");
    $dumpvars(0, alutest);
    $monitor("%b, %b", alu_result, zero);

    input_data1 = 3;  input_data2 = 4;  alu_code = 4'b0000;        //AND
    #10;  input_data1 = 3;  input_data2 = 3;  alu_code = 4'b0010;   //ADD
    #10;  input_data1 = 5;  input_data2 = 5;  alu_code = 4'b0110;   //SUB
    #10;  input_data1 = 3;  input_data2 = 4;  alu_code = 4'b0001;   //OR
    #10;  input_data1 = 3;  input_data2 = 3;  alu_code = 4'b1000;   //default
    #10;  $finish;
  end
endmodule
