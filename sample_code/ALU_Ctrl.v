// Author:

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o,
        Sign_extend_o
        );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;
output reg Sign_extend_o;

//Select exact operation

//actual ALU control code
localparam [4-1:0] AND=0, OR=1, NAND=2, NOR=3, ADDU=4, SUBU=5, SLT=6, EQUAL=7,
                   SFT=8, SFTV=9, LUI=10;

//ALUOP from decoder
localparam[3-1:0] R_TYPE=0, ADDI=1, SLTIU=2, BEQ=3, LUI=4, ORI=5, BNE=6;

//begin logic
always@(*) begin

    


    if(ALUOp_i == R_TYPE) begin
        case(funct_i) 
            6'b100001: begin //add unsigned
                ALUCtrl_o = ADDU;
            end
            6'b100011: begin //sub unsigned
                ALUCtrl_o = SUBU;
            end
            6'b100100: begin //bitwise and
                ALUCtrl_o = AND;
            end
            6'b100101: begin //bitwise or
                ALUCtrl_o = OR;
            end
            6'b101010: begin //slt
                ALUCtrl_o = SLT;
            end
            6'b000011: begin // shift right constant
                ALUCtrl_o = SFT;
            end
            6'b000111: begin //shift right variable
                ALUCtrl_o = SFTV;
            end


        endcase
        Sign_extend_o = 0;
    end

    else if(ALUOp_i == ADDI) begin
        Sign_extend_o = 1;

    end
    else if(ALUOp_i == SLTIU) begin
        Sign_extend_o = 1;

    end
    else if(ALUOp_i == BEQ)begin
        Sign_extend_o = 1;
    end
    else if (ALUOp_i == LUI) begin
        Sign_extend_o = 0;
    end
    else if (ALUOp_i == ORI) begin
        Sign_extend_o = 0;
    end 
    else if(ALUOp_i == BNE)begin
        Sign_extend_o = 1;
    end

    else begin
        Sign_extend_o = 0;
    end

end


endmodule
