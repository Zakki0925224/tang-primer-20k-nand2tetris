`default_nettype none

module pc(
    input wire clk,
    input wire[15:0] in,
    input wire inc,
    input wire load,
    input wire reset,
    output wire[15:0] out
);
    wire[15:0] reg_out, inc_out, reg_or_inc_out, load_out, reset_out;

    inc16 inc_inc_out(
        .in(reg_out),
        .out(inc_out)
    );

    mux16 mux_reg_or_inc_out(
        .a(reg_out),
        .b(inc_out),
        .sel(inc),
        .out(reg_or_inc_out)
    );

    mux16 mux_load_out(
        .a(reg_or_inc_out),
        .b(in),
        .sel(load),
        .out(load_out)
    );

    mux16 mux_reset_out(
        .a(load_out),
        .b(16'b0),
        .sel(reset),
        .out(reset_out)
    );

    reg16 r(
        .clk(clk),
        .in(reset_out),
        .load(1'b1),
        .out(out)
    );

    assign reg_out = out;
endmodule

`default_nettype wire
