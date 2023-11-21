`default_nettype none

module mux4way16(
    input wire[15:0] a,
    input wire[15:0] b,
    input wire[15:0] c,
    input wire[15:0] d,
    input wire[1:0] sel,
    output wire[15:0] out
);
    wire a_or_b, c_or_d;

    mux16 mux16_a_or_b(
        .a(a),
        .b(b),
        .sel(sel[0]),
        .out(a_or_b)
    );

    mux16 mux16_c_or_d(
        .a(c),
        .b(d),
        .sel(sel[0]),
        .out(c_or_d)
    );

    mux16 mux16_out(
        .a(a_or_b),
        .b(c_or_d),
        .sel(sel[1]),
        .out(out)
    );
endmodule

`default_nettype wire
