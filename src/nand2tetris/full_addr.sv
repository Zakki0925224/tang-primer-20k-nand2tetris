`default_nettype none

module full_addr(
    input wire a,
    input wire b,
    input wire c,
    output wire sum,
    output wire carry
);
    wire half_addr_a_sum, half_addr_a_carry, half_addr_b_carry;

    half_addr half_addr_a(
        .a(a),
        .b(b),
        .sum(half_addr_a_sum),
        .carry(half_addr_a_carry)
    );

    half_addr half_addr_b(
        .a(half_addr_a_sum),
        .b(c),
        .sum(sum),
        .carry(half_addr_b_carry)
    );

    _or or_gate(
        .a(half_addr_a_carry),
        .b(half_addr_b_carry),
        .out(carry)
    );
endmodule

`default_nettype wire
