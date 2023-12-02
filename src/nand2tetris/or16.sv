`default_nettype none

module or16(
    input wire[15:0] a,
    input wire[15:0] b,
    output wire[15:0] out
);
    _or or_gate_0(
        .a(a[0]),
        .b(b[0]),
        .out(out[0])
    );
    _or or_gate_1(
        .a(a[1]),
        .b(b[1]),
        .out(out[1])
    );
    _or or_gate_2(
        .a(a[2]),
        .b(b[2]),
        .out(out[2])
    );
    _or or_gate_3(
        .a(a[3]),
        .b(b[3]),
        .out(out[3])
    );
    _or or_gate_4(
        .a(a[4]),
        .b(b[4]),
        .out(out[4])
    );
    _or or_gate_5(
        .a(a[5]),
        .b(b[5]),
        .out(out[5])
    );
    _or or_gate_6(
        .a(a[6]),
        .b(b[6]),
        .out(out[6])
    );
    _or or_gate_7(
        .a(a[7]),
        .b(b[7]),
        .out(out[7])
    );
    _or or_gate_8(
        .a(a[8]),
        .b(b[8]),
        .out(out[8])
    );
    _or or_gate_9(
        .a(a[9]),
        .b(b[9]),
        .out(out[9])
    );
    _or or_gate_10(
        .a(a[10]),
        .b(b[10]),
        .out(out[10])
    );
    _or or_gate_11(
        .a(a[11]),
        .b(b[11]),
        .out(out[11])
    );
    _or or_gate_12(
        .a(a[12]),
        .b(b[12]),
        .out(out[12])
    );
    _or or_gate_13(
        .a(a[13]),
        .b(b[13]),
        .out(out[13])
    );
    _or or_gate_14(
        .a(a[14]),
        .b(b[14]),
        .out(out[14])
    );
    _or or_gate_15(
        .a(a[15]),
        .b(b[15]),
        .out(out[15])
    );
endmodule

`default_nettype wire
