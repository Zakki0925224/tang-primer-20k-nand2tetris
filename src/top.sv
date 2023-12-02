`default_nettype none

module top(
    input wire clk,
    input wire reset,
    output wire txp,
    output wire[5:0] led
);
    `include "print.sv"
    assign print_clk = clk;
    assign txp = uart_txp;

    reg[15:0] debug_pc_old = -1;
    wire[15:0] debug_pc, debug_address_m;
    wire[15:0] debug_inst, debug_out_m;
    wire debug_load_m;

    wire[15:0] mmio_led;

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

    always @(posedge clk) begin
        // if (debug_pc != debug_pc_old) begin
        //     debug_pc_old <= debug_pc;
        //     `print(debug_pc, HEX);
        // end
        // else debug_pc_old <= debug_pc_old;
        `print(debug_pc, HEX);
    end

    assign led = ~mmio_led[5:0];
endmodule

`default_nettype wire
