module Jump_Extender(
    input [25:0] Jump_Offset,
    output [27:0] Jump_Offset_Extended
    );
    
    assign Jump_Offset_Extended = {Jump_Offset, 2'b00};
    
    
    endmodule
    
