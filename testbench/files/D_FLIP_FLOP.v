//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    D_FLIP_FLOP 
// Module Name:    D_FLIP_FLOP 
// Project Name:   Monostable_Trigger	
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   -
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: DE0 Board Input Freguency = 50 MHz
//                      Destiny Output  Freguency =  1 Hz
//
//////////////////////////////////////////////////////////////////////////////////
module D_FLIP_FLOP (
						  input 			i_trig,
						  input			i_d,
						  input			i_set_n,
						  input			i_clr_n,
						  output reg	o_q
						 );
								

always @ (negedge i_set_n or negedge i_clr_n or negedge i_trig)
begin
	if( !i_set_n )begin
		o_q <= 1'b1;
	end else begin
		if( !i_clr_n )begin
			o_q <= 1'b0;
		end else begin
			o_q <= i_d;
		end			
	end
end

endmodule
