// Author:

module Sign_Extend(
    data_i,
    sign,
    data_o
    );

//I/O ports
input   [16-1:0] data_i;
input   sign;
output  [32-1:0] data_o;

//Internal Signals
reg     [32-1:0] data_o;
if (sign==1) begin
    data_o={{data_i[15],16},data_i};
end else begin
    data_o={{0,16},data_i};
end

//Sign extended

endmodule
