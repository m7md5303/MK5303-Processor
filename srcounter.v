module srccounter (clk,rst_n,opcode,modebits,T0,T1,T2,T3);
input clk,rst_n;
input [5:0] opcode;
input [1:0] modebits;
output T0,T1,T2,T3;

reg [2:0] srccounter;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        srccounter<=0;
    end
    else begin
        if(srccounter==2&&modebits!=2'b10)begin
            srccounter<=0;
        end
        else if (srccounter==3&&modebits==2'b10&&(opcode==0||opcode==1||opcode==6'b100000||opcode==6'b100000||opcode==6'b100001||opcode==6'b100010||opcode==6'b001000||opcode==6'b001001||opcode==6'b001010||opcode==6'b001011)) begin
            srccounter<=0;
        end
        else if (srccounter==2&&modebits==2'b10&&(opcode==6'b010000||opcode==6'b010001||opcode==6'b010010||opcode==6'b010101||opcode==6'b101010||opcode==6'b110011)) begin
                srccounter<=0;
            end
        else begin
            srccounter<=srccounter+1; 
        end
    end
end
assign T0 = (srccounter==0) ? 1 : 0;
assign T1 = (srccounter==1) ? 1 : 0;
assign T2 = (srccounter==2) ? 1 : 0;
assign T3 = (srccounter==3) ? 1 : 0;
// assign T4 = (srccounter==4) ? 1 : 0;
// assign T5 = (srccounter==5) ? 1 : 0;
// assign T6 = (srccounter==6) ? 1 : 0;
// assign T7 = (srccounter==7) ? 1 : 0;
endmodule //srcounter