module top (
    input clk,
    input reset
);
    wire [18:0] pc_out, next_pc;
    wire [18:0] instr;
    wire [4:0] opcode = instr[18:14];
    wire [2:0] rs1 = instr[13:11];
    wire [2:0] rs2 = instr[10:8];
    wire [2:0] rd  = instr[7:5];

    wire [18:0] rd1, rd2, alu_result;
    wire zero, reg_write;
    wire [2:0] alu_op;

    // Program Counter
    // FIX: increment is now explicitly 19-bit
    pc PC (.clk(clk), .reset(reset), .next_pc(pc_out + 19'd1), .pc_out(pc_out));

    // Instruction Memory
    instr_mem IM (.addr(pc_out), .instr(instr));

    // Control Unit
    control CU (.opcode(opcode), .reg_write(reg_write), .alu_op(alu_op));

    // Register File
    regfile RF (.clk(clk), .we(reg_write), .ra1(rs1), .ra2(rs2),
                .wa(rd), .wd(alu_result), .rd1(rd1), .rd2(rd2));

    // ALU
    alu ALU (.a(rd1), .b(rd2), .alu_op(alu_op),
             .result(alu_result), .zero(zero));

endmodule
