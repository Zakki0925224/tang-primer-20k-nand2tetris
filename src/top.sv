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

    wire[9:0] lcd_x, lcd_y;
    reg[15:0] lcd_rgb_data;
    assign lcd_r = lcd_rgb_data[15:11];
    assign lcd_g = lcd_rgb_data[10:5];
    assign lcd_b = lcd_rgb_data[4:0];

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

    rgb_lcd lcd(
        .clk(clk),
        .reset(reset),
        .dclk(lcd_dclk),
        .de(lcd_de),
        .hs(lcd_hs),
        .vs(lcd_vs),
        .h_pos(lcd_x),
        .v_pos(lcd_y)
    );

    always @(posedge lcd_dclk) begin
        lcd_rgb_data <= 16'h0;
    end
endmodule

`default_nettype wire
