module regfile (
  input clk,
  input reg_wire,
  input [4:0] read_register1, read_register2, read_register3,
  input [63:0] write_data,
  output [63:0] read_data1, read_data2
);

  always @ ( posedge clk ) begin
    
  end
endmodule //regfile
