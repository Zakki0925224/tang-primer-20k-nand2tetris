`default_nettype none

module memory(
    input wire clk,
    input wire[15:0] in,
    input wire[15:0] address,
    input wire load,
    output wire[15:0] out,

    output reg[15:0] mmio_led,

    input reg[7:0] mmio_uart_data_in,
    output reg[7:0] mmio_uart_data_out,
    input reg mmio_uart_doorbell_flag
);
    wire ram_load;
    reg[15:0] ram_out;

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
        if (address == 16'h4000) begin
            if (load)
                mmio_led <= in;

            else
                ram_out <= mmio_led;
        end
    end

    assign out = ram_out;

endmodule

`default_nettype wire
