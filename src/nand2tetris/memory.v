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

    assign ram_load = (address[14] == 1'b0 && load);

    ram16k ram(
        .clk(clk),
        .in(in),
        .address(address[14:0]),
        .load(ram_load),
        .out(out)
    );

    // MMIO LED
    always @(posedge clk) begin
        if (address == 16'h3fff && load) reg_mmio_led <= in;
        else reg_mmio_led <= reg_mmio_led;
    end

    assign mmio_led = reg_mmio_led;

endmodule
