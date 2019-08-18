module blinkdir (
    input CLK,
    input RST,
    input BTN,
    output reg [3:0] LED
);

//�`���^�����O�h�~��H�ɐڑ�
wire UP;

debounce d0 (.CLK(CLK), .RST(RST), .BTNIN(BTN), .BTNOUT(UP)); 

//BTN���͂̂��т�+1����J�E���^(�ϐ�pat)
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

//�N���b�N����(22�r�b�g)
reg [21:0] cnt22;

always @(posedge CLK) begin
    if (RST)
        cnt22 <= 22'h0;
    else
        cnt22 <= cnt22 + 22'h1; 
end


//�J�E���^�p�C�l�[�u��
wire ledcnten = (cnt22 == 22'h7fffff);

//LED�p�J�E���^(case1�p)
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

//LED�p�J�E���^(case2,3�p)
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

//LED�_�Ńp�^�[��
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