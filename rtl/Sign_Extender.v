module Sign_Extender(
    input [15:0] Offset,
    output [31:0] Sign_Extended_Offset
    );
    
    assign Sign_Extended_Offset = {{16{Offset[15]}},Offset};
    
endmodule