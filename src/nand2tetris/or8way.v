`default_nettype none

module or8way(
    input wire[7:0] in,
    output wire out
);
    wire or_01, or_23, or_45, or_67, or_0123, or_4567;

    _or or_gate_01(
        .a(in[0]),
        .b(in[1]),
        .out(or_01)
    );

    _or or_gate_23(
        .a(in[2]),
        .b(in[3]),
        .out(or_23)
    );

    _or or_gate_45(
        .a(in[4]),
        .b(in[5]),
        .out(or_45)
    );

    _or or_gate_67(
        .a(in[6]),
        .b(in[7]),
        .out(or_67)
    );

    _or or_gate_0123(
        .a(or_01),
        .b(or_23),
        .out(or_0123)
    );

    _or or_gate_4567(
        .a(or_45),
        .b(or_67),
        .out(or_4567)
    );

    _or or_gate_out(
        .a(or_0123),
        .b(or_4567),
        .out(out)
    );
endmodule

`default_nettype wire
