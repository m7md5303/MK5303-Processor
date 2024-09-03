module pcadder (clk,rst_n,pc,pcincr,pcadd_en,pcout);
input clk,rst_n;
input [7:0] pc,pcincr;
input pcadd_en;
output [7:0] pcout;
reg [7:0] pcout_tmp;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        pcout_tmp<=0;
    end
        else if(pcadd_en)begin
            pcout_tmp<=pc+pcincr;
        end
    end
assign pcout = pcout_tmp;
endmodule //pcadder