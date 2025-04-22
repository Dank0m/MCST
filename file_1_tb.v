`timescale 1ns/1ns

module check_divisibility_tb();

parameter DATA_W = 8;
reg [DATA_W-1:0] data;
wire divisibility;

check_divisibility #(.DATA_W(DATA_W)) test_module (.data(data), .divisibility(divisibility));

//Таймер по ТЗ не предусмотрен

initial begin
    $dumpvars;
end

initial begin
    data = 8'b00000011;  // 3
    #10;
    
    data = 8'b00000110;  // 6
    #10;
    
    data = 8'b11111101;  // -3
    #10;
    
    data = 8'b11111010;  // -6 
    #10;
    
    data = 8'b00000001;  // 1
    #10;
    
    data = 8'b11111111;  // -1
    #10;
    
    data = 8'b00000100;  // 4
    #10;
    
    data = 8'b11111100;  // -4
    #10;
    
    $finish;
end

endmodule