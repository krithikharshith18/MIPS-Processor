module Instruction_Memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
);

reg [7:0] Mem [31:0];

assign Instruction_Code =  {Mem[PC], Mem[PC + 1], Mem[PC + 2], Mem[PC + 3]};

always @ (negedge reset)
begin
    Mem[0] <= 8'h20; Mem[1] <= 8'h41; Mem[2] <= 8'h00; Mem[3] <= 8'h0A;     
    Mem[4] <= 8'h20; Mem[5] <= 8'h64; Mem[6] <= 8'h00; Mem[7] <= 8'h05;     
    Mem[8] <= 8'h00; Mem[9] <= 8'hC1; Mem[10] <= 8'h38; Mem[11] <= 8'h20;   
    Mem[12] <= 8'h00; Mem[13] <= 8'hE8; Mem[14] <= 8'h58; Mem[15] <= 8'h24; 
    Mem[16] <= 8'h8C; Mem[17] <= 8'h6C; Mem[18] <= 8'h00; Mem[19] <= 8'h0A; 
    Mem[20] <= 8'h01; Mem[21] <= 8'hA5; Mem[22] <= 8'h50; Mem[23] <= 8'h24; 
end

endmodule