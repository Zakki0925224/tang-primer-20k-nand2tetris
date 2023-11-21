`default_nettype none

module alu(
    input wire[15:0] x,
    input wire[15:0] y,
    input wire zx, // x = 0
    input wire nx, // x = !x
    input wire zy, // y = 0
    input wire ny, // y = !y
    input wire f,  // f ? out = x + y : out = x & y
    input wire no, // out = !out
    output wire[15:0] out,
    output wire zr, // out == 0
    output wire ng  // out < 0
);
    wire mux_zx, mux_nx, mux_zy, mux_ny, mux_f, mux_zr, mux_ng;
    wire[15:0] mux_no;
    wire not_x, not_y, add_xy, and_xy, not_out, or_out_u, or_out_l, or_out;

    mux16 mux16_zx(
        .a(x),
        .b(16'b0),
        .sel(zx),
        .out(mux_zx)
    );

    not16 not16_x(
        .in(mux_zx),
        .out(not_x)
    );

    mux16 mux16_nx(
        .a(mux_zx),
        .b(not_x),
        .sel(nx),
        .out(mux_nx)
    );

    mux16 mux16_zy(
        .a(y),
        .b(16'b0),
        .sel(zy),
        .out(mux_zy)
    );

    not16 not16_y(
        .in(mux_zy),
        .out(not_y)
    );

    mux16 mux16_ny(
        .a(mux_zy),
        .b(not_y),
        .sel(ny),
        .out(mux_ny)
    );

    add16 add16_xy(
        .a(mux_nx),
        .b(mux_ny),
        .out(add_xy)
    );

    and16 and16_xy(
        .a(mux_nx),
        .b(mux_ny),
        .out(and_xy)
    );

    mux16 mux16_f(
        .a(add_xy),
        .b(and_xy),
        .sel(f),
        .out(mux_f)
    );

    not16 not16_out(
        .in(mux_f),
        .out(not_out)
    );

    mux16 mux16_no(
        .a(mux_f),
        .b(not_out),
        .sel(no),
        .out(mux_no)
    );

    or8way or8way_out_l(
        .in(mux_no[8:0]),
        .out(or_out_l)
    );

    or8way or8way_out_u(
        .in(mux_no[15:9]),
        .out(or_out_u)
    );

    _or or_gate_out(
        .a(or_out_l),
        .b(or_out_u),
        .out(or_out)
    );

    _not not_zr_out(
        .in(or_out),
        .out(zr)
    );

    assign out = mux_no;
    assign ng = out[15];

endmodule
`default_nettype wire
