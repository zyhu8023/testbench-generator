//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    UART_RECEIVER_COUNTER 
// Module Name:    UART_RECEIVER_COUNTER
// Project Name:   UART
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   -
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module UART_RECEIVER_COUNTER (
									input 				i_sys_clk,
									input					i_rst,
									input     [15:0]  i_receive_count_value,
									output 		reg	o_receive_enable,
									output      reg   o_receive_finish
								);
								

reg [15:0] r_receive_count;
reg [4:0]  r_receive_count_2;
			
always @ (posedge i_rst or posedge i_sys_clk)
begin
	if( i_rst )begin
		r_receive_count <= 16'd0;
		r_receive_count_2 <= 5'd0;
	end else begin
		if( r_receive_count == i_receive_count_value )begin
			r_receive_count <= 16'd0;			
			r_receive_count_2 <= r_receive_count_2 + 5'd1;
		end else begin
			r_receive_count <= r_receive_count + 16'd1;
		end
	end
end

always @ (posedge i_rst or posedge i_sys_clk)
begin
	if( i_rst )begin
		o_receive_enable <= 1'b0;
		o_receive_finish <= 1'b0;
	end else begin
		case (r_receive_count_2)
			5'd0: begin o_receive_enable <= 1'b0; end
			5'd1: begin o_receive_enable <= 1'b0; end
			5'd2: begin o_receive_enable <= 1'b0; end
			5'd3: begin o_receive_enable <= 1'b1; end//bit0
			5'd4: begin o_receive_enable <= 1'b0; end
			5'd5: begin o_receive_enable <= 1'b1; end//bit1
			5'd6: begin o_receive_enable <= 1'b0; end
			5'd7: begin o_receive_enable <= 1'b1; end//bit2
			5'd8: begin o_receive_enable <= 1'b0; end
			5'd9: begin o_receive_enable <= 1'b1; end//bit3
			5'd10:begin o_receive_enable <= 1'b0; end
			5'd11:begin o_receive_enable <= 1'b1; end//bit4
			5'd12:begin o_receive_enable <= 1'b0; end
			5'd13:begin o_receive_enable <= 1'b1; end//bit5
			5'd14:begin o_receive_enable <= 1'b0; end
			5'd15:begin o_receive_enable <= 1'b1; end//bit6
			5'd16:begin o_receive_enable <= 1'b0; end
			5'd17:begin o_receive_enable <= 1'b1; end//bit7
			5'd18:begin o_receive_enable <= 1'b0; end
			5'd19:begin o_receive_enable <= 1'b0; //end
//			5'd20:begin o_receive_enable <= 1'b0; 
							o_receive_finish <= 1'b1; end
			default:begin end
		endcase	
	end	
end

endmodule
