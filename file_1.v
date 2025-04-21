module check_divisibility #(
    parameter DATA_W = 8
)(
    input wire [DATA_W-1:0] data, 
    output reg divisibility
    // output reg sum_even_reg,
    // output reg sum_odd_reg
);

integer i;
integer sum_even, sum_odd;
integer even_count, odd_count;
//integer debug;

always @(*) 
begin
    sum_even = 0; //Сумма битов на четных позициях
    sum_odd = 0;  //Сумма битов на нечетных позициях

    even_count = 0;
    odd_count = 0;
    
    for (i = 0; i < DATA_W; i = i + 1) 
    begin
        if (i % 2 == 0) 
        begin
            sum_even = sum_even + data[i]; //Здесь вычисляем соответственно сумму на четных
            even_count = even_count + 1;
        end 
        else 
        begin
            sum_odd = sum_odd + data[i];   //А здесь на нечетных
            odd_count = odd_count + 1;
        end
    end
    //debag = ((even_count - sum_even) - (odd_count - sum_odd))%3;
    if (data[DATA_W-1] == 0 && (sum_even - sum_odd)%3==0 || data[DATA_W-1] == 1 && (((even_count - sum_even) - (odd_count - sum_odd)))%3==1)
    begin
        divisibility <= 1'b1; 
    end
    else
    begin
        divisibility <= 1'b0; 
    end

    // sum_even_reg <= sum_even;
    // sum_odd_reg <= sum_odd;
    /*Признак делимости на 3 в двоичной системе счисления звучит следующим образом: 
    «Число делится на 3 тогда и только тогда, когда сумма его цифр стоящих на четных местах отличается от суммы цифр, 
    стоящих на нечетных местах, на число, делящееся на 3». Например, 21 = 10101. Для него сумма цифр на 
    нечетных местах равна 1 + 1 + 1 = 3, а на четных — 0 + 0 = 0. Признак выполняется, и число делится на 3.
    */
end

endmodule