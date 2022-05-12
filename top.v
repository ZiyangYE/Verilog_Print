module top(
    input clk,
    output txp
);

`include "print.v"

defparam tx.uart_freq=115200;
defparam tx.clk_freq=27000000;

assign txp=uart_txp;
assign print_clk = clk;

reg[31:0] cnt;

always@(posedge clk) begin
    cnt<=cnt+32'd1;
    if(cnt==32'd54_000_000)
        cnt<=32'd0;

    if(cnt==32'd0)
        `print("Hello World!\n",STR);
    
    if(cnt==32'd27_000_000)
        `print(128'h0123456789abcdeffedcba9876543210,16);//16 Byte Data
end

endmodule
