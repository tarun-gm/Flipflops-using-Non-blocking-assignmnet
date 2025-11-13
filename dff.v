
module dff(
    input clk,
    input rst,
    input d,
    output reg dout
);

    always @(posedge clk) begin
        if (rst)
            dout <= 1'b0;
        else
            dout <= d;
    end

endmodule
