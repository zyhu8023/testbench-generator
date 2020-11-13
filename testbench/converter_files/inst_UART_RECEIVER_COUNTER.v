
`timescale 1ns/1ns
module UART_RECEIVER_COUNTER_tb ();
                
reg             i_sys_clk;
reg             i_rst;
reg    [15:0]   i_receive_count_value;
wire            o_receive_enable;
wire            o_receive_finish;


initial 
    begin

    end

UART_RECEIVER_COUNTER inst_UART_RECEIVER_COUNTER(
    .i_sys_clk            (i_sys_clk            ),
    .i_rst                (i_rst                ),
    .i_receive_count_value(i_receive_count_value),
    .o_receive_enable     (o_receive_enable     ),
    .o_receive_finish     (o_receive_finish     )
);
endmodule
    
