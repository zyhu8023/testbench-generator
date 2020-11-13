//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    UART_RECEIVER_FSM 
// Module Name:    UART_RECEIVER_FSM
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
module UART_RECEIVER_FSM (
									input 				i_sys_clk,
									input					i_sys_rst,
									input					i_RX,
									input					i_receive_enable,
									output 	reg[7:0]	o_receive_data,
									output   reg 	   o_receive_data_enable
								);
								
reg 		  r_receive_enable;
reg        r_receive_data_enable;
reg  [7:0] r_receive_data;
reg  [3:0] r_delay_count;
wire	     w_receive_enable = i_receive_enable & ~r_receive_enable;
wire	     w_receive_data_even_bit = ~r_receive_data_enable;
wire 	     w_receive_data_odd_bit  =  r_receive_data_enable;
reg [4:0]  r_state,r_next_state;

parameter  	IDLE       = 5'd0,
				D0REICEIVE = 5'd1, 
				D1REICEIVE = 5'd2, 
				D2REICEIVE = 5'd3, 
				D3REICEIVE = 5'd4, 
				D4REICEIVE = 5'd5, 
				D5REICEIVE = 5'd6, 
				D6REICEIVE = 5'd7, 
				D7REICEIVE = 5'd8,
				DATAIN	  = 5'd9,
				DATAOUT    = 5'd10,
				END		  = 5'd11;
					
always @ (posedge i_sys_rst or posedge i_sys_clk)
begin
	if( i_sys_rst )begin
		r_receive_enable <= 1'b0;
	end else begin
		r_receive_enable <= i_receive_enable;
	end	
end		

always @ (posedge i_sys_rst or posedge i_sys_clk)
begin
	if( i_sys_rst )begin
		r_state <= IDLE;
	end else begin
		r_state <= r_next_state;
	end	
end

always @ (r_state or w_receive_enable or i_receive_enable)
begin
	case(r_state)
		IDLE:begin
			if(w_receive_enable)
				r_next_state = D0REICEIVE;
			else
				r_next_state = IDLE;
		end
		D0REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D1REICEIVE;
			else
				r_next_state = D0REICEIVE;
		end
		D1REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D2REICEIVE;
			else
				r_next_state = D1REICEIVE;
		end
		D2REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D3REICEIVE;
			else
				r_next_state = D2REICEIVE;
		end
		D3REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D4REICEIVE;
			else
				r_next_state = D3REICEIVE;
		end
		D4REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D5REICEIVE;
			else
				r_next_state = D4REICEIVE;
		end
		D5REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D6REICEIVE;
			else
				r_next_state = D5REICEIVE;
		end
		D6REICEIVE:begin
			if(w_receive_enable)
				r_next_state = D7REICEIVE;
			else
				r_next_state = D6REICEIVE;
		end
		D7REICEIVE:begin
			//if(w_receive_enable)
				r_next_state = DATAIN;
			//else
			//	r_next_state = D7REICEIVE;
		end
		DATAIN:begin
				r_next_state = DATAOUT;
		end
		DATAOUT:begin
				r_next_state = END;
		end		
		END:begin
//			if(!i_receive_enable)
				r_next_state = IDLE;
//			else
//				r_next_state = END;
		end
		default:begin
			r_next_state = IDLE;
		end
	endcase
end

always @ (posedge i_sys_rst or posedge i_sys_clk)
begin
	if( i_sys_rst )begin
		o_receive_data <= 8'd0;
		o_receive_data_enable <= 1'b0;
		r_receive_data_enable <= 1'b0;
		r_receive_data <= 8'd0;
//		r_delay_count <= 4'd14;
	end else begin
		case (r_state)
		IDLE:begin 
//						if(r_delay_count!=4'd14)begin
//							r_delay_count <= r_delay_count +4'd1;
//						end	
//						case( r_delay_count )
//							4'd9:begin o_receive_data_enable <= 1'b1; end
//							4'd14:begin o_receive_data_enable <= 1'b0; end
//							default:begin end
//						endcase
						o_receive_data_enable <= 1'b0;
						r_receive_data_enable <= 1'b0; 
			  end
		D0REICEIVE:begin 
						if( w_receive_data_even_bit )begin
							r_receive_data[0] <= i_RX;
							r_receive_data_enable <= 1'b1;
						end										  
					 end
		D1REICEIVE:begin 
						if( w_receive_data_odd_bit )begin
							r_receive_data[1] <= i_RX;
							r_receive_data_enable <= 1'b0;
						end										  
					 end
		D2REICEIVE:begin 
						if( w_receive_data_even_bit )begin
							r_receive_data[2] <= i_RX;
							r_receive_data_enable <= 1'b1;
						end										  
					 end
		D3REICEIVE:begin 
						if( w_receive_data_odd_bit )begin
							r_receive_data[3] <= i_RX;
							r_receive_data_enable <= 1'b0;
						end										  
					 end	
		D4REICEIVE:begin 
						if( w_receive_data_even_bit )begin
							r_receive_data[4] <= i_RX;
							r_receive_data_enable <= 1'b1;
						end										  
					 end
		D5REICEIVE:begin 
						if( w_receive_data_odd_bit )begin
							r_receive_data[5] <= i_RX;
							r_receive_data_enable <= 1'b0;
						end										  
					 end
		D6REICEIVE:begin 
						if( w_receive_data_even_bit )begin
							r_receive_data[6] <= i_RX;
							r_receive_data_enable <= 1'b1;
						end										  
					 end
		D7REICEIVE:begin 
						if( w_receive_data_odd_bit )begin
							r_receive_data[7] <= i_RX;
							r_receive_data_enable <= 1'b0;
						end										  
					 end
		DATAIN:begin 
						o_receive_data <= r_receive_data; 
				end			 
		DATAOUT:begin 
						o_receive_data_enable <= 1'b1; 
				end
		END:begin  end
		default:begin end
		endcase
	end	
end

endmodule
