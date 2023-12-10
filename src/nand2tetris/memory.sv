`default_nettype none

module memory(
    input wire clk,
    input wire[15:0] in,
    input wire[15:0] address,
    input wire load,
    output wire[15:0] out
);
    ram16k ram(
        .clk(clk),
        .in(in),
        .address(address[14:0]),
        .load(load),
        .out(out)
    );

endmodule

`default_nettype wire
