module controlunit (instr,T0,T2,T3,modebits,opcode,dataout_mem,
read,write,selpc,pcadd_en,addsel,loadsel,rsel);
input T0,T2,T3;
input [1:0] modebits;
input [5:0] opcode;
input [4:0] dataout_mem;
input [31:0] instr;
output reg [4:0] addsel;
output reg [5:0] loadsel;
output reg read,write,selpc,pcadd_en,rsel;
//modebits:instr[31:30]
//opcode:instr[29:24]
//dest:instr[23:16]
//src2:instr[15:8]
//src1:instr[7:0]
//
//opcode:controlword[31:26]
//pcsel:controlword[25]
//src1:controlword[24:20]
//src2:controlword[19:15]
//dest:controlword[14:10]
//read:controlword[9]
//write:controlword[8]
//memadd:controlword[7:0]
always@(*)begin
    //pcadd_en
    if(T0)begin
        pcadd_en=1;
    end
    else begin
        pcadd_en=0;
    end
    //selpc
    if(opcode==6'b110011)begin
        selpc=1;
    end
    else begin
        selpc=0;
    end
    //read
    if(opcode==6'b010101)begin
        read=1;
    end
    else if((modebits==1&&T2)||(modebits==2&&T2)||(modebits==2&&T3)&&((opcode==0)||(opcode==1)||(opcode==6'b100000)||(opcode==6'b100001)||(opcode==6'b100010)||(opcode==6'b001000)||(opcode==6'b001001)||(opcode==6'b001010)||(opcode==6'b001011)))begin
        read=1;
    end
    else begin
        read=0;
    end
    //write
    if(opcode==6'b101010)begin
        write=1;
    end
    else begin
        write=0;
    end
    //addsel
    if(modebits==2||modebits==1)begin
        if((T2&&(opcode==6'b000000||opcode==6'b000001||opcode==6'b100000||opcode==6'b100001||opcode==6'b100010||opcode==6'b001000||opcode==6'b001001||opcode==6'b001010||opcode==6'b001011))||(opcode==6'b010101))begin
            addsel=instr[7:0];
        end
        else if(T2&&opcode==6'b101010) begin
            addsel=instr[15:8];
        end
        else if ((T3&&(opcode==6'b000000||opcode==6'b000001||opcode==6'b100000||opcode==6'b100001||opcode==6'b100010||opcode==6'b001000||opcode==6'b001001||opcode==6'b001010||opcode==6'b001011))) begin
            addsel=dataout_mem;
        end
        else begin
            addsel=0;
        end
    end
    else begin
        addsel=0;
    end
    //loadsel
    if(modebits===2'b10&&T2) begin
        loadsel=6'b000100; //predetermined register
    end
    else if (opcode==6'b101010||opcode==6'b110011) begin
        loadsel=64;
    end
    else begin
        loadsel=instr[23:16];
    end
    //rsel
    if((T2&&modebits==2'b10)&&(opcode!=6'b010000&&opcode!=6'b010001&&opcode!=6'b010010&&opcode!=6'b010101))begin
        rsel=1;
    end
    else begin
        rsel=0;
    end
end
endmodule //controlunit