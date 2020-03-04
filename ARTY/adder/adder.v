`include "2bitadder.v"

module adder(
    input clk,
    input [3:0]sw,
    output reg [3:0]led
);


reg [4:2]ld;

adder_2bit ad2(sw[0], sw[1], sw[2], sw[3], ld[2], ld[3], ld[4]);

always @* begin
case (ld[2])
    0: led[0] = 0;
    1: led[0] = 1;
    default: led[0] = 0;
endcase

case (ld[3])
    0: led[1] = 0;
    1: led[1] = 1;
    default: led[1] = 0;
endcase

case (ld[4])
    0: led[2] = 0;
    1: led[2] = 1;
    default: led[2] = 0;
endcase

end

endmodule