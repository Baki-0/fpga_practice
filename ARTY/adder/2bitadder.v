`include "fulladder.v"

module adder_2bit(
    a0, a1, b0, b1, s0, s1, c2 
);

input a0, a1, b0, b1;
output s0, s1, c2;

wire c1;

halfadder HA1(a0, b0, s0, c1);
fulladder FA1(a1, b1, c1, s1, c2);

endmodule
