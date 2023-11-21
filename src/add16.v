`default_nettype none

module add16(
    input wire[15:0] a,
    input wire[15:0] b,
    output wire[15:0] out
);
    wire[15:0] carry;
    wire null;

    half_addr half_addr(
        .a(a[0]),
        .b(b[0]),
        .sum(out[0]),
        .carry(carry[0])
    );

    full_addr full_addr_0(
        .a(a[1]),
        .b(b[1]),
        .c(carry[0]),
        .sum(out[1]),
        .carry(carry[1])
    );

    full_addr full_addr_1(
        .a(a[2]),
        .b(b[2]),
        .c(carry[1]),
        .sum(out[2]),
        .carry(carry[2])
    );

    full_addr full_addr_2(
        .a(a[3]),
        .b(b[3]),
        .c(carry[2]),
        .sum(out[3]),
        .carry(carry[3])
    );

    full_addr full_addr_3(
        .a(a[4]),
        .b(b[4]),
        .c(carry[3]),
        .sum(out[4]),
        .carry(carry[4])
    );

    full_addr full_addr_4(
        .a(a[5]),
        .b(b[5]),
        .c(carry[4]),
        .sum(out[5]),
        .carry(carry[5])
    );

    full_addr full_addr_5(
        .a(a[6]),
        .b(b[6]),
        .c(carry[5]),
        .sum(out[6]),
        .carry(carry[6])
    );

    full_addr full_addr_6(
        .a(a[7]),
        .b(b[7]),
        .c(carry[6]),
        .sum(out[7]),
        .carry(carry[7])
    );

    full_addr full_addr_7(
        .a(a[8]),
        .b(b[8]),
        .c(carry[7]),
        .sum(out[8]),
        .carry(carry[8])
    );

    full_addr full_addr_8(
        .a(a[9]),
        .b(b[9]),
        .c(carry[8]),
        .sum(out[9]),
        .carry(carry[9])
    );

    full_addr full_addr_9(
        .a(a[10]),
        .b(b[10]),
        .c(carry[9]),
        .sum(out[10]),
        .carry(carry[10])
    );

    full_addr full_addr_10(
        .a(a[11]),
        .b(b[11]),
        .c(carry[10]),
        .sum(out[11]),
        .carry(carry[11])
    );

    full_addr full_addr_11(
        .a(a[12]),
        .b(b[12]),
        .c(carry[11]),
        .sum(out[12]),
        .carry(carry[12])
    );

    full_addr full_addr_12(
        .a(a[13]),
        .b(b[13]),
        .c(carry[12]),
        .sum(out[13]),
        .carry(carry[13])
    );

    full_addr full_addr_13(
        .a(a[14]),
        .b(b[14]),
        .c(carry[13]),
        .sum(out[14]),
        .carry(carry[14])
    );

    full_addr full_addr_14(
        .a(a[15]),
        .b(b[15]),
        .c(carry[14]),
        .sum(out[15]),
        .carry(null)
    );
endmodule

`default_nettype wire
