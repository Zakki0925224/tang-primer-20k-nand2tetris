`default_nettype none

module top(
    input wire clk,
    input wire reset,
    output wire txp,
    output wire[5:0] led
);
    `include "print.v"
    assign print_clk = clk;
    assign txp = uart_txp;

    reg[14:0] debug_pc_old;
    wire[14:0] debug_pc, debug_address_mem;
    wire[15:0] debug_inst, debug_out_mem;
    wire debug_write_mem;

    wire[15:0] mmio_led;

    computer computer_(
        .clk(clk),
        .reset(reset),
        .debug_pc(debug_pc),
        .debug_inst(debug_inst),
        .debug_address_mem(debug_address_mem),
        .debug_out_mem(debug_out_mem),
        .debug_write_mem(debug_write_mem),
        .mmio_led(mmio_led)
    );

    always @(posedge clk) begin
        if (debug_pc != debug_pc_old) begin
            //`print(debug_address_mem, HEX);
            `print(mmio_led, HEX);
            //`print(" ", STR);
            //debug_pc_old = debug_pc;
        end
    end

    assign led = mmio_led[5:0];
endmodule

`default_nettype wire
