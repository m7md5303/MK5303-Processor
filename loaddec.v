module loaddec (loadsel, regloads);
input [5:0] loadsel;
output reg [31:0] regloads;
always@(*) begin
case (loadsel)
    0: regloads =  32'b00000000000000000000000000000001;
    1: regloads =  32'b00000000000000000000000000000010; 
    2: regloads =  32'b00000000000000000000000000000100;
    3: regloads =  32'b00000000000000000000000000001000;
    4: regloads =  32'b00000000000000000000000000010000;
    5: regloads =  32'b00000000000000000000000000100000;
    6: regloads =  32'b00000000000000000000000001000000;
    7: regloads =  32'b00000000000000000000000010000000;
    8: regloads =  32'b00000000000000000000000100000000;
    9: regloads =  32'b00000000000000000000001000000000;
    10: regloads = 32'b00000000000000000000010000000000;
    11: regloads = 32'b00000000000000000000100000000000;
    12: regloads = 32'b00000000000000000001000000000000;
    13: regloads = 32'b00000000000000000010000000000000;
    14: regloads = 32'b00000000000000000100000000000000;
    15: regloads = 32'b00000000000000001000000000000000;
    16: regloads = 32'b00000000000000010000000000000000;
    17: regloads = 32'b00000000000000100000000000000000;
    18: regloads = 32'b00000000000001000000000000000000;
    19: regloads = 32'b00000000000010000000000000000000;
    20: regloads = 32'b00000000000100000000000000000000;
    21: regloads = 32'b00000000001000000000000000000000;
    22: regloads = 32'b00000000010000000000000000000000;
    23: regloads = 32'b00000000100000000000000000000000;
    24: regloads = 32'b00000001000000000000000000000000;
    25: regloads = 32'b00000010000000000000000000000000;
    26: regloads = 32'b00000100000000000000000000000000;
    27: regloads = 32'b00001000000000000000000000000000;
    28: regloads = 32'b00010000000000000000000000000000;
    29: regloads = 32'b00100000000000000000000000000000;
    30: regloads = 32'b01000000000000000000000000000000;
    31: regloads = 32'b10000000000000000000000000000000; 
    default regloads=0;
endcase
end


endmodule //loaddec