module alu(
  input [3:0] alu_code,
  input [63:0] op1,
  input [63:0] op2,

  output reg [63:0] alu_result,
  output zero
);

always @(*)
  case(alu_code)
      4'b0000 : alu_result = op1 & op2;   //AND
      4'b0001 : alu_result = op1 | op2;   //OR
      4'b0010 : alu_result = op1 + op2;   //ADD
      4'b0110 : alu_result = op1 - op2;   //SUB
      default : alu_result = 0;
  endcase

  assign zero = (alu_result == 64'b0);

endmodule
