module topmod (clk,rst_n);
input clk,rst_n;
wire selpc,pcadd_en,rsel,T0,T1,T2,T3;
wire [7:0] src1,src2,pcincr,pc,addout,dataout_mem,regfile_in,aluout;
wire [255:0] regfile;
wire [4:0] addsel;
wire [5:0] loadsel;
wire write,read;
wire [31:0] instr,regloads;

pcmux pcmuxtop(.pcincr1(8'b1), .pcsrc1(src1), .selpc(selpc), .pcincr(pcincr));
//
pcadder pcaddertop(.clk(clk),.rst_n(rst_n),.pc(pc),.pcincr(pcincr),.pcadd_en(pcadd_en),.pcout(pc));
//
addressmux addressmuxtop(.addsel(addsel),.regfile(regfile),.addout(addout));
//
loaddec loaddec(.loadsel(loadsel),.regloads(regloads));
//
alusrc1mux alusrc1muxtop(.src1sel(instr[5:0]), .regfile(regfile), .instr(instr[15:8]), .dataout_mem(dataout_mem),
.srcout(src1));
//
alusrc2mux alusrc2muxtop(.src2sel(instr[13:8]), .regfile(regfile), .srcout(src2));
//
regfile regfiletop(.clk(clk), .rst_n(rst_n), .regloads(regloads), .regfile_out(regfile), .regfile_in(regfile_in));
//
inregmux inregmuxtop(.rsel(rsel),.inmem(dataout_mem),.inalu(aluout),.regfile_in(regfile_in));
//
alu alutop(.src1(src1),.src2(src2),.alu_out(aluout),.opcode(instr[29:24]));
//
instrmem instrmemtop(.instr(instr),.clk(clk),.pc(pc),.rst_n(rst_n));
//
datamem datamemtop(.clk(clk),.rst_n(rst_n),.read(read),.write(write),.datain(src1),.dataout(dataout_mem),.address(addout));
//
srccounter srccountertop(.clk(clk),.rst_n(rst_n),.opcode(instr[29:24]),
.modebits(instr[31:30]),.T0(T0),.T1(T1),.T2(T2),.T3(T3));
//
controlunit controlunittop(.instr(instr),.T0(T0),.T2(T2),.T3(T3),
.modebits(instr[31:30]),.opcode(instr[29:24]),.dataout_mem(dataout_mem[4:0]),
.read(read),.write(write),.selpc(selpc),.pcadd_en(pcadd_en),.addsel(addsel),.loadsel(loadsel),.rsel(rsel));

endmodule //topmod