`default_nettype none

module computer(
    input wire clk,
    input wire reset,
    output wire[15:0] pc,
    output reg[15:0] inst,
    output wire[15:0] address_m,
    output wire[15:0] out_m,
    output wire[15:0] in_m,
    output wire load_m,

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
    wire[15:0] mem_out, mmio_out;

    reg[15:0] inst_rom [0:32767]; // 32KB

    initial begin
        $readmemb("./rom/rom.hack", inst_rom);
    end

    always @(posedge clk) begin
        inst <= inst_rom[pc];
    end

    cpu cpu_(
        .clk(clk),
        .in_m(in_m),
        .inst(inst),
        .reset(reset),
        .out_m(out_m),
        .load_m(load_m),
        .address_m(address_m),
        .pc(pc)
    );

    memory mem(
        .clk(clk),
        .in(out_m),
        .address(address_m),
        .load(load_m),
        .out(mem_out)
    );

    ioport mmio(
        .clk(clk),
        .in(out_m),
        .address(address_m),
        .load(load_m),
        .out(mmio_out),
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

    assign in_m = address_m >= 16'h4000 ? mmio_out : mem_out;
endmodule

`default_nettype wire
