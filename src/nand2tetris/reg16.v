`default_nettype none

module reg16(
    input wire clk,
    input wire[15:0] in,
    input wire load,
    output wire[15:0] out
);
    bit bit_0(
        .clk(clk),
        .in(in[0]),
        .load(load),
        .out(out[0])
    );

    bit bit_1(
        .clk(clk),
        .in(in[1]),
        .load(load),
        .out(out[1])
    );

    bit bit_2(
        .clk(clk),
        .in(in[2]),
        .load(load),
        .out(out[2])
    );

    bit bit_3(
        .clk(clk),
        .in(in[3]),
        .load(load),
        .out(out[3])
    );

    bit bit_4(
        .clk(clk),
        .in(in[4]),
        .load(load),
        .out(out[4])
    );

    bit bit_5(
        .clk(clk),
        .in(in[5]),
        .load(load),
        .out(out[5])
    );

    bit bit_6(
        .clk(clk),
        .in(in[6]),
        .load(load),
        .out(out[6])
    );

    bit bit_7(
        .clk(clk),
        .in(in[7]),
        .load(load),
        .out(out[7])
    );

    bit bit_8(
        .clk(clk),
        .in(in[8]),
        .load(load),
        .out(out[8])
    );

    bit bit_9(
        .clk(clk),
        .in(in[9]),
        .load(load),
        .out(out[9])
    );

    bit bit_10(
        .clk(clk),
        .in(in[10]),
        .load(load),
        .out(out[10])
    );

    bit bit_11(
        .clk(clk),
        .in(in[11]),
        .load(load),
        .out(out[11])
    );

    bit bit_12(
        .clk(clk),
        .in(in[12]),
        .load(load),
        .out(out[12])
    );

    bit bit_13(
        .clk(clk),
        .in(in[13]),
        .load(load),
        .out(out[13])
    );

    bit bit_14(
        .clk(clk),
        .in(in[14]),
        .load(load),
        .out(out[14])
    );

    bit bit_15(
        .clk(clk),
        .in(in[15]),
        .load(load),
        .out(out[15])
    );
endmodule

`default_nettype wire
