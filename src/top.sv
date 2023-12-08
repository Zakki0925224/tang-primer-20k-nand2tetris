`default_nettype none

module top(
    input wire clk,
    input wire reset,
    input wire uart_rx,
    output wire uart_tx,
    output wire[5:0] led
);
    wire[15:0] debug_pc, debug_address_m;
    wire[15:0] debug_inst, debug_out_m;
    wire debug_load_m;

    reg[15:0] mmio_led = 0;

    reg[7:0] mmio_uart_data_in;
    reg[7:0] mmio_uart_data_out;
    reg mmio_uart_doorbell_flag;

    uart uart_(
        .clk(clk),
        .rx(uart_rx),
        .tx(uart_tx),
        .mmio_data_in(),
        .mmio_data_out(),
        .mmio_doorbell_flag()
    );

    computer computer_(
        .clk(clk),
        .reset(reset),
        .debug_pc(debug_pc),
        .debug_inst(debug_inst),
        .debug_address_m(debug_address_m),
        .debug_out_m(debug_out_m),
        .debug_load_m(debug_load_m),
        .mmio_led(mmio_led)
    );

    assign led = ~mmio_led[5:0];
endmodule

`default_nettype wire
