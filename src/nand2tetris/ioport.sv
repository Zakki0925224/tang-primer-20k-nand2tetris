`default_nettype none

module ioport(
    input wire clk,
    input wire[15:0] in,
    input wire[15:0] address,
    input wire load,
    output wire[15:0] out,

    output wire[5:0] led,
    input wire uart_rx,
    output wire uart_tx,
    output reg[15:0] debug_io_uart,

    output wire lcd_dclk,
    output wire lcd_de,
    output wire lcd_hs,
    output wire lcd_vs,
    output wire[4:0] lcd_r,
    output wire[5:0] lcd_g,
    output wire[4:0] lcd_b
);
    // LED
    reg[15:0] io_led = 16'h0;

    assign led = ~io_led[5:0];

    // UART
    reg[15:0] io_uart;
    reg io_uart_update = 0;
    assign debug_io_uart = io_uart;

    uart uart_(
        .clk(clk),
        .rx(uart_rx),
        .tx(uart_tx),
        .mmio_data_in(io_uart[7:0]),
        .mmio_data_out(io_uart[15:8]),
        .mmio_update(io_uart_update)
    );

    // RGB LCD display
    parameter LCD_HEIGHT = 272;
    parameter LCD_WIDTH = 480;
    reg[15:0] lcd_vram[130559:0];
    reg[15:0] lcd_vram_control_reg = 16'h0;
    wire[9:0] lcd_x, lcd_y;
    reg[15:0] lcd_rgb_data;
    assign lcd_rgb_data = lcd_vram[(lcd_y * LCD_HEIGHT) + lcd_x];
    assign lcd_r = lcd_rgb_data[15:11];
    assign lcd_g = lcd_rgb_data[10:5];
    assign lcd_b = lcd_rgb_data[4:0];

    rgb_lcd lcd(
        .clk(clk),
        .reset(0),
        .dclk(lcd_dclk),
        .de(lcd_de),
        .hs(lcd_hs),
        .vs(lcd_vs),
        .h_pos(lcd_x),
        .v_pos(lcd_y)
    );

    always @(posedge clk) begin
        // LED
        if (address == 16'h4000 && load)
            io_led <= in[5:0];

        // UART
        else if (address == 16'h4001 && load) begin
            io_uart[7:0] <= in[7:0];
            io_uart_update <= ~io_uart_update;
        end

        // VRAM control register
        else if (address == 16'h807e && load) begin
            lcd_vram_control_reg <= in;
        end

        // VRAM
        else if (address >= 16'h807f && load) begin
            lcd_vram[32640 * lcd_vram_control_reg[1:0] + (address - 16'h807f)] <= in;
        end
    end

    assign out =
        address ==  16'h4000 ?  io_led :
        address ==  16'h4001 ? io_uart :
        address ==  16'h807e ? lcd_vram_control_reg :
        address >= 16'h807f ? lcd_vram[32640 * lcd_vram_control_reg[1:0] + (address - 16'h807f)] :
        16'h0;

endmodule

`default_nettype wire
