`default_nettype none

module nand_tb;

    reg a = 0;
    reg b = 0;
    wire out;

    _nand dut(
        .a(a),
        .b(b),
        .out(out)
    );

    task display;
        #1 $display("| %1b | %1b | %1b |\n", a,b,out);
    endtask

    initial begin
        $display("| a | b |out|\n");

        a=0;b=0;
        display();

        a=0;b=1;
        display();

        a=1;b=0;
        display();

        a=1;b=1;
        display();
        $finish();
    end

endmodule

`default_nettype wire
