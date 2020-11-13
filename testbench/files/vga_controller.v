/////////////////////////////////////////////////////////////////////////////
//Altera ATPP������� ��о�Ƽ� Я�� ��Ȩͬѧ ��ͬ���� FPGA������ϵ��
//����Ӳ��ƽ̨�� Altera Cyclone IV FPGA 
//�����׼��ͺţ� SF-CY4 ��Ȩ����
//��   Ȩ  ��   ���� �������ɡ�����ǳ����תFPGA�����ߡ���Ȩͬѧ��ԭ����
//				����SF-CY4�����׼�ѧϰʹ�ã�лл֧��
//�ٷ��Ա����̣� http://myfpga.taobao.com/
//�����������أ� http://pan.baidu.com/s/1jGpMIJc
//��                ˾�� �Ϻ�������ӿƼ����޹�˾
/////////////////////////////////////////////////////////////////////////////
module vga_controller(
			input clk_25m,	//PLL���25MHzʱ��
			input clk_50m,	//PLL���50MHzʱ��
			input clk_65m,	//PLL���65MHzʱ��
			input clk_108m,	//PLL���108MHzʱ��
			input clk_130m,	//PLL���130MHzʱ��
			input rst_n,	//��λ�źţ��͵�ƽ��Ч
			output vga_r,	//VGA��ʾɫ��R
			output vga_g,	//VGA��ʾɫ��G
			output vga_b,	//VGA��ʾɫ��B
			output reg vga_hsy,	//VGA��ʾ��ͬ���ź�
			output reg vga_vsy	//VGA��ʾ��ͬ���ź�
		);

//-----------------------------------------------------------
wire clk;

//-----------------------------------------------------------
//`define VGA_640_480
`define VGA_800_600
//`define VGA_1024_768
//`define VGA_1280_960
//`define VGA_1280_1024
//`define VGA_1920_1080

//-----------------------------------------------------------
`ifdef VGA_640_480
	//VGA Timing 640*480 & 25MHz & 60Hz
	assign clk = clk_25m;
		
	parameter VGA_HTT = 12'd800-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd96;		//Hor Sync  Time
	parameter VGA_HBP = 12'd48;//+12'd16;		//Hor Back Porch
	parameter VGA_HVT = 12'd640;	//Hor Valid Time
	parameter VGA_HFP = 12'd16;		//Hor Front Porch

	parameter VGA_VTT = 12'd525-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd2;		//Ver Sync Time
	parameter VGA_VBP = 12'd33;//-12'd4;		//Ver Back Porch
	parameter VGA_VVT = 12'd480;	//Ver Valid Time
	parameter VGA_VFP = 12'd10;		//Ver Front Porch
	
	parameter VGA_CORBER = 12'd80;	//8�ȷ���Color bar��ʾ
`endif

`ifdef VGA_800_600
	//VGA Timing 800*600 & 50MHz & 72Hz
	assign clk = clk_50m;

	parameter VGA_HTT = 12'd1040-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd120;		//Hor Sync  Time
	parameter VGA_HBP = 12'd64;		//Hor Back Porch
	parameter VGA_HVT = 12'd800;	//Hor Valid Time
	parameter VGA_HFP = 12'd56;		//Hor Front Porch

	parameter VGA_VTT = 12'd666-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd6;		//Ver Sync Time
	parameter VGA_VBP = 12'd23;		//Ver Back Porch
	parameter VGA_VVT = 12'd600;	//Ver Valid Time
	parameter VGA_VFP = 12'd37;		//Ver Front Porch
		
	parameter VGA_CORBER = 12'd100;	//8�ȷ���Color bar��ʾ
`endif

`ifdef VGA_1024_768
	//VGA Timing 1024*768 & 65MHz & 60Hz
	assign clk = clk_65m;

	parameter VGA_HTT = 12'd1344-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd136;		//Hor Sync  Time
	parameter VGA_HBP = 12'd160;		//Hor Back Porch
	parameter VGA_HVT = 12'd1024;	//Hor Valid Time
	parameter VGA_HFP = 12'd24;		//Hor Front Porch

	parameter VGA_VTT = 12'd806-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd6;		//Ver Sync Time
	parameter VGA_VBP = 12'd29;		//Ver Back Porch
	parameter VGA_VVT = 12'd768;	//Ver Valid Time
	parameter VGA_VFP = 12'd3;		//Ver Front Porch
		
	parameter VGA_CORBER = 12'd128;	//8�ȷ���Color bar��ʾ
`endif

`ifdef VGA_1280_960
	//VGA Timing 1280*1024 & 108MHz & 60Hz
	assign clk = clk_108m;

	parameter VGA_HTT = 12'd1800-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd112;		//Hor Sync  Time
	parameter VGA_HBP = 12'd312;		//Hor Back Porch
	parameter VGA_HVT = 12'd1280;	//Hor Valid Time
	parameter VGA_HFP = 12'd96;		//Hor Front Porch

	parameter VGA_VTT = 12'd1000-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd3;		//Ver Sync Time
	parameter VGA_VBP = 12'd36;		//Ver Back Porch
	parameter VGA_VVT = 12'd960;	//Ver Valid Time
	parameter VGA_VFP = 12'd1;		//Ver Front Porch
		
	parameter VGA_CORBER = 12'd160;	//8�ȷ���Color bar��ʾ
`endif

`ifdef VGA_1280_1024
	//VGA Timing 1280*1024 & 108MHz & 60Hz
	assign clk = clk_108m;

	parameter VGA_HTT = 12'd1688-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd112;		//Hor Sync  Time
	parameter VGA_HBP = 12'd248;		//Hor Back Porch
	parameter VGA_HVT = 12'd1280;	//Hor Valid Time
	parameter VGA_HFP = 12'd48;		//Hor Front Porch

	parameter VGA_VTT = 12'd1066-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd3;		//Ver Sync Time
	parameter VGA_VBP = 12'd38;		//Ver Back Porch
	parameter VGA_VVT = 12'd1024;	//Ver Valid Time
	parameter VGA_VFP = 12'd1;		//Ver Front Porch
		
	parameter VGA_CORBER = 12'd160;	//8�ȷ���Color bar��ʾ
`endif

`ifdef VGA_1920_1080
	//VGA Timing 1920*1080 & 130MHz & 60Hz
	assign clk = clk_130m;

	parameter VGA_HTT = 12'd2000-12'd1;	//Hor Total Time
	parameter VGA_HST = 12'd12;		//Hor Sync  Time
	parameter VGA_HBP = 12'd40;		//Hor Back Porch
	parameter VGA_HVT = 12'd1920;	//Hor Valid Time
	parameter VGA_HFP = 12'd28;		//Hor Front Porch

	parameter VGA_VTT = 12'd1105-12'd1;	//Ver Total Time
	parameter VGA_VST = 12'd4;		//Ver Sync Time
	parameter VGA_VBP = 12'd18;		//Ver Back Porch
	parameter VGA_VVT = 12'd1080;	//Ver Valid Time
	parameter VGA_VFP = 12'd3;		//Ver Front Porch
		
	parameter VGA_CORBER = 12'd240;	//8�ȷ���Color bar��ʾ
`endif

//-----------------------------------------------------------
	//x��y���������
reg[11:0] xcnt;
reg[11:0] ycnt;
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) xcnt <= 12'd0;
	else if(xcnt >= VGA_HTT) xcnt <= 12'd0;
	else xcnt <= xcnt+1'b1;

always @(posedge clk or negedge rst_n)
	if(!rst_n) ycnt <= 12'd0;
	else if(xcnt == VGA_HTT) begin
		if(ycnt >= VGA_VTT) ycnt <= 12'd0;
		else ycnt <= ycnt+1'b1;
	end
	else ;
		
//-----------------------------------------------------------
	//�С���ͬ���ź�����
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_hsy <= 1'b0;
	else if(xcnt < VGA_HST) vga_hsy <= 1'b1;
	else vga_hsy <= 1'b0;
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_vsy <= 1'b0;
	else if(ycnt < VGA_VST) vga_vsy <= 1'b1;
	else vga_vsy <= 1'b0;	
	
//-----------------------------------------------------------	
	//��ʾ��Ч�����־�ź�����
reg vga_valid;	//��ʾ�����ڣ����źŸߵ�ƽ

always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_valid <= 1'b0;
	else if((xcnt >= (VGA_HST+VGA_HBP)) && (xcnt < (VGA_HST+VGA_HBP+VGA_HVT))
				&& (ycnt >= (VGA_VST+VGA_VBP)) && (ycnt < (VGA_VST+VGA_VBP+VGA_VVT)))
		 vga_valid <= 1'b1;
	else vga_valid <= 1'b0;
	
//-----------------------------------------------------------
	//��ʾɫ�������߼�
reg vga_rdb;	//Rɫ��
reg vga_gdb;	//Gɫ��
reg vga_bdb;	//Bɫ��

always @(posedge clk or negedge rst_n)
	if(!rst_n) begin
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;
	end
	else if(xcnt == (VGA_HST+VGA_HBP)) begin	//��ʾ��һ��Ϊ��ɫ
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(xcnt == (VGA_HST+VGA_HBP+VGA_HVT-1'b1)) begin	//��ʾ���һ��Ϊ��ɫ
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(ycnt == (VGA_VST+VGA_VBP)) begin	//��ʾ��һ��Ϊ��ɫ
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;			
	end
	else if(ycnt == (VGA_VST+VGA_VBP+VGA_VVT-1'b1)) begin	//��ʾ���һ��Ϊ��ɫ
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER)) begin		//��ʾ��1��Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��2��Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b1;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��3��Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��4��Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b1;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��5��Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;	
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��6��Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b1;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��7��Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//��ʾ��8��Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b1;	
	end
	else begin
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;	
	end

assign vga_r = vga_valid ? vga_rdb:1'b0;
assign vga_g = vga_valid ? vga_gdb:1'b0;	
assign vga_b = vga_valid ? vga_bdb:1'b0;	
	
endmodule

