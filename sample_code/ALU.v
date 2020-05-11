// Author:

module ALU(
    src1_i,
    src2_i,
    ctrl_i,
    result_o,
    zero_o
    );

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

assign zero_o = &(~result_o);

//constants
localparam [4-1:0] AND=0, OR=1, NAND=2, NOR=3, ADDU=4, SUBU=5, SLT=6, EQUAL=7;

always@(*) begin
    case(ctrl_i) 
    AND: begin
        result_o = src1_i & src2_i;
    end
    OR: begin
        result_o = src1_i | src2_i;

    end
    ADDU: begin
        result_o = src1_i + src2_i;
        
    end
    SUBU: begin
        result_o = src1_i - src2_i;

    end
    SLT: begin
        result_o = {31'b0, src1_i < src2_i}; 
    end

endcase


end


endmodule
