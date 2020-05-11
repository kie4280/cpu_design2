// Author:

module Decoder(
    instr_op_i,
    RegWrite_o,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output reg        RegWrite_o;
output reg[3-1:0] ALU_op_o;
output reg        ALUSrc_o;
output reg        RegDst_o;
output reg        Branch_o;


//begin logic

if(instr_op_i==5'b00000) begin
    RegDst_o = 1;
     

end else begin
    RegDst_o = 0;



end

endmodule
