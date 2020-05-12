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

    
    RegDst_o = (instr_op_i == 6'b000000);
    Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101);
    

    case (instr_op_i)
        6'b000000: begin
            ALU_op_o = R_TYPE;
            ALUSrc_o = 0;
            RegWrite_o = 1;
        end
        6'b001000: begin
            ALU_op_o = ADDI;
            ALUSrc_o = 1;
            RegWrite_o = 1;
        end
        6'b001011: begin
            ALU_op_o = SLTIU;
            ALUSrc_o = 1;
            RegWrite_o = 1;
        end
        6'b000100: begin
            ALU_op_o = BEQ;
            ALUSrc_o = 0;
            RegWrite_o = 0;
        end
        6'b001111: begin
            ALU_op_o = LUI;
            ALUSrc_o = 1;
            RegWrite_o = 1;
        end
        6'b001101: begin
            ALU_op_o = ORI;
            ALUSrc_o = 1;
            RegWrite_o = 1;
        end
        6'b000101: begin
            ALU_op_o = BNE;
            ALUSrc_o = 0;
            RegWrite_o = 0;
        end
        default: ;
    endcase
    
end



endmodule
