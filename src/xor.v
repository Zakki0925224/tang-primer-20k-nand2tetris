module _xor(
    input a,
    input b,
    output out
);
    wire nand_ab, nand_aab, nand_abb;

    _nand nand_gate_ab(
        .a(a),
        .b(b),
        .out(nand_ab)
    );

    _nand nand_gate_aab(
        .a(a),
        .b(nand_ab),
        .out(nand_aab)
    );

    _nand nand_gate_abb(
        .a(nand_aab),
        .b(b),
        .out(nand_abb)
    );

    _nand nand_gate_out(
        .a(nand_aab),
        .b(nand_abb),
        .out(out)
    );
endmodule
