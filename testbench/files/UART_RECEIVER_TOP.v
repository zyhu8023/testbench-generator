//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    UART_RECEIVER_TOP
// Module Name:    UART_RECEIVER_TOP
// Project Name:   UART
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   UART_RECEIVER.v 
//                 UART_RECEIVER_DATA_DISPLAY.v 
//                 UART_RECEIVER_TIME_DISPLAY.v 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module UART_RECEIVER_TOP (
						input 				i_sys_clk,
						input				   i_sys_rst,
						input 				i_RX,
						output 	  [6:0]	o_seg_display_val_a,
						output     [6:0]  o_seg_display_val_b
//						output 	  [6:0]	o_seg_display_val_c,
//						output     [6:0]  o_seg_display_val_d
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
					  //.i_receive_count_value(receive_count_value),
					  .o_receive_data(w_data),
					  .o_receive_data_enable(w_data_enable),
					  .o_receive_busy()
						);
							 
UART_RECEIVER_DATA_DISPLAY u2(
									  .i_sys_clk(i_sys_clk),
									  .i_sys_rst(~i_sys_rst),
									  .i_receive_data(w_data),
									  .i_receive_data_enable(w_data_enable),
									  .o_seg_display_val_a(o_seg_display_val_a),
									  .o_seg_display_val_b(o_seg_display_val_b)
									 );							 
 
//UART_RECEIVER_TIME_DISPLAY u3(
//										.i_sys_clk(i_sys_clk),
//										.i_sys_rst(~i_sys_rst),
//										.i_receive_data_enable(w_data_enable),
//										.o_seg_display_val_c(o_seg_display_val_c),
//										.o_seg_display_val_d(o_seg_display_val_d)
//											 );
							 						
endmodule
