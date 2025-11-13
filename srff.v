
module srff(
    input clk,
    input S,
    input R,
    output reg Q
);

    always @(posedge clk) begin
        case ({S,R})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= 1'bx;
            default: Q <= Q;
        endcase
    end

endmodule
