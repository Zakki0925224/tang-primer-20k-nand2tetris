`default_nettype none

module ram8(
    input wire clk,
    input wire[15:0] in,
    input wire[2:0] address,
    input wire load,
    output wire[15:0] out
);
    wire a, b, c, d, e, f, g, h;
    wire out_a, out_b, out_c, out_d, out_e, out_f, out_g, out_h;

    dmux8way dmux_load(
        .in(load),
        .sel(address),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h)
    );

    reg16 reg_0(
        .clk(clk),
        .in(in),
        .load(a),
        .out(out_a)
    );

    reg16 reg_1(
        .clk(clk),
        .in(in),
        .load(b),
        .out(out_b)
    );

    reg16 reg_2(
        .clk(clk),
        .in(in),
        .load(c),
        .out(out_c)
    );

    reg16 reg_3(
        .clk(clk),
        .in(in),
        .load(d),
        .out(out_d)
    );

    reg16 reg_4(
        .clk(clk),
        .in(in),
        .load(e),
        .out(out_e)
    );

    reg16 reg_5(
        .clk(clk),
        .in(in),
        .load(f),
        .out(out_f)
    );

    reg16 reg_6(
        .clk(clk),
        .in(in),
        .load(g),
        .out(out_g)
    );

    reg16 reg_7(
        .clk(clk),
        .in(in),
        .load(h),
        .out(out_h)
    );

    mux8way16 m(
        .a(out_a),
        .b(out_b),
        .c(out_c),
        .d(out_d),
        .e(out_e),
        .f(out_f),
        .g(out_g),
        .h(out_h),
        .sel(address),
        .out(out)
    );
endmodule

`default_nettype wire
