module data_mem (
    input clk,
    input mem_write,       // control signal for write
    input mem_read,        // control signal for read
    input [18:0] addr,     // 19-bit address
    input [18:0] write_data,
    output reg [18:0] read_data
);

    reg [18:0] memory [0:255]; // 256 words of 19-bit memory

    always @(posedge clk) begin
        if (mem_write)
            memory[addr] <= write_data;   // Write on clock edge
    end

    always @(*) begin
        if (mem_read)
            read_data = memory[addr];     // Read combinationally
        else
            read_data = 19'b0;
    end

endmodule
