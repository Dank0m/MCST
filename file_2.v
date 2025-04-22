module memory #(
    parameter MEM_SIZE = 6,
    parameter DATA_W = 10,
    parameter ADDR_SIZE = $clog2(MEM_SIZE)
)(
    input wire clk,
    input wire write_flag,
    input wire [DATA_W-1:0] data_in,
    input wire [ADDR_SIZE-1:0] addr_w,
    input wire read_flag,
    input wire [ADDR_SIZE-1:0] addr_r,
    output reg [DATA_W-1:0] data_out
);

reg [DATA_W-1:0] memory [MEM_SIZE-1:0];

always @(posedge clk) begin
    if (write_flag) memory[addr_w] <= data_in;
end

always @(posedge clk) begin
    if (read_flag) data_out <= memory[addr_r];
end

endmodule
