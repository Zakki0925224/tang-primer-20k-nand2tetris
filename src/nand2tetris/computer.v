`default_nettype none

module computer(
    input wire clk,
    input wire reset,
    output wire[15:0] debug_pc,
    output wire[15:0] debug_inst,
    output wire[15:0] debug_address_mem,
    output wire[15:0] debug_out_mem,
    output wire debug_write_mem,

    output wire[15:0] mmio_led
);
    reg[15:0] inst;
    wire[15:0] out_mem, in_mem;
    wire[15:0] pc, address_mem;
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

    memory mem(
        .clk(clk),
        .in(out_mem),
        .address(address_mem),
        .load(write_mem),
        .out(in_mem),

        .mmio_led(mmio_led)
    );

    // rom32k
    function[15:0] inst_rom;
        input [15:0] addr;
        begin
            case (addr)
                // 0:        inst_rom = 16'b0100_0000_0000_0000; // @16384
                // 1:        inst_rom = 16'b1110_1111_1100_1111; // M=1
                // 2:        inst_rom = 16'b1110_1010_1000_1000; // M=0
                // 3:        inst_rom = 16'b0000_0000_0000_0000; // @0
                // 4:        inst_rom = 16'b1110_1010_1000_0111; // 0;JMP
                // default : inst_rom = 16'b0000_0000_0000_0000; // @0
                // 0:        inst_rom = 16'b0100_0000_0000_0001;
                // 1:        inst_rom = 16'b1110_1111_1100_1000;
                // 2:        inst_rom = 16'b0100_0000_0000_0001;
                // 3:        inst_rom = 16'b1111_1100_0010_0000;
                // 4:        inst_rom = 16'b1110_1110_1000_1000;
                // 5:        inst_rom = 16'b1110_1101_1110_0000;
                // 6:        inst_rom = 16'b1111_1100_0001_0000;
                // 7:        inst_rom = 16'b1111_1100_0010_0000;
                // 8:        inst_rom = 16'b1110_0011_0000_1000;
                // 9:        inst_rom = 16'b0000_0000_0000_0010;
                // 10:       inst_rom = 16'b1110_1010_1000_0111;
                default:  inst_rom = 16'b0000_0000_0000_0000;
            endcase
        end
    endfunction

    assign debug_pc = pc;
    assign debug_inst = inst;
    assign debug_address_mem = address_mem;
    assign debug_out_mem = out_mem;
    assign debug_write_mem = write_mem;
endmodule

`default_nettype wire
