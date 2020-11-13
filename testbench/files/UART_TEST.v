//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    UART_TEST
// Module Name:    UART_TEST
// Project Name:   UART
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   UART_RECEIVER.v 
//                 UART_TRANSMITTER.v 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module UART_TEST (
						input 				i_sys_clk,
						input				   i_sys_rst,
						input 				i_RX,
						output				o_TX
							 );

wire [7:0] w_data;
wire 		  w_data_enable;

parameter  sys_clk_fre_value = 50000000;//50MHz
parameter  baud_rate_clk_fre_value = 9600;//Baud rate = 9600
parameter  receive_count_value  = sys_clk_fre_value/baud_rate_clk_fre_value/2-1;
parameter  transmit_count_value = sys_clk_fre_value/baud_rate_clk_fre_value/2-1;		 

UART_RECEIVER u1(
					  .i_sys_clk(i_sys_clk),
					  .i_sys_rst(~i_sys_rst),
					  .i_RX(i_RX),
					  .i_receive_count_value(receive_count_value),
					  .o_receive_data(w_data),
					  .o_receive_data_enable(w_data_enable),
					  .o_receive_busy()
							 );

UART_TRANSMITTER u2(
						  .i_sys_clk(i_sys_clk),
						  .i_sys_rst(~i_sys_rst),
						  .i_transmit_data(w_data),
						  .i_transmit_data_enable(w_data_enable),
						  .i_transmit_count_value(transmit_count_value),
						  .o_transmit_busy(),
						  .o_TX(o_TX)
							 );
							 						
endmodule
