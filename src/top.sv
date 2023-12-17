`default_nettype none

module top(
    input wire clk,
    input wire reset,

    output wire[5:0] led,

    input wire uart_rx,
    output wire uart_tx,

    output wire lcd_dclk,
    output wire lcd_de,
    output wire lcd_hs,
    output wire lcd_vs,
    output wire[4:0] lcd_r,
    output wire[5:0] lcd_g,
    output wire[4:0] lcd_b
);
    wire[15:0] pc, address_m, out_m, in_m;
    wire load_m;
    reg[15:0] inst, debug_io_uart;

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
        .uart_tx(uart_tx),
        .debug_io_uart(debug_io_uart),

        .lcd_dclk(lcd_dclk),
        .lcd_de(lcd_de),
        .lcd_hs(lcd_hs),
        .lcd_vs(lcd_vs),
        .lcd_r(lcd_r),
        .lcd_g(lcd_g),
        .lcd_b(lcd_b)
    );
endmodule

`default_nettype wire
