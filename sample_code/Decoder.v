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

//ALUOP from decoder
localparam[3-1:0] R_TYPE=0, ADDI=1, SLTIU=2, BEQ=3, LUI=4, ORI=5, BNE=6;


//begin logic

always@(*) begin

    if(instr_op_i==6'b000000) begin
        RegDst_o = 1;

    end else begin
        RegDst_o = 0;

    end


    case (intr_op_i)
        6'b000000: 
            ALU_op_o = 0;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b001000:
            ALU_op_o = 1;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b001011:
            ALU_op_o = 2;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b000100:
            ALU_op_o = 3;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b001111:
            ALU_op_o = 4;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b001101:
            ALU_op_o = 5;
            ALUSrc_o = ;
            RegWrite_o = ;
        6'b000101):
            ALU_op_o = 6;
            ALUSrc_o = ;
            RegWrite_o = ;

        default: 
    endcase
    
end



endmodule
