module blinkdir (
    input CLK,
    input RST,
    input BTN,
    output reg [3:0] LED
);

//チャタリング防止回路に接続
wire UP;

debounce d0 (.CLK(CLK), .RST(RST), .BTNIN(BTN), .BTNOUT(UP)); 

//BTN入力のたびに+1するカウンタ(変数pat)
reg [1:0] pat ;

always @(posedge CLK) begin
    if (RST)
        pat <= 2'h0;
    else if (UP)
        if (pat == 2'h2)
            pat <= 2'h0;
        else
            pat <= pat + 2'h1;
end

//クロック分周(22ビット)
reg [21:0] cnt22;

always @(posedge CLK) begin
    if (RST)
        cnt22 <= 22'h0;
    else
        cnt22 <= cnt22 + 22'h1; 
end


//カウンタ用イネーブル
wire ledcnten = (cnt22 == 22'h7fffff);

//LED用カウンタ(case1用)
reg [2:0] cnt3;

always @(posedge CLK) begin
    if (RST)
        cnt3 <= 3'h0;
    else if (ledcnten)
        if (cnt3==3'd5)
            cnt3 <= 3'h0;
        else
            cnt3 <= cnt3 + 3'h1;
end

//LED用カウンタ(case2,3用)
reg [2:0] cnt4;

always @(posedge CLK) begin
    if (RST)
        cnt4 <= 3'h0;
    else if (ledcnten)
        if (cnt4==3'd3)
            cnt4 <= 3'h0;
        else
            cnt4 <= cnt4 + 3'h1;
end

//LED点滅パターン
always @* begin
    case (pat)

        2'h0: case (cnt3)
            3'd0: LED = 4'b0001;
            3'd1: LED = 4'b0010;
            3'd2: LED = 4'b0100;
            3'd3: LED = 4'b1000;
            3'd4: LED = 4'b0100;
            3'd5: LED = 4'b0010;
            default: LED = 4'b0000;
        endcase

        2'h1: case (cnt4)
            3'd0: LED = 4'b0001;
            3'd1: LED = 4'b0010;
            3'd2: LED = 4'b0100;
            3'd3: LED = 4'b1000;
            default: LED = 4'b0000;
        endcase

        2'h2: case (cnt4)
            3'd0: LED = 4'b1000;
            3'd1: LED = 4'b0100;
            3'd2: LED = 4'b0010;
            3'd3: LED = 4'b0001;
            default: LED = 4'b0000;
        endcase

        default: LED = 4'b0000;
    endcase
end

endmodule