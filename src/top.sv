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

    wire [9:0] lcd_x, lcd_y;
    assign {lcd_r, lcd_g, lcd_b} = {lcd_x[5:4], 3'b000, lcd_y[5:4], 9'd0};

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
        .debug_io_uart(debug_io_uart)
    );
endmodule

`default_nettype wire
