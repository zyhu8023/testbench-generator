
`timescale 1ns/1ns
module D_FLIP_FLOP_tb ();
                
reg     i_trig;
reg     i_d;
reg     i_set_n;
reg     i_clr_n;
wire    o_q;


initial 
    begin

    end

D_FLIP_FLOP inst_D_FLIP_FLOP(
    .i_trig (i_trig ),
    .i_d    (i_d    ),
    .i_set_n(i_set_n),
    .i_clr_n(i_clr_n),
    .o_q    (o_q    )
);
endmodule
    
