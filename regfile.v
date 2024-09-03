module regfile (clk, rst_n, regloads, regfile_out, regfile_in);
input clk,rst_n;
input [31:0] regloads;
input [7:0] regfile_in;
output [255:0] regfile_out;
reg [7:0] regfile [31:0];
always @(posedge clk) begin
        case (regloads)
        32'b00000000000000000000000000000001: regfile[0]<=regfile_in;
        32'b00000000000000000000000000000010: regfile[1]<=regfile_in;
        32'b00000000000000000000000000000100: regfile[2]<=regfile_in;
        32'b00000000000000000000000000001000: regfile[3]<=regfile_in;
        32'b00000000000000000000000000010000: regfile[4]<=regfile_in;
        32'b00000000000000000000000000100000: regfile[5]<=regfile_in;
        32'b00000000000000000000000001000000: regfile[6]<=regfile_in;
        32'b00000000000000000000000010000000: regfile[7]<=regfile_in;
        32'b00000000000000000000000100000000: regfile[8]<=regfile_in;
        32'b00000000000000000000001000000000: regfile[9]<=regfile_in;
        32'b00000000000000000000010000000000: regfile[10]<=regfile_in;
        32'b00000000000000000000100000000000: regfile[11]<=regfile_in;
        32'b00000000000000000001000000000000: regfile[12]<=regfile_in;
        32'b00000000000000000010000000000000: regfile[13]<=regfile_in;
        32'b00000000000000000100000000000000: regfile[14]<=regfile_in;
        32'b00000000000000001000000000000000: regfile[15]<=regfile_in;
        32'b00000000000000010000000000000000: regfile[16]<=regfile_in;
        32'b00000000000000100000000000000000: regfile[17]<=regfile_in;
        32'b00000000000001000000000000000000: regfile[18]<=regfile_in;
        32'b00000000000010000000000000000000: regfile[19]<=regfile_in;
        32'b00000000000100000000000000000000: regfile[20]<=regfile_in;
        32'b00000000001000000000000000000000: regfile[21]<=regfile_in;
        32'b00000000010000000000000000000000: regfile[22]<=regfile_in;
        32'b00000000100000000000000000000000: regfile[23]<=regfile_in;
        32'b00000001000000000000000000000000: regfile[24]<=regfile_in;
        32'b00000010000000000000000000000000: regfile[25]<=regfile_in;
        32'b00000100000000000000000000000000: regfile[26]<=regfile_in;
        32'b00001000000000000000000000000000: regfile[27]<=regfile_in;
        32'b00010000000000000000000000000000: regfile[28]<=regfile_in;   
        32'b00100000000000000000000000000000: regfile[29]<=regfile_in;
        32'b01000000000000000000000000000000: regfile[30]<=regfile_in;
        32'b10000000000000000000000000000000: regfile[31]<=regfile_in;
        default:regfile[31]<=regfile_in;
        endcase  
end

assign regfile_out = (!rst_n) ? 0 : {regfile[31],regfile[30],regfile[29],regfile[28],regfile[27],regfile[26],regfile[25],regfile[24],
regfile[23],regfile[22],regfile[21],regfile[20],regfile[19],regfile[18],regfile[17],regfile[16],regfile[15],regfile[14],
regfile[13],regfile[12],regfile[11],regfile[10],regfile[9],regfile[8],regfile[7],regfile[6],regfile[5],regfile[4],
regfile[3],regfile[2],regfile[1],regfile[0]};


endmodule //regfile