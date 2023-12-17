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
    parameter LCD_TEXT_HEIGHT = 16;
    parameter LCD_TEXT_WIDTH = 8;
    reg[15:0] lcd_text_vram[(LCD_HEIGHT / LCD_TEXT_HEIGHT) * (LCD_WIDTH / LCD_TEXT_WIDTH) - 1:0] = '{default: 0}; // 1020B
    reg[9:0] lcd_text_vram_pos;
    reg[15:0] lcd_text_vram_data;
    wire[9:0] lcd_x, lcd_y;
    reg[15:0] lcd_rgb_data;

    assign lcd_text_vram_pos = ((LCD_WIDTH / LCD_TEXT_WIDTH) * (lcd_y / LCD_TEXT_HEIGHT)) + (lcd_x / LCD_TEXT_WIDTH); // ok
    assign lcd_text_vram_data = lcd_text_vram[lcd_text_vram_pos];
    assign lcd_rgb_data = (lcd_text_vram_data[7:0] != 0) && ((ascii_font[(LCD_TEXT_WIDTH * lcd_text_vram_data[7:0]) + (LCD_TEXT_WIDTH - (lcd_x % LCD_TEXT_WIDTH) - 1)] >> (lcd_y % LCD_TEXT_HEIGHT)) & 16'h1) ? 16'B10000_000000_00000 : 16'B00100_000000_00000;
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

    reg[15:0] ascii_font[128 * LCD_TEXT_WIDTH - 1:0] = '{default: 0};

    initial begin
        lcd_text_vram[0] <= 16'h0041;
        lcd_text_vram[1] <= 16'h0042;
        lcd_text_vram[61] <= 16'h0041;
        lcd_text_vram[62] <= 16'h0042;

        // 'A'
        ascii_font[8 * 65 + 7] <= 16'h0000;
        ascii_font[8 * 65 + 6] <= 16'h1fc0;
        ascii_font[8 * 65 + 5] <= 16'h0220;
        ascii_font[8 * 65 + 4] <= 16'h0220;
        ascii_font[8 * 65 + 3] <= 16'h0220;
        ascii_font[8 * 65 + 2] <= 16'h1fc0;
        ascii_font[8 * 65 + 1] <= 16'h0000;
        ascii_font[8 * 65 + 0] <= 16'h0000;

        // 'B'
        ascii_font[8 * 66 + 7] <= 16'h0000;
        ascii_font[8 * 66 + 6] <= 16'h1fe0;
        ascii_font[8 * 66 + 5] <= 16'h1120;
        ascii_font[8 * 66 + 4] <= 16'h1120;
        ascii_font[8 * 66 + 3] <= 16'h1120;
        ascii_font[8 * 66 + 2] <= 16'h0ec0;
        ascii_font[8 * 66 + 1] <= 16'h0000;
        ascii_font[8 * 66 + 0] <= 16'h0000;
    end

    always @(posedge clk) begin
        // LED
        if (address == 16'h4000 && load)
            io_led <= in[5:0];

        // UART
        else if (address == 16'h4001 && load) begin
            io_uart[7:0] <= in[7:0];
            io_uart_update <= ~io_uart_update;
        end

        // Text VRAM
        else if (address >= 16'h807f && load) begin
            lcd_text_vram[address - 16'h807f] <= in;
        end
    end

    assign out =
        address ==  16'h4000 ?  io_led :
        address ==  16'h4001 ? io_uart :
        address >= 16'h807f ? lcd_text_vram[address - 16'h807f] :
        16'h0;

endmodule

`default_nettype wire
