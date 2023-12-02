`default_nettype none

module half_addr(
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    wire or_ab, and_ab, not_and_ab;

    _or or_gate_ab(
        .a(a),
        .b(b),
        .out(or_ab)
    );

    _and and_gate_ab(
        .a(a),
        .b(b),
        .out(and_ab)
    );

    _not not_gate_and_ab(
        .in(and_ab),
        .out(not_and_ab)
    );

    _and and_gate_sum(
        .a(or_ab),
        .b(not_and_ab),
        .out(sum)
    );

    assign carry = and_ab;
endmodule

`default_nettype wire
