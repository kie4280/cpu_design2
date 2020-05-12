// Author:

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

wire [32-1:0] instruction;
wire [32-1:0] ProgramCounter;
wire [5-1:0] reg_write_addr;
wire reg_write, reg_dst, alu_src, branch;
wire [3-1:0] alu_ctrl;

ProgramCounter PC(
    .clk_i(clk_i),
    .rst_i (rst_i),
    .pc_in_i(),
    .pc_out_o(ProgramCounter)
    );

Adder Adder1(
    .src1_i(),
    .src2_i(),
    .sum_o()
    );

Instr_Memory IM(
    .pc_addr_i(ProgramCounter),
    .instr_o(instruction)
    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
    .data0_i(instruction[20:16]),
    .data1_i(instruction[15:11]),
    .select_i(),
    .data_o()
    );

Reg_File RF(
    .clk_i(clk_i),
    .rst_i(rst_i) ,
    .RSaddr_i(instruction[25:21]) ,
    .RTaddr_i(instruction[20:16]) ,
    .RDaddr_i(instruction[15:11]) ,
    .RDdata_i()  ,
    .RegWrite_i (),
    .RSdata_o() ,
    .RTdata_o()
    );

Decoder Decoder(
    .instr_op_i(instruction[31:26]),
    .RegWrite_o(reg_write),
    .ALU_op_o(alu_ctrl),
    .ALUSrc_o(alu_src),
    .RegDst_o(reg_dst),
    .Branch_o(branch)
    );

ALU_Ctrl AC(
    .funct_i(),
    .ALUOp_i(),
    .ALUCtrl_o()
    );

Sign_Extend SE(
    .data_i(),
    .data_o(),
    .sign_i()
    );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
    .data0_i(),
    .data1_i(),
    .select_i(),
    .data_o()
    );

ALU ALU(
    .src1_i(),
    .src2_i(),
    .ctrl_i(),
    .result_o(),
    .zero_o()
    );

Adder Adder2(
    .src1_i(),
    .src2_i(),
    .sum_o()
    );

Shift_Left_Two_32 Shifter(
    .data_i(),
    .data_o()
    );

MUX_2to1 #(.size(32)) Mux_PC_Source(
    .data0_i(),
    .data1_i(),
    .select_i(),
    .data_o()
    );

endmodule
