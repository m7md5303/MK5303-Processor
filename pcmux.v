module pcmux (pcincr1, pcsrc1, selpc, pcincr);
input  selpc;
input  [7:0] pcincr1, pcsrc1;
output [7:0] pcincr;
reg [7:0] pcincr_tmp;
always @(*) begin
            case (selpc)
                0:pcincr_tmp=pcincr1;
                1:pcincr_tmp=pcsrc1;
                default:pcincr_tmp=pcincr1;
            endcase
end
assign pcincr = pcincr_tmp;
endmodule //pcmux