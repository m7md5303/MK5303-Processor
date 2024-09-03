module alusrc1mux (src1sel, regfile, instr, dataout_mem,srcout);
input [5:0] src1sel;
input [255:0] regfile;
input [7:0] instr,dataout_mem;
output reg [7:0] srcout;
always@(*) begin
case (src1sel)
    0: srcout = regfile[7:0];
    1: srcout = regfile[15:8]; 
    2: srcout = regfile[23:16]; 
    3: srcout = regfile[31:24]; 
    4: srcout = regfile[39:32]; 
    5: srcout = regfile[47:40]; 
    6: srcout = regfile[55:48]; 
    7: srcout = regfile[63:56]; 
    8: srcout = regfile[71:64]; 
    9: srcout = regfile[79:72]; 
    10: srcout = regfile[87:80]; 
    11: srcout = regfile[95:88]; 
    12: srcout = regfile[103:96]; 
    13: srcout = regfile[111:104]; 
    14: srcout = regfile[119:112]; 
    15: srcout = regfile[127:120]; 
    16: srcout = regfile[135:128]; 
    17: srcout = regfile[143:136]; 
    18: srcout = regfile[151:144]; 
    19: srcout = regfile[159:152]; 
    20: srcout = regfile[167:160]; 
    21: srcout = regfile[175:168]; 
    22: srcout = regfile[183:176]; 
    23: srcout = regfile[191:184]; 
    24: srcout = regfile[199:192]; 
    25: srcout = regfile[207:200]; 
    26: srcout = regfile[215:208]; 
    27: srcout = regfile[223:216]; 
    28: srcout = regfile[231:224]; 
    29: srcout = regfile[239:232]; 
    30: srcout = regfile[247:240]; 
    31: srcout = regfile[255:248]; 
    32: srcout = dataout_mem;
    33: srcout = instr;
    default srcout=0;
endcase
end
endmodule 