module computer(
    input wire clk,
    input wire reset,
    output wire[14:0] debug_pc,
    output wire[15:0] debug_inst,
    output wire[14:0] debug_address_mem,
    output wire[15:0] debug_out_mem,
    output wire debug_write_mem
);
    reg[15:0] inst;
    wire[15:0] out_mem, in_mem;
    wire[14:0] pc, address_mem;
    wire write_mem;

    always @(posedge clk) begin
        inst <= inst_rom(pc);
    end

    cpu cpu_(
        .clk(clk),
        .in_mem(in_mem),
        .inst(inst),
        .reset(reset),
        .out_mem(out_mem),
        .write_mem(write_mem),
        .address_mem(address_mem),
        .pc(pc)
    );

    ram2k ram(
        .clk(clk),
        .in(out_mem),
        .address(address_mem),
        .load(write_mem),
        .out(in_mem)
    );

    function[15:0] inst_rom;
        input [15:0] addr;
        begin
            case (addr)
                0: inst_rom = 16'b0_000_0000_0000_0000;           // @0
                1: inst_rom = 16'b111_0_110000_010_000;           // D=A :to _D_
                2: inst_rom = 16'b111_0_011111_011_000;           // D+1 :to _DM
                31250: inst_rom = 16'b0_000_0000_0000_0010;       // @2
                31251: inst_rom = 16'b111_0_101010_000_111;       // 0;JMP
                default : inst_rom = 16'b0_000_0000_0000_0000;    // NOP(@0)
            endcase
        end
    endfunction

    assign debug_pc = pc;
    assign debug_inst = inst;
    assign debug_address_mem = address_mem;
    assign debug_out_mem = out_mem;
    assign debug_write_mem = write_mem;
endmodule
