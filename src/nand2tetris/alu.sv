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
    // TODO: Fixing

    // wire mux_zx, mux_nx, mux_zy, mux_ny, mux_f, mux_zr, mux_ng;
    // wire[15:0] mux_no, mux_no_copy, mux_no_copy2;
    // wire not_x, not_y, add_xy, and_xy, not_out, or_out_u, or_out_l, or_out;

    // mux16 mux16_zx(
    //     .a(x),
    //     .b(16'b0),
    //     .sel(zx),
    //     .out(mux_zx)
    // );

    // not16 not16_x(
    //     .in(mux_zx),
    //     .out(not_x)
    // );

    // mux16 mux16_nx(
    //     .a(mux_zx),
    //     .b(not_x),
    //     .sel(nx),
    //     .out(mux_nx)
    // );

    // mux16 mux16_zy(
    //     .a(y),
    //     .b(16'b0),
    //     .sel(zy),
    //     .out(mux_zy)
    // );

    // not16 not16_y(
    //     .in(mux_zy),
    //     .out(not_y)
    // );

    // mux16 mux16_ny(
    //     .a(mux_zy),
    //     .b(not_y),
    //     .sel(ny),
    //     .out(mux_ny)
    // );

    // add16 add16_xy(
    //     .a(mux_nx),
    //     .b(mux_ny),
    //     .out(add_xy)
    // );

    // and16 and16_xy(
    //     .a(mux_nx),
    //     .b(mux_ny),
    //     .out(and_xy)
    // );

    // mux16 mux16_f(
    //     .a(add_xy),
    //     .b(and_xy),
    //     .sel(f),
    //     .out(mux_f)
    // );

    // not16 not16_out(
    //     .in(mux_f),
    //     .out(not_out)
    // );

    // mux16 mux16_no(
    //     .a(mux_f),
    //     .b(not_out),
    //     .sel(no),
    //     .out(mux_no)
    // );

    // and16 and16_mux_no_copy(
    //     .a(mux_no),
    //     .b(16'hffff),
    //     .out(mux_no_copy)
    // );

    // or8way or8way_out_l(
    //     .in(mux_no_copy[7:0]),
    //     .out(or_out_l)
    // );

    // or8way or8way_out_u(
    //     .in(mux_no_copy[15:8]),
    //     .out(or_out_u)
    // );

    // _or or_gate_out(
    //     .a(or_out_l),
    //     .b(or_out_u),
    //     .out(or_out)
    // );

    // _not not_zr_out(
    //     .in(or_out),
    //     .out(zr)
    // );

    // and16 and16_mux_no_copy2(
    //     .a(mux_no),
    //     .b(16'hffff),
    //     .out(mux_no_copy2)
    // );

    // assign ng = mux_no_copy2[15];

    // and16 and16_out(
    //     .a(mux_no),
    //     .b(16'hffff),
    //     .out(out)
    // );
    wire [15:0] inzx;
    wire [15:0] notx;
    wire [15:0] inzxnx;
    wire [15:0] inzy;
    wire [15:0] noty;
    wire [15:0] inzyny;
    wire [15:0] addxy;
    wire [15:0] andxy;
    wire [15:0] outzxnxzynyf;
    wire [15:0] notoutzxnxzynyf;
    wire [7:0] finalOutLow;
    wire [7:0] finalOutHigh;
    wire zr1;
    wire zr2;
    wire nzr;
    wire [15:0] sout;
    wire[15:0] out_temp;
    wire[15:0] ng_temp;

    mux16 mux16_0(x, 16'b0, zx, inzx);
    not16 not16_0(inzx, notx);
    mux16 mux16_1(inzx, notx, nx, inzxnx);

    mux16 mux16_2(y, 16'b0, zy, inzy);
    not16 not16_1(inzy, noty);
    mux16 mux16_3(inzy, noty, ny, inzyny);

    add16 add16_0(inzxnx, inzyny, addxy);
    and16 add16_1(inzxnx, inzyny, andxy);

    mux16 mux16_4(andxy, addxy, f, outzxnxzynyf);

    not16 not16_2(outzxnxzynyf, notoutzxnxzynyf);
    mux16 mux16_5(outzxnxzynyf, notoutzxnxzynyf, no, sout);

    and16 and16_2(sout, 16'b1111111111111111, out_temp);
    assign finalOutLow = out_temp[7:0];
    assign finalOutHigh = out_temp[15:8];

    or8way or8way_0(finalOutLow,  zr1);
    or8way or8way_1(finalOutHigh, zr2);
    _or or_0(zr1, zr2, nzr);
    _not not_0(nzr, zr);

    and16 and16_3(sout, 16'b1111111111111111, ng_temp);
    assign ng = ng_temp[15];

    and16 and16_4(sout, 16'b1111111111111111, out);

endmodule
`default_nettype wire
