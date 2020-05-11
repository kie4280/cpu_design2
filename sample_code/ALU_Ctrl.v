// Author:

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o
        );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Select exact operation

//constants
localparam [4-1:0] AND=0, OR=1, NAND=2, NOR=3, ADDU=4, SUBU=5, SLT=6, EQUAL=7;

endmodule
