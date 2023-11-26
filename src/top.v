`default_nettype none

module top(
    input wire clk,
    output wire txp
);
    `include "fnc/print.v"
    assign print_clk = clk;
    assign txp = uart_txp;

    always@(posedge clk) begin
        `print("Hello world!\n", STR);
    end
endmodule

`default_nettype wire
