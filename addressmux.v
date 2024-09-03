module addressmux (addsel, regfile, addout);
input [4:0] addsel;
input [255:0] regfile  ;
output reg [7:0] addout;
always@(*) begin
case (addsel)
    0: addout = regfile[7:0];
    1: addout = regfile[15:8]; 
    2: addout = regfile[23:16]; 
    3: addout = regfile[31:24]; 
    4: addout = regfile[39:32]; 
    5: addout = regfile[47:40]; 
    6: addout = regfile[55:48]; 
    7: addout = regfile[63:56]; 
    8: addout = regfile[71:64]; 
    9: addout = regfile[79:72]; 
    10: addout = regfile[87:80]; 
    11: addout = regfile[95:88]; 
    12: addout = regfile[103:96]; 
    13: addout = regfile[111:104]; 
    14: addout = regfile[119:112]; 
    15: addout = regfile[127:120]; 
    16: addout = regfile[135:128]; 
    17: addout = regfile[143:136]; 
    18: addout = regfile[151:144]; 
    19: addout = regfile[159:152]; 
    20: addout = regfile[167:160]; 
    21: addout = regfile[175:168]; 
    22: addout = regfile[183:176]; 
    23: addout = regfile[191:184]; 
    24: addout = regfile[199:192]; 
    25: addout = regfile[207:200]; 
    26: addout = regfile[215:208]; 
    27: addout = regfile[223:216]; 
    28: addout = regfile[231:224]; 
    29: addout = regfile[239:232]; 
    30: addout = regfile[247:240]; 
    31: addout = regfile[255:248]; 
    default addout=0;
endcase
end
endmodule //addressmux