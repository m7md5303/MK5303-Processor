module datamem (clk,rst_n,read,write,datain,dataout,address);
input clk,rst_n,read,write;
input [7:0] address;
input [7:0] datain;
output [7:0] dataout;
reg [7:0] dataout_tmp;
reg [7:0] datamem [255:0];
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        dataout_tmp<=0;
    end
    else begin
        if(read) begin
        dataout_tmp<=datamem[address];
        end
    end
end
always @(posedge clk ) begin
    if(write)begin
        datamem[address]<=datain;
    end
end
assign dataout = dataout_tmp;
endmodule //datamem