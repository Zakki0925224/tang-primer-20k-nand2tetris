module dmux(
    input in,
    input sel,
    output a,
    output b
);
    wire nand_insel, nand_innandinsel;

    _nand nand_reg_insel(
        .a(in),
        .b(sel),
        .out(nand_insel)
    );

    _nand nand_reg_innandinsel(
        .a(in),
        .b(nand_insel),
        .out(nand_innandinsel)
    );

    _nand nand_reg_a(
        .a(nand_innandinsel),
        .b(nand_innandinsel),
        .out(a)
    );

    _nand nand_reg_b(
        .a(nand_insel),
        .b(nand_insel),
        .out(b)
    );
endmodule
