`default_nettype none

module computer(
    input wire clk,
    input wire reset,
    output wire[15:0] debug_pc,
    output wire[15:0] debug_inst,
    output wire[15:0] debug_address_m,
    output wire[15:0] debug_out_m,
    output wire debug_load_m,

    output reg[15:0] mmio_led,

    input reg[7:0] mmio_uart_data_in,
    output reg[7:0] mmio_uart_data_out,
    input reg mmio_uart_doorbell_flag
);
    reg[15:0] inst;
    reg[15:0] inst_rom [0:32767]; // 32KB
    wire[15:0] out_m, in_m;
    wire[15:0] pc, address_m;
    wire load_m;

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
        .out(in_m),

        .mmio_led(mmio_led),

        .mmio_uart_data_in(mmio_uart_data_in),
        .mmio_uart_data_out(mmio_uart_data_out),
        .mmio_uart_doorbell_flag(mmio_uart_doorbell_flag)
    );

    assign debug_pc = pc;
    assign debug_inst = inst;
    assign debug_address_m = address_m;
    assign debug_out_m = out_m;
    assign debug_load_m = load_m;
endmodule

`default_nettype wire
