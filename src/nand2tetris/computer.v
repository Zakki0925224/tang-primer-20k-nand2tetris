`default_nettype none

module computer(
    input wire clk,
    input wire reset,
    output wire[15:0] debug_pc,
    output wire[15:0] debug_inst,
    output wire[15:0] debug_address_m,
    output wire[15:0] debug_out_m,
    output wire debug_load_m,

    output wire[15:0] mmio_led
);
    reg[15:0] inst;
    wire[15:0] out_m, in_m;
    wire[15:0] pc, address_m;
    wire load_m;

    always @(posedge clk) begin
        inst <= inst_rom(pc);
    end

    cpu cpu_(
        .clk(clk),
        .in_m(in_m),
        .inst(inst),
        .reset(reset),
        .out_m(out_m),
        .load_m(load_m),
        .address_m(address_m),
        .pc(pc)
    );

    memory mem(
        .clk(clk),
        .in(out_m),
        .address(address_m),
        .load(load_m),
        .out(in_m),

        .mmio_led(mmio_led)
    );

    // rom32k
    function[15:0] inst_rom;
        input [15:0] addr;
        begin
            case (addr)
                0:        inst_rom = 16'b0000_0000_0000_0000; // @0 -> NOOP
                1:        inst_rom = 16'b0100_0000_0000_0000; // @16384
                2:        inst_rom = 16'b1110_1111_1100_1111; // M=1
                3:        inst_rom = 16'b0000_0000_0000_0000; // @0
                4:        inst_rom = 16'b1110_1010_1000_0111; // 0;JMP
                // 0: inst_rom = 16'b0_000_0000_0000_0000;           // @0
                // 1: inst_rom = 16'b111_0_110000_010_000;           // D=A :to _D_
                // 2: inst_rom = 16'b111_0_011111_011_000;           // D+1 :to _DM
                // 3: inst_rom = 16'b0_000_0000_0000_0010;       // @2
                // 4: inst_rom = 16'b111_0_101010_000_111;       // 0;JMP
                default:  inst_rom = 16'b0000_0000_0000_0000;
            endcase
        end
    endfunction

    assign debug_pc = pc;
    assign debug_inst = inst;
    assign debug_address_m = address_m;
    assign debug_out_m = out_m;
    assign debug_load_m = load_m;
endmodule

`default_nettype wire
