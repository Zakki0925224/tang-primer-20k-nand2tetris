module mux(
    input a,
    input b,
    input sel,
    output out
);
    wire and_bsel, not_sel, and_anotsel;

    _and and_reg_bsel(
        .a(b),
        .b(sel),
        .out(and_bsel)
    );

    _not not_reg_sel(
        .in(sel),
        .out(not_sel)
    );

    _and and_reg_anotsel(
        .a(a),
        .b(not_sel),
        .out(and_anotsel)
    );

    _or or_reg(
        .a(and_bsel),
        .b(and_anotsel),
        .out(out)
    );
endmodule
