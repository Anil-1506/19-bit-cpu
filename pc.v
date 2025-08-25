// pc.v
module pc (
    input clk,
    input reset,
    input [18:0] next_pc,
    output reg [18:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 19'b0;
        else
            pc_out <= next_pc;
    end

endmodule
