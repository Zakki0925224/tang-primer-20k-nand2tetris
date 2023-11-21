`default_nettype none

module _nand(
    input wire a,
    input wire b,
    output wire out
);

    assign out = ~(a & b);
endmodule

`default_nettype wire
