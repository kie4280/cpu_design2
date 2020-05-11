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

always@(*) begin
//Sign extended
    if (sign==1) begin
        data_o={{16{data_i[15]}},data_i};
    end else begin
        data_o={{16{1'b0}}, data_i};
    end

end


endmodule
