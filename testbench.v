// testbench.v
module testbench;
    reg clk, reset;

    top CPU (.clk(clk), .reset(reset));

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, testbench);
        clk = 0;
        reset = 1;
        #5 reset = 0;

        #100 $finish;
    end

    always #5 clk = ~clk; // clock toggle
endmodule
