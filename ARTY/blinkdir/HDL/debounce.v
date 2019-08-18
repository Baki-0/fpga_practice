module debounce (
    input CLK,
    input RST,
    input BTNIN,
    output reg BTNOUT
);

//クロ�?ク�?周
reg [21:0] cnt22;

wire en40hz = (cnt22 == 22'd3125000-1);

always @(posedge CLK) begin
    if (RST)
        cnt22 <= 22'h0;
    else if (en40hz)
        cnt22 <= 22'h0;
    else
        cnt22 <= cnt22 + 22'h1;
end

//スイ�?チ�?�力をFFで受け取る
reg ff1, ff2;

always @(posedge CLK) begin
    if (RST) begin
        ff1 <= 1'b0;
        ff2 <= 1'b0;
    end
    else if (en40hz) begin
        ff2 <= ff1;
        ff1 <= BTNIN;
    end
end

//立ち上がり検�?�
wire temp = ff1 & ~ff2 & en40hz;

always @(posedge CLK) begin
    if (RST)
        BTNOUT <= 1'b0;
    else
        BTNOUT <=temp;
end

endmodule