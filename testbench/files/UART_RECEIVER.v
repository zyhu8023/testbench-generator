//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    UART_RECEIVER 
// Module Name:    UART_RECEIVER
// Project Name:   UART
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   D_FLIP_FLOP.v
//                 UART_RECEIVER_COUNTER.v 
//                 UART_RECEIVER_FSM.v 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module UART_RECEIVER (
							 input 				i_sys_clk,
							 input				i_sys_rst,
							 input				i_RX,
							 //input     [15:0] i_receive_count_value,
						    output 		[7:0]	o_receive_data,
							 output  		   o_receive_data_enable,
							 output				o_receive_busy
							 );
							 
wire     w_receive_enable;	
//wire 		w_receive_finish;
								
D_FLIP_FLOP u1(
					.i_trig(i_RX),
					.i_d(1'b1),
					.i_set_n(1'b1),
					.i_clr_n(~i_sys_rst ),
					.o_q(o_receive_busy)
					);
								
//UART_RECEIVER_COUNTER u2(
//								 .i_sys_clk(i_sys_clk),
//								 .i_rst(i_sys_rst | ~o_receive_busy),
//								 .i_receive_count_value(i_receive_count_value),
//								 .o_receive_enable(w_receive_enable),
//								 .o_receive_finish(w_receive_finish)
//								);
		
UART_RECEIVER_FSM u3(
							.i_sys_clk(i_sys_clk),
							.i_sys_rst(i_sys_rst),
							.i_RX(i_RX),
							.i_receive_enable(w_receive_enable),
							.o_receive_data(o_receive_data),
							.o_receive_data_enable(o_receive_data_enable)
							);

endmodule
