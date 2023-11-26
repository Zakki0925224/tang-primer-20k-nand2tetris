module _and(
    input wire a,
    input wire b,
    output wire out
);
    wire nand_ab;

    _nand nand_gate_ab(
        .a(a),
        .b(b),
        .out(nand_ab)
    );

    _nand nand_gate_out(
        .a(nand_ab),
        .b(nand_ab),
        .out(out)
    );
endmodule
