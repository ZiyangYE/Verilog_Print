`timescale 1ns/1ns
module tb;

reg clk=0;
always #5 clk=!clk;

`include "print.v"

defparam tx.uart_freq=1;
defparam tx.clk_freq=1;

assign print_clk = clk;

initial begin
    #100;
    @(posedge clk);
    `print("Hello World!\n",STR);
    #200;
    @(posedge clk);
    `print(32'h12345678,4);//4bytes
    #3000;
    $stop();
end


endmodule
