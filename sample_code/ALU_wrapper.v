// Author: 0710018 張宸愷

module ALU(
    rst_n,
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
input rst_n;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

alu alu(
	.rst_n(rst_n),
	.src1(src1_in),
	.src2(src2_in),
	.ALU_control(operation_in),
	.bonus_control(bonus_in),
	.result(result_out),
	.zero(zero_out),
	.cout(cout_out),
	.overflow(overflow_out)
);


assign zero_o = &(~result_o);

//actual ALU control code
localparam [4-1:0] AND=0, OR=1, NAND=2, NOR=3, ADDU=4, SUBU=5, SLT=6, EQUAL=7,
                   SRA=8, SRAV=9, LUI=10, SLTU;

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
        LUI: begin
            result_o = {src2_i[15:0], 16'b0};
        end
        SLTU: begin

        end

    endcase


end


endmodule
