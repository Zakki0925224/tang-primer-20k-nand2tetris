`default_nettype none

module top(
    input wire clk,
    input wire reset,

    output wire[5:0] led,
    input wire uart_rx,
    output wire uart_tx
);
    wire[15:0] pc, address_m, out_m, in_m;
    wire load_m;
    reg[15:0] inst;

    computer computer_(
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .inst(inst),
        .address_m(address_m),
        .out_m(out_m),
        .in_m(in_m),
        .load_m(load_m),

        .led(led),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx)
    );
endmodule

`default_nettype wire
