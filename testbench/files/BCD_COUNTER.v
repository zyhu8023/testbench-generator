/////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    BCD_COUNTER
// Module Name:    BCD_COUNTER 
// Project Name:   Timer
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   -
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: MOD 10 Counter
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module BCD_COUNTER (
									input 				i_time_clk,
									input					i_sys_rst,
									input		  [3:0]	i_mod_value,
									input  				i_count_carry_in,
									output reg [3:0]	o_count,
									output reg			o_count_carry_out
								);
								
always @ (posedge i_sys_rst or posedge i_time_clk)
begin
	if( i_sys_rst )begin
		o_count <= 4'd0;
		o_count_carry_out <= 1'b0;
	end else begin
		if(i_count_carry_in)begin
			if( o_count == i_mod_value )begin
				o_count <= 4'd0;
				o_count_carry_out <= 1'b1;
			end else begin
				o_count <= o_count + 4'd1;
				o_count_carry_out <= 1'b0;
			end
		end	
	end
end

endmodule
