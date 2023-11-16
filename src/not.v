module _not(
    input in,
    output out
);
    _nand nand_gate(
        .a(in),
        .b(in),
        .out(out)
    );
endmodule
