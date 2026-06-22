module Data_Memory(
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] Address,
    input [31:0] WriteData,
    output reg [31:0] Data
);

reg [7:0] D_Mem [63:0];

always @ (negedge reset)
begin

    D_Mem[0] = 8'h00; D_Mem[1] = 8'h00; D_Mem[2] = 8'h00; D_Mem[3] = 8'h00;
    D_Mem[4] = 8'h00; D_Mem[5] = 8'h00; D_Mem[6] = 8'h00; D_Mem[7] = 8'h00;
    D_Mem[8] = 8'h00; D_Mem[9] = 8'h00; D_Mem[10] = 8'd96; D_Mem[11] = 8'h00;
    D_Mem[12] = 8'h00; D_Mem[13] = 8'h00; D_Mem[14] = 8'h00; D_Mem[15] = 8'h00;
    D_Mem[16] = 8'h00; D_Mem[17] = 8'h00; D_Mem[18] = 8'h00; D_Mem[19] = 8'h00;
    D_Mem[20] = 8'h00; D_Mem[21] = 8'h00; D_Mem[22] = 8'h00; D_Mem[23] = 8'h00;
    D_Mem[24] = 8'h00; D_Mem[25] = 8'h00; D_Mem[26] = 8'h00; D_Mem[27] = 8'h00;
    D_Mem[28] = 8'h00; D_Mem[29] = 8'h00; D_Mem[30] = 8'h00; D_Mem[31] = 8'h00;
    D_Mem[32] = 8'h00; D_Mem[33] = 8'h00; D_Mem[34] = 8'h00; D_Mem[35] = 8'h00;
    D_Mem[36] = 8'h00; D_Mem[37] = 8'h00; D_Mem[38] = 8'h00; D_Mem[39] = 8'h00;
    D_Mem[40] = 8'h00; D_Mem[41] = 8'h00; D_Mem[42] = 8'h00; D_Mem[43] = 8'h00;
    D_Mem[44] = 8'h00; D_Mem[45] = 8'h00; D_Mem[46] = 8'h00; D_Mem[47] = 8'h00;
    D_Mem[48] = 8'h00; D_Mem[49] = 8'h00; D_Mem[50] = 8'h00; D_Mem[51] = 8'h00;
    D_Mem[52] = 8'h00; D_Mem[53] = 8'h00; D_Mem[54] = 8'h00; D_Mem[55] = 8'h00;
    D_Mem[56] = 8'h00; D_Mem[57] = 8'h00; D_Mem[58] = 8'h00; D_Mem[59] = 8'h00;
    D_Mem[60] = 8'h00; D_Mem[61] = 8'h00; D_Mem[62] = 8'h00; D_Mem[63] = 8'h00;

end

always @ (MemRead, MemWrite)
begin

    if(MemRead == 1)
        begin
        Data = {D_Mem[Address + 3], D_Mem[Address + 2], D_Mem[Address + 1], D_Mem[Address]};
        end

    else if(MemWrite == 1)
        begin
        D_Mem[Address] <= WriteData[31:24];
        D_Mem[Address+1] <= WriteData[23:16];
        D_Mem[Address+2] <= WriteData[15:8];
        D_Mem[Address+3] <= WriteData[7:0];
        end
    else
        Data = 32'h00000000;

end

endmodule