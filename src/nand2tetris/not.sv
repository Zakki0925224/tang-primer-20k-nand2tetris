`default_nettype none

module _not(
    input wire in,
    output wire out
);
    _nand nand_gate(
        .a(in),
        .b(in),
        .out(out)
    );
endmodule

`default_nettype wire
