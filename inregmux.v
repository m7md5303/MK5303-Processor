module inregmux (rsel,inmem,inalu,regfile_in);
input rsel;
input [7:0] inmem,inalu;
output [7:0] regfile_in;
assign regfile_in = (rsel) ? inmem : inalu; 
endmodule //inregmux