
`timescale 1ns/1ns
module UART_RECEIVER_TOP_tb ();
                
reg            i_sys_clk;
reg            i_sys_rst;
reg            i_RX;
wire   [6:0]	  o_seg_display_val_a;
wire   [6:0]   o_seg_display_val_b;


initial 
    begin

    end

UART_RECEIVER_TOP#(
    .sys_clk_fre_value      (50000000                                     ),
    .baud_rate_clk_fre_value(9600                                         ),
    .receive_count_value    (sys_clk_fre_value/baud_rate_clk_fre_value/2-1),
    .transmit_count_value   (sys_clk_fre_value/baud_rate_clk_fre_value/2-1)
) inst_UART_RECEIVER_TOP(
    .i_sys_clk          (i_sys_clk          ),
    .i_sys_rst          (i_sys_rst          ),
    .i_RX               (i_RX               ),
    .o_seg_display_val_a(o_seg_display_val_a),
    .o_seg_display_val_b(o_seg_display_val_b)
);
endmodule
    
