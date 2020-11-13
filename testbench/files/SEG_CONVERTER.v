//////////////////////////////////////////////////////////////////////////////////
// INSTITUTION:    Xidian University
// DESIGNER:       Yuan Xiaoguang & Ren Aifeng    
// 
// Create Date:    16:53:58 02/14/2016 
// Design Name:    SEG_CONVERTER 
// Module Name:    SEG_CONVERTER
// Project Name:   Water_Lamp
// Target Devices: EP3C16F484C6
// Tool versions:  Quartus II 13.1
// Design Lauguage:Verilog-HDL
// Dependencies:   -
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: For LED DISPLAY
//                      
//
//////////////////////////////////////////////////////////////////////////////////
module SEG_CONVERTER (
									input 	 [3:0]	i_time_val,
									input					i_sys_rst,
									output reg[6:0]	o_seg_display_val
								);
								
				
always @ (i_sys_rst or i_time_val)
begin
	if( i_sys_rst )begin
		o_seg_display_val <= 7'b100_0000;
	end else begin
		case( i_time_val )
			4'h0: o_seg_display_val <= 7'b100_0000;
			4'h1: o_seg_display_val <= 7'b111_1001;
			4'h2: o_seg_display_val <= 7'b010_0100;
			4'h3: o_seg_display_val <= 7'b011_0000;
			4'h4: o_seg_display_val <= 7'b001_1001;
			4'h5: o_seg_display_val <= 7'b001_0010;
			4'h6: o_seg_display_val <= 7'b000_0010;
			4'h7: o_seg_display_val <= 7'b111_1000;
			4'h8: o_seg_display_val <= 7'b000_0000;
			4'h9: o_seg_display_val <= 7'b001_0000;
			4'ha: o_seg_display_val <= 7'b000_1000;
			4'hb: o_seg_display_val <= 7'b000_0011;
			4'hc: o_seg_display_val <= 7'b010_0111;
			4'hd: o_seg_display_val <= 7'b010_0001;
			4'he: o_seg_display_val <= 7'b000_0110;
			4'hf: o_seg_display_val <= 7'b000_1110;
			default: o_seg_display_val <= 7'b111_1111;
		endcase			
	end
end

endmodule
