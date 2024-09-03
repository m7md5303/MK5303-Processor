module alu (src1,src2,alu_out,opcode);
input [7:0] src1,src2;
input [5:0] opcode;
output reg [7:0] alu_out;
always @(*) begin
    case (opcode)
    6'b000000:alu_out=src1+src2;
    6'b000001:alu_out=src1-src2;
    6'b010000:alu_out=src1+1;
    6'b010001:alu_out=src1-1;
    6'b100000:alu_out=src1&src2;
    6'b100001:alu_out=src1|src2;
    6'b100010:alu_out=src1^src2;
    6'b010010:alu_out=~src1;
    6'b001000:alu_out={src2[0],src1[7:1]};
    6'b001001:alu_out={src1[6:0],src2[0]};
    6'b001010:alu_out={src1[0],src1[7:1]};
    6'b001011:alu_out={src1[6:0],src1[7]};
    default:alu_out=0;
    endcase
end
endmodule //alu