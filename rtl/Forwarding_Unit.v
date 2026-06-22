module Forwarding_Unit(
    input [4:0] EXMEM_DestinationRegister,
    input [4:0] MEMWB_DestinationRegister,
    input EXMEM_RegWrite,
    input MEMWB_RegWrite,
    input [4:0] RREX_Rs,
    input [4:0] RREX_Rt,
    output reg [1:0] FRs,
    output reg [1:0] FRt
);

always @(*) begin

    if((EXMEM_RegWrite == 1)&&(EXMEM_DestinationRegister != 0)&&(EXMEM_DestinationRegister == RREX_Rs)) begin
        FRs = 2'b01;
    end
    else if((MEMWB_RegWrite == 1)&&(MEMWB_DestinationRegister != 0)&&(MEMWB_DestinationRegister == RREX_Rs)) begin
        FRs = 2'b10;
    end
    else begin
        FRs = 2'b00;
    end

    if((EXMEM_RegWrite == 1)&&(EXMEM_DestinationRegister != 0)&&(EXMEM_DestinationRegister == RREX_Rt)) begin
        FRt = 2'b01;
    end
    else if((MEMWB_RegWrite == 1)&&(MEMWB_DestinationRegister != 0)&&(MEMWB_DestinationRegister == RREX_Rt)) begin
        FRt = 2'b10;
    end
    else begin
        FRt = 2'b00;
    end
    
end

endmodule
