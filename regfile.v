// regfile.v
module regfile (
    input clk,
    input we,                // Write enable
    input [2:0] ra1, ra2,    // Read addresses
    input [2:0] wa,          // Write address
    input [18:0] wd,         // Write data
    output [18:0] rd1, rd2   // Read data
);

    reg [18:0] regs[7:0];

    // Read (asynchronous)
    assign rd1 = regs[ra1];
    assign rd2 = regs[ra2];

    // Write (synchronous)
    always @(posedge clk) begin
        if (we) regs[wa] <= wd;
    end

endmodule
