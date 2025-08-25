// control.v
module control (
    input  [4:0] opcode,
    output reg reg_write,
    output reg [2:0] alu_op
);

    always @(*) begin
        case (opcode)
            5'b00000: begin // ADD
                reg_write = 1;
                alu_op = 3'b000;
            end
            5'b00001: begin // SUB
                reg_write = 1;
                alu_op = 3'b001;
            end
            5'b00010: begin // AND
                reg_write = 1;
                alu_op = 3'b010;
            end
            5'b00011: begin // OR
                reg_write = 1;
                alu_op = 3'b011;
            end
            default: begin
                reg_write = 0;
                alu_op = 3'b000;
            end
        endcase
    end

endmodule
