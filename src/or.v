`default_nettype none

module _or(
    input wire a,
    input wire b,
    output wire out
);
    wire nand_a, nand_b;

    _nand nand_gate_a(
        .a(a),
        .b(a),
        .out(nand_a)
    );

    _nand nand_gate_b(
        .a(b),
        .b(b),
        .out(nand_b)
    );

    _nand nand_gate_ab(
        .a(nand_a),
        .b(nand_b),
        .out(out)
    );
endmodule

`default_nettype wire
