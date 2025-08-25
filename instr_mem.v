module instr_mem(
    input  [18:0] addr,       // PC address (19-bit)
    output [18:0] instr       // Instruction output (19-bit)
);

    reg [18:0] mem [0:255];   // Small instruction memory (256 x 19)

    initial begin
        // Program:
        // Encoding example (fixed 19-bit format for demo)
        // opcode[18:15], rd[14:12], rs1[11:9], rs2[8:6], imm[5:0]

        // ADD R1, R0, R0
        mem[0] = 19'b0000001000000000000;  

        // ADDI R2, R1, #5
        mem[1] = 19'b0001010001000000101;  

        // SW R2 -> MEM[100]
        mem[2] = 19'b0010000010001100100; 

        // LW R3 <- MEM[100]
        mem[3] = 19'b0011001100001100100; 

        // SUB R4, R3, R1
        mem[4] = 19'b0100100011001000000;  

        // NOP (halt)
        mem[5] = 19'b1111000000000000000;
    end

    // Use lower 8 bits of PC as index (256 instructions max)
    assign instr = mem[addr[7:0]];  
endmodule
