module ALU(
    input [31:0] A,
    input [31:0] X,
    input [31:0] Sign_Extended_Offset,
    input Operation,
    input B_Select,
    input Swap_Enable,
    output reg [31:0] Result,
    output reg [31:0] Result_Swap
);

always @(*) begin
    if (Swap_Enable) begin
        Result      = X;  // rs gets rt
        Result_Swap = A;  // rt gets rs
    end
    else begin
        case (Operation)
            1'b0: Result = A & (B_Select ? Sign_Extended_Offset : X);
            1'b1: Result = A + (B_Select ? Sign_Extended_Offset : X);
            default: Result = 32'h00000000;
        endcase
        Result_Swap = 32'h00000000;  // Not used in non-swap case
    end
end


endmodule