
`timescale 1ns/1ns
module darkuart_tb ();
                
reg              CLK;
reg              RES;
reg              RD;
reg              WR;
reg    [ 3:0]    BE;
reg    [31:0]    DATAI;
wire   [31:0]    DATAO;
wire             IRQ;
reg              RXD;
wire             TXD;
wire   [3:0]     DEBUG;


initial 
    begin

    end

darkuart inst_darkuart(
    .CLK  (CLK  ),
    .RES  (RES  ),
    .RD   (RD   ),
    .WR   (WR   ),
    .BE   (BE   ),
    .DATAI(DATAI),
    .DATAO(DATAO),
    .IRQ  (IRQ  ),
    .RXD  (RXD  ),
    .TXD  (TXD  ),
    .DEBUG(DEBUG)
);
endmodule
    
