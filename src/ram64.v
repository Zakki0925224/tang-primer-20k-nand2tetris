`default_nettype none

module ram64(
    input wire clk,
    input wire[15:0] in,
    input wire[5:0] address,
    input wire load,
    output wire[15:0] out
);
    wire load_a, load_b, load_c, load_d, load_e, load_f, load_g, load_h;
    wire out_a, out_b, out_c, out_d, out_e, out_f, out_g, out_h;

    dmux8way dmux_load(
        .in(load),
        .sel(address[5:3]),
        .a(load_a),
        .b(load_b),
        .c(load_c),
        .d(load_d),
        .e(load_e),
        .f(load_f),
        .g(load_g),
        .h(load_h)
    );

    ram8 ram8_0(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_a),
        .out(out_a)
    );

    ram8 ram8_1(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_b),
        .out(out_b)
    );

    ram8 ram8_2(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_c),
        .out(out_c)
    );

    ram8 ram8_3(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_d),
        .out(out_d)
    );

    ram8 ram8_4(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_e),
        .out(out_e)
    );

    ram8 ram8_5(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_f),
        .out(out_f)
    );

    ram8 ram8_6(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_g),
        .out(out_g)
    );

    ram8 ram8_7(
        .clk(clk),
        .in(in),
        .address(address[2:0]),
        .load(load_h),
        .out(out_h)
    );

    mux8way16 mux_out(
        .a(out_a),
        .b(out_b),
        .c(out_c),
        .d(out_d),
        .e(out_e),
        .f(out_f),
        .g(out_g),
        .h(out_h),
        .sel(address[5:3]),
        .out(out)
    );
endmodule
`default_nettype wire
