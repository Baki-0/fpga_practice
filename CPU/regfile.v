module regfile (
  input clk,
  input reg_wire,
  input [4:0] read_register1, read_register2, write_register,
  input [63:0] write_data,
  output [63:0] read_data1, read_data2
);

  reg [63:0] register [31:0];

  always @ ( posedge clk ) begin
      if(reg_wire)
        register[write_register] <= write_data;
  end

  /*
  if(read_register1 != 0) begin
    assign read_data1 = register[read_register1];
  end else begin
    assign read_data1 = 0;
  end

  if(read_register2 != 0) begin
    assign read_data2 = register[read_register2];
  end else begin
    assign read_data2 = 0;
  end
  */

  assign read_data1 = (read_register1 != 0) ? register[read_register1] : 0;
  assign read_data2 = (read_register2 != 0) ? register[read_register2] : 0;

endmodule //regfile
