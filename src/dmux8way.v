`default_nettype none

module dmux8way(
    input wire in,
    input wire[2:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g,
    output wire h
);
    wire tmp_a, tmp_b, tmp_aa, tmp_ab, tmp_ba, tmp_bb;

    dmux dmux_tmp_ab(
        .in(in),
        .sel(sel[0]),
        .a(tmp_a),
        .b(tmp_b)
    );

    dmux dmux_tmp_aab(
        .in(tmp_a),
        .sel(sel[1]),
        .a(tmp_aa),
        .b(tmp_ab)
    );

    dmux dmux_tmp_bab(
        .in(tmp_b),
        .sel(sel[1]),
        .a(tmp_ba),
        .b(tmp_bb)
    );

    dmux dmux_out_aa(
        .in(tmp_aa),
        .sel(sel[2]),
        .a(a),
        .b(e)
    );

    dmux dmux_out_ab(
        .in(tmp_ab),
        .sel(sel[2]),
        .a(b),
        .b(f)
    );

    dmux dmux_out_ba(
        .in(tmp_ba),
        .sel(sel[2]),
        .a(c),
        .b(g)
    );

    dmux dmux_out_bb(
        .in(tmp_bb),
        .sel(sel[2]),
        .a(d),
        .b(h)
    );
endmodule

`default_nettype wire
