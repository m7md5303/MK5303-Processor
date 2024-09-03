module instrmem (instr,clk,pc,rst_n);
input clk,rst_n;
input [7:0] pc;
output [31:0] instr;
reg [31:0] instr_tmp;
reg [31:0] instrmem [255:0];
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        instr_tmp<=0;
    end
    else begin
        instr_tmp<=instrmem[pc];
    end
end
assign instr = instr_tmp;
endmodule //instrmem