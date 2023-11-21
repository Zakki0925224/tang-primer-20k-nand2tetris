`default_nettype none

module mux8way16(
    input wire[15:0] a,
    input wire[15:0] b,
    input wire[15:0] c,
    input wire[15:0] d,
    input wire[15:0] e,
    input wire[15:0] f,
    input wire[15:0] g,
    input wire[15:0] h,
    input wire[2:0] sel,
    output wire[15:0] out
);
    wire a_or_b, c_or_d, e_or_f, g_or_h, ab_or_cd, ef_or_gh;

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

    mux16 mux16_e_or_f(
        .a(e),
        .b(f),
        .sel(sel[0]),
        .out(e_or_f)
    );

    mux16 mux16_g_or_h(
        .a(g),
        .b(h),
        .sel(sel[0]),
        .out(g_or_h)
    );

    mux16 mux16_ab_or_cd(
        .a(a_or_b),
        .b(c_or_d),
        .sel(sel[1]),
        .out(ab_or_cd)
    );

    mux16 mux16_ef_or_gh(
        .a(e_or_f),
        .b(g_or_h),
        .sel(sel[1]),
        .out(ef_or_gh)
    );

    mux16 mux16_out(
        .a(ab_or_cd),
        .b(ef_or_gh),
        .sel(sel[2]),
        .out(out)
    );

endmodule

`default_nettype wire
