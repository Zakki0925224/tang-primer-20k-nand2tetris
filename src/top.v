`default_nettype none

module top(
    input wire clk,
    input wire reset,
    output wire txp
);
    `include "print.v"
    assign print_clk = clk;
    assign txp = uart_txp;

    reg[14:0] debug_pc_old;
    wire[14:0] debug_pc, debug_address_mem;
    wire[15:0] debug_inst, debug_out_mem;
    wire[5:0] led_output;
    wire debug_write_mem;

    computer computer_(
        .clk(clk),
        .reset(reset),
        .debug_pc(debug_pc),
        .debug_inst(debug_inst),
        .debug_address_mem(debug_address_mem),
        .debug_out_mem(debug_out_mem),
        .debug_write_mem(debug_write_mem)
    );

    always @(posedge clk) begin
        if (debug_pc != debug_pc_old) begin
            `print("updated!\n", STR);
            debug_pc_old = debug_pc;
        end
    end
endmodule

`default_nettype wire
