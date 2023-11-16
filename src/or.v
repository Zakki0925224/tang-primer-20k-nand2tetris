module _or(
    input a,
    input b,
    output out
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
