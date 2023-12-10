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
    output wire uart_tx
);
    wire[15:0] mem_out, mmio_out;

    reg[15:0] inst_rom [0:32767]; // 32KB

    initial begin
        //$readmemb("./rom/rom.hack", inst_rom);
        inst_rom[0] = 16'b0000000001001000;
        inst_rom[1] = 16'b1110110000010000;
        inst_rom[2] = 16'b0100000000000001;
        inst_rom[3] = 16'b1110001100001000;
        inst_rom[4] = 16'b0000000001100101;
        inst_rom[5] = 16'b1110110000010000;
        inst_rom[6] = 16'b0100000000000001;
        inst_rom[7] = 16'b1110001100001000;
        inst_rom[8] = 15'b0000000000001001;
        inst_rom[9] = 15'b1110101010000111;
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
        .uart_tx(uart_tx)
    );

    assign in_m = address_m >= 16'h4000 ? mmio_out : mem_out;
endmodule

`default_nettype wire
