
`timescale 1ns/1ns
module UART_RECEIVER_FSM_tb ();
                
reg     i_sys_clk;
reg     i_sys_rst;
reg     i_RX;
reg     i_receive_enable;
wire    reg[7:0];
wire    o_receive_data_enable;


initial 
    begin

    end

UART_RECEIVER_FSM#(
    .IDLE(5'd0)
) inst_UART_RECEIVER_FSM(
    .i_sys_clk            (i_sys_clk            ),
    .i_sys_rst            (i_sys_rst            ),
    .i_RX                 (i_RX                 ),
    .i_receive_enable     (i_receive_enable     ),
    .reg[7:0]             (reg[7:0]             ),
    .o_receive_data_enable(o_receive_data_enable)
);
endmodule
    
