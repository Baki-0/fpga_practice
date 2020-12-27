`include "regfile.v"

module testbench ();

  reg clk;
  reg reg_wire;
  reg [4:0] read_register1, read_register2, write_register;
  reg [63:0] write_data;
  wire [63:0] read_data1, read_data2;

  regfile regriletest(clk, reg_file, read_register1, read_register2,
                      write_register, write_data, read_data1, read_data2);

  initial begin
    $dumpfile("regfile_test.vcd");
    $dumpvars(0, regriletest);
    $monitor("%h, %h, %h, %h", regriletest.register[1],regriletest.register[2],
            regriletest.read_data1, regriletest.read_data2);
    //$display("register[1]   register[2]   read_data1   read_data2");

    read_register1 <= 1;  read_register2 <= 2;  write_register <= 1;  write_data <= 5;
    reg_wire <= 1;  #10;
    reg_wire <= 0;  #10;

    read_register1 <= 1;  read_register2 <= 2;  write_register <= 2;  write_data <= 6;
    reg_wire <= 1;  #10;
    reg_wire <= 0;  #10;

    read_register1 <= 1;  read_register2 <= 2;  write_register <= 1;  write_data <= 8;
    reg_wire <= 1;  #10;
    reg_wire <= 0;  #10;

    read_register1 <= 0;  read_register2 <= 2;  write_register <= 0;  write_data <= 8;
    reg_wire <= 1;  #10;
    reg_wire <= 0;  #10;

    #200;
    $finish;

  end

  always begin
    clk <= 1; #5; clk <= 0; #5;
  end

endmodule //testbench
