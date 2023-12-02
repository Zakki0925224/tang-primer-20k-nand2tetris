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
                0:        inst_rom = 16'b0000_0000_0011_0101; // @53
                1:        inst_rom = 16'b1110_1100_0001_0000; // D=A
                2:        inst_rom = 16'b0100_0000_0000_0000; // @16384
                3:        inst_rom = 16'b1110_0011_0000_1000; // M=D
                4:        inst_rom = 16'b0000_0000_0000_0101; // @5
                5:        inst_rom = 16'b1110_1010_1000_0111; // 0;JMP
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
