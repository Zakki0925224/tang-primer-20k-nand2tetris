`default_nettype none

module reg16(
    input wire clk,
    input wire[15:0] in,
    input wire load,
    output wire[15:0] out
);
    _bit bit_0(
        .clk(clk),
        .in(in[0]),
        .load(load),
        .out(out[0])
    );

    _bit bit_1(
        .clk(clk),
        .in(in[1]),
        .load(load),
        .out(out[1])
    );

    _bit bit_2(
        .clk(clk),
        .in(in[2]),
        .load(load),
        .out(out[2])
    );

    _bit bit_3(
        .clk(clk),
        .in(in[3]),
        .load(load),
        .out(out[3])
    );

    _bit bit_4(
        .clk(clk),
        .in(in[4]),
        .load(load),
        .out(out[4])
    );

    _bit bit_5(
        .clk(clk),
        .in(in[5]),
        .load(load),
        .out(out[5])
    );

    _bit bit_6(
        .clk(clk),
        .in(in[6]),
        .load(load),
        .out(out[6])
    );

    _bit bit_7(
        .clk(clk),
        .in(in[7]),
        .load(load),
        .out(out[7])
    );

    _bit bit_8(
        .clk(clk),
        .in(in[8]),
        .load(load),
        .out(out[8])
    );

    _bit bit_9(
        .clk(clk),
        .in(in[9]),
        .load(load),
        .out(out[9])
    );

    _bit bit_10(
        .clk(clk),
        .in(in[10]),
        .load(load),
        .out(out[10])
    );

    _bit bit_11(
        .clk(clk),
        .in(in[11]),
        .load(load),
        .out(out[11])
    );

    _bit bit_12(
        .clk(clk),
        .in(in[12]),
        .load(load),
        .out(out[12])
    );

    _bit bit_13(
        .clk(clk),
        .in(in[13]),
        .load(load),
        .out(out[13])
    );

    _bit bit_14(
        .clk(clk),
        .in(in[14]),
        .load(load),
        .out(out[14])
    );

    _bit bit_15(
        .clk(clk),
        .in(in[15]),
        .load(load),
        .out(out[15])
    );
endmodule

`default_nettype wire
