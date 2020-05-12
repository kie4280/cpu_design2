// Author:

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

wire [32-1:0] instruction;
wire [32-1:0] ProgramCounter_i, ProgramCounter_o, ProgramCounter_4,
              ProgramCounter_b, ProgramCounter_w, ProgramCounter_4w;
wire [32-1:0] RSdata, RTdata, RDdata, Mux_ALU;
wire [5-1:0] reg_write_addr, RD_addr;
wire reg_write, reg_dst, alu_src, branch, branch_eq;
wire[3-1:0] alu_op;
wire sign, zero;
wire [4-1:0] alu_ctrl;


ProgramCounter PC(
    .clk_i(clk_i),
    .rst_i (rst_i),
    .pc_in_i(ProgramCounter_i),//
    .pc_out_o(ProgramCounter_o)
    );

Adder Adder1(
    .src1_i(ProgramCounter_o),//
    .src2_i(32'd4),//
    .sum_o(ProgramCounter_4)//
    );

Instr_Memory IM(
    .pc_addr_i(ProgramCounter_o),
    .instr_o(instruction)
    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
    .data0_i(instruction[20:16]),
    .data1_i(instruction[15:11]),
    .select_i(reg_dst),//
    .data_o(RD_addr)  //
    );

Reg_File RF(
    .clk_i(clk_i),
    .rst_i(rst_i) ,
    .RSaddr_i(instruction[25:21]) ,
    .RTaddr_i(instruction[20:16]) ,
    .RDaddr_i(RD_addr) ,
    .RDdata_i(0) ,//
    .RegWrite_i (reg_write),//
    .RSdata_o(RSdata) ,//
    .RTdata_o(RTdata)//
    );

Decoder Decoder(
    .instr_op_i(instruction[31:26]),
    .RegWrite_o(reg_write),
    .ALU_op_o(alu_op),
    .ALUSrc_o(alu_src),
    .RegDst_o(reg_dst),
    .Branch_o(branch),
    .Branch_eq(branch_eq)
    );

ALU_Ctrl AC(
    .funct_i(instruction[5:0]),//
    .ALUOp_i(),//
    .ALUCtrl_o(alu_ctrl)//
    );

Sign_Extend SE(
    .data_i(instruction[15:0]),//
    .sign_i(sign),//
    .data_o(ProgramCounter_b)//
    );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
    .data0_i(RTdata),//
    .data1_i(ProgramCounter_b),//
    .select_i(alu_src),//
    .data_o(Mux_ALU)
    );

ALU ALU(
    .src1_i(RSdata),//
    .src2_i(Mux_ALU),//
    .ctrl_i(alu_ctrl),//
    .result_o(RDdata),//
    .zero_o(zero)//
    );

Adder Adder2(
    .src1_i(ProgramCounter_w),//
    .src2_i(ProgramCounter_4),//
    .sum_o(ProgramCounter_4w)//
    );

Shift_Left_Two_32 Shifter(
    .data_i(ProgramCounter_b),//
    .data_o(ProgramCounter_w)//
    );

MUX_2to1 #(.size(32)) Mux_PC_Source(
    .data0_i(ProgramCounter_4),//
    .data1_i(ProgramCounter_4w),//
    .select_i((branch_eq?zero:~zero)&branch),//
    .data_o(ProgramCounter_i)//
    );

endmodule
