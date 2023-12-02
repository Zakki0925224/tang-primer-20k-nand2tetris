`default_nettype none

module mux16(
    input wire[15:0] a,
    input wire[15:0] b,
    input wire sel,
    output wire[15:0] out
);
    mux mux_0(
        .a(a[0]),
        .b(b[0]),
        .sel(sel),
        .out(out[0])
    );

    mux mux_1(
        .a(a[1]),
        .b(b[1]),
        .sel(sel),
        .out(out[1])
    );

    mux mux_2(
        .a(a[2]),
        .b(b[2]),
        .sel(sel),
        .out(out[2])
    );

    mux mux_3(
        .a(a[3]),
        .b(b[3]),
        .sel(sel),
        .out(out[3])
    );

    mux mux_4(
        .a(a[4]),
        .b(b[4]),
        .sel(sel),
        .out(out[4])
    );

    mux mux_5(
        .a(a[5]),
        .b(b[5]),
        .sel(sel),
        .out(out[5])
    );

    mux mux_6(
        .a(a[6]),
        .b(b[6]),
        .sel(sel),
        .out(out[6])
    );

    mux mux_7(
        .a(a[7]),
        .b(b[7]),
        .sel(sel),
        .out(out[7])
    );

    mux mux_8(
        .a(a[8]),
        .b(b[8]),
        .sel(sel),
        .out(out[8])
    );

    mux mux_9(
        .a(a[9]),
        .b(b[9]),
        .sel(sel),
        .out(out[9])
    );

    mux mux_10(
        .a(a[10]),
        .b(b[10]),
        .sel(sel),
        .out(out[10])
    );

    mux mux_11(
        .a(a[11]),
        .b(b[11]),
        .sel(sel),
        .out(out[11])
    );

    mux mux_12(
        .a(a[12]),
        .b(b[12]),
        .sel(sel),
        .out(out[12])
    );

    mux mux_13(
        .a(a[13]),
        .b(b[13]),
        .sel(sel),
        .out(out[13])
    );

    mux mux_14(
        .a(a[14]),
        .b(b[14]),
        .sel(sel),
        .out(out[14])
    );

    mux mux_15(
        .a(a[15]),
        .b(b[15]),
        .sel(sel),
        .out(out[15])
    );
endmodule

`default_nettype wire
