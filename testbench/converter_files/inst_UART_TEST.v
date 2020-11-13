
`timescale 1ns/1ns
module UART_TEST_tb ();
                
reg     i_sys_clk;
reg     i_sys_rst;
reg     i_RX;
wire    o_TX;


initial 
    begin

    end

UART_TEST#(
    .sys_clk_fre_value      (50000000                                     ),
    .baud_rate_clk_fre_value(9600                                         ),
    .receive_count_value    (sys_clk_fre_value/baud_rate_clk_fre_value/2-1),
    .transmit_count_value   (sys_clk_fre_value/baud_rate_clk_fre_value/2-1)
) inst_UART_TEST(
    .i_sys_clk(i_sys_clk),
    .i_sys_rst(i_sys_rst),
    .i_RX     (i_RX     ),
    .o_TX     (o_TX     )
);
endmodule
    
