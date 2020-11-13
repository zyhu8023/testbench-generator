
`timescale 1ns/1ns
module BCD_COUNTER_tb ();
                
reg           i_time_clk;
reg           i_sys_rst;
reg    [3:0]	 i_mod_value;
reg           i_count_carry_in;
wire   [3:0]	 o_count;
wire          o_count_carry_out;


initial 
    begin

    end

BCD_COUNTER inst_BCD_COUNTER(
    .i_time_clk       (i_time_clk       ),
    .i_sys_rst        (i_sys_rst        ),
    .i_mod_value      (i_mod_value      ),
    .i_count_carry_in (i_count_carry_in ),
    .o_count          (o_count          ),
    .o_count_carry_out(o_count_carry_out)
);
endmodule
    
