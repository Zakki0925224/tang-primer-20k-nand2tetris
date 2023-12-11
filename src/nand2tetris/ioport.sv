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
    output reg[15:0] debug_io_uart
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

    always @(posedge clk) begin
        // LED
        if (address == 16'h4000 && load)
            io_led <= in[5:0];

        // UART
        else if (address == 16'h4001 && load) begin
            io_uart[7:0] <= in[7:0];
            io_uart_update <= ~io_uart_update;
        end
    end

    assign out =
        address ==  16'h4000 ?  io_led :
        address == 16'h4001 ? io_uart : 16'h0;

endmodule

`default_nettype wire
