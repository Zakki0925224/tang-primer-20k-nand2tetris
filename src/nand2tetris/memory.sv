`default_nettype none

module memory(
    input wire clk,
    input wire[15:0] in,
    input wire[15:0] address,
    input wire load,
    output wire[15:0] out,

    output wire[15:0] mmio_led
);
    reg[15:0] reg_mmio_led;

    wire ram_load;
    wire[15:0] ram_out;

    assign ram_load = (address[14] == 1'b0 && load);

    ram16k ram(
        .clk(clk),
        .in(in),
        .address(address[14:0]),
        .load(ram_load),
        .out(ram_out)
    );

    // MMIO LED
    always @(posedge clk) begin
        if (address == 16'h4000 && load)
            reg_mmio_led <= in;
    end

    mux16 mux16_out(
        .a(ram_out),
        .b(reg_mmio_led),
        .sel(address[15]),
        .out(out)
    );

    assign mmio_led = reg_mmio_led;

endmodule

`default_nettype wire
