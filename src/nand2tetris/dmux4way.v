`default_nettype none

module dmux4way(
    input wire in,
    input wire[1:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d
);
    wire tmp_a, tmp_b;

    dmux dmux_tmp_ab(
        .in(in),
        .sel(sel[0]),
        .a(tmp_a),
        .b(tmp_b)
    );

    dmux dmux_tmp_a(
        .in(tmp_a),
        .sel(sel[1]),
        .a(a),
        .b(c)
    );

    dmux dmux_tmp_b(
        .in(tmp_b),
        .sel(sel[1]),
        .a(b),
        .b(d)
    );
endmodule

`default_nettype wire
