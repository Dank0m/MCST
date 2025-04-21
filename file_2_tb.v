`timescale 1ns/1ns

module memory_tb();

parameter MEM_SIZE = 6;
parameter DATA_W = 10;
localparam ADDR_SIZE = $clog2(MEM_SIZE);

reg clk;
reg write_flag;
reg [DATA_W-1:0] data_in;
reg [ADDR_SIZE-1:0] addr_w;
reg read_flag;
reg [ADDR_SIZE-1:0] addr_r;
wire [DATA_W-1:0] data_out;

memory #(.MEM_SIZE(MEM_SIZE), .DATA_W(DATA_W)) test_module (.clk(clk), .write_flag(write_flag), .data_in(data_in), .addr_w(addr_w), .read_flag(read_flag), .addr_r(addr_r), .data_out(data_out));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpvars;
end

initial begin
    write_flag = 0;
    read_flag = 0;
    data_in = 0;
    addr_w = 0;
    addr_r = 0;
    #10;
    
    write_flag = 1;
    data_in = 10'h123;
    addr_w = 3'b000;
    #10;

    write_flag = 0;
    read_flag = 1;
    addr_r = 3'b000;
    #10;
    
    write_flag = 1;
    read_flag = 1;
    data_in = 10'hABC;
    addr_w = 3'b001;
    addr_r = 3'b001;
    #10;
    
    write_flag = 0;    
    read_flag = 1;
    #10;
    
    read_flag = 0;
    #10;

    write_flag = 1;
    read_flag = 1;
    data_in = 10'h3FF;
    addr_w = 3'b010;
    addr_r = 3'b011;
    #20;
    
    $finish;
end

endmodule