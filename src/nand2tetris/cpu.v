`default_nettype none

module cpu(
    input wire clk,
    input wire[15:0] in_m,
    input wire[15:0] inst,
    input wire reset,
    output wire[15:0] out_m,
    output wire load_m,
    output wire[15:0] address_m,
    output wire[15:0] pc
);
    wire is_a_inst;
    _not not_is_a_inst(
        .in(inst[15]),
        .out(is_a_inst)
    );

    wire[15:0] alu_out, to_a;
    mux16 mux16_to_a(
        .a(alu_out),
        .b(inst),
        .sel(is_a_inst),
        .out(to_a)
    );

    wire is_a_load;
    wire[15:0] a_out;
    _or or_is_a_load(
        .a(is_a_inst),
        .b(inst[5]),
        .out(is_a_load)
    );

    reg16 reg_a(
        .clk(clk),
        .in(to_a),
        .load(is_a_load),
        .out(a_out)
    );

    assign address_m = a_out;

    wire is_comp_a_on;
    wire[15:0] a_mem;

    _and and_is_comp_a_on(
        .a(inst[15]),
        .b(inst[12]),
        .out(is_comp_a_on)
    );

    mux16 mux16_a_mem(
        .a(a_out),
        .b(in_m),
        .sel(is_comp_a_on),
        .out(a_mem)
    );

    wire alu_out_is_zero, alu_out_is_nega;
    wire[15:0] d_out;
    alu alu_(
        .x(d_out),
        .y(a_mem),
        .zx(inst[11]),
        .nx(inst[10]),
        .zy(inst[9]),
        .ny(inst[8]),
        .f(inst[7]),
        .no(inst[6]),
        .out(alu_out),
        .zr(alu_out_is_zero),
        .ng(alu_out_is_nega)
    );

    assign out_m = alu_out;

    wire is_d_load;
    _and and_is_d_load(
        .a(inst[15]),
        .b(inst[4]),
        .out(is_d_load)
    );

    reg16 reg_d(
        .clk(clk),
        .in(alu_out),
        .load(is_d_load),
        .out(d_out)
    );

    _and and_load_m(
        .a(inst[15]),
        .b(inst[3]),
        .out(load_m)
    );

    wire is_positive, is_not_zero;
    _not not_is_positive(
        .in(alu_out_is_nega),
        .out(is_positive)
    );

    _not not_is_not_zero(
        .in(alu_out_is_zero),
        .out(is_not_zero)
    );

    wire inst_jgt, is_gt;
    _and and_inst_jgt(
        .a(inst[15]),
        .b(inst[0]),
        .out(inst_jgt)
    );

    _and and_is_gt(
        .a(is_positive),
        .b(is_not_zero),
        .out(is_gt)
    );

    wire is_pc_load_jgt;
    _and and_is_pc_load_jgt(
        .a(inst_jgt),
        .b(is_gt),
        .out(is_pc_load_jgt)
    );

    wire inst_jeq;
    _and and_inst_jeq(
        .a(inst[15]),
        .b(inst[1]),
        .out(inst_jeq)
    );

    wire is_pc_load_jeq;
    _and and_is_pc_load_jeq(
        .a(inst_jeq),
        .b(alu_out_is_zero),
        .out(is_pc_load_jeq)
    );

    wire inst_jlt;
    _and and_inst_jlt(
        .a(inst[15]),
        .b(inst[2]),
        .out(inst_jlt)
    );

    wire is_pc_load_jlt;
    _and and_is_pc_load_jlt(
        .a(inst_jlt),
        .b(alu_out_is_nega),
        .out(is_pc_load_jlt)
    );

    wire is_pc_load_jge;
    _or or_is_pc_load_jge(
        .a(is_pc_load_jgt),
        .b(is_pc_load_jeq),
        .out(is_pc_load_jge)
    );

    wire is_pc_load;
    _or or_is_pc_load(
        .a(is_pc_load_jlt),
        .b(is_pc_load_jge),
        .out(is_pc_load)
    );

    wire[15:0] pc_out;
    pc pc_(
        .clk(clk),
        .in(a_out),
        .load(is_pc_load),
        .inc(1'b1),
        .reset(reset),
        .out(pc_out)
    );
    assign pc = pc_out;
endmodule
`default_nettype wire
