`timescale 1ns/1ps
//張宸愷 0710018

module compare(
    input src1,
    input src2,
    input[3-1:0] comp,
    input less,
    input equal,    
    output reg is_less,
    output reg is_equal
);

always @(*) begin
    if(src1^src2 == 0) begin
        is_less = less;
        is_equal = equal;
    end
    else if(src1 == 0 && src2 == 1) begin
        is_less = 1;
        is_equal = 0;
    end 
    else if(src1 == 1 && src2 == 0) begin
        is_less = 0;
        is_equal = 0;
    end


end


endmodule



