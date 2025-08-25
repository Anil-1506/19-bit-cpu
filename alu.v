// alu.v
module alu (
    input  [18:0] a,      // 19-bit input A
    input  [18:0] b,      // 19-bit input B
    input  [2:0]  alu_op, // ALU control (3 bits = up to 8 operations)
    output reg [18:0] result,
    output zero            // Flag if result is zero
);

    always @(*) begin
        case (alu_op)
            3'b000: result = a + b;   // ADD
            3'b001: result = a - b;   // SUB
            3'b010: result = a & b;   // AND
            3'b011: result = a | b;   // OR
            3'b100: result = ~a;      // NOT
            3'b101: result = a ^ b;   // XOR
            default: result = 19'b0;
        endcase
    end

    assign zero = (result == 19'b0);

endmodule
