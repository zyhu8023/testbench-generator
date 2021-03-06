/////////////////////////////////////////////////////////////////////////////
//Altera ATPP合作伙伴 至芯科技 携手 特权同学 共同打造 FPGA开发板系列
//工程硬件平台： Altera Cyclone IV FPGA 
//开发套件型号： SF-CY4 特权打造
//版   权  申   明： 本例程由《深入浅出玩转FPGA》作者“特权同学”原创，
//				仅供SF-CY4开发套件学习使用，谢谢支持
//官方淘宝店铺： http://myfpga.taobao.com/
//最新资料下载： http://pan.baidu.com/s/1jGpMIJc
//公                司： 上海或与电子科技有限公司
/////////////////////////////////////////////////////////////////////////////
module vga_controller(
			input clk_25m,	//PLL输出25MHz时钟
			input clk_50m,	//PLL输出50MHz时钟
			input clk_65m,	//PLL输出65MHz时钟
			input clk_108m,	//PLL输出108MHz时钟
			input clk_130m,	//PLL输出130MHz时钟
			input rst_n,	//复位信号，低电平有效
			output vga_r,	//VGA显示色彩R
			output vga_g,	//VGA显示色彩G
			output vga_b,	//VGA显示色彩B
			output reg vga_hsy,	//VGA显示行同步信号
			output reg vga_vsy	//VGA显示场同步信号
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
	
	parameter VGA_CORBER = 12'd80;	//8等分做Color bar显示
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
		
	parameter VGA_CORBER = 12'd100;	//8等分做Color bar显示
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
		
	parameter VGA_CORBER = 12'd128;	//8等分做Color bar显示
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
		
	parameter VGA_CORBER = 12'd160;	//8等分做Color bar显示
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
		
	parameter VGA_CORBER = 12'd160;	//8等分做Color bar显示
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
		
	parameter VGA_CORBER = 12'd240;	//8等分做Color bar显示
`endif

//-----------------------------------------------------------
	//x和y坐标计数器
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
	//行、场同步信号生成
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_hsy <= 1'b0;
	else if(xcnt < VGA_HST) vga_hsy <= 1'b1;
	else vga_hsy <= 1'b0;
	
always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_vsy <= 1'b0;
	else if(ycnt < VGA_VST) vga_vsy <= 1'b1;
	else vga_vsy <= 1'b0;	
	
//-----------------------------------------------------------	
	//显示有效区域标志信号生成
reg vga_valid;	//显示区域内，该信号高电平

always @(posedge clk or negedge rst_n)
	if(!rst_n) vga_valid <= 1'b0;
	else if((xcnt >= (VGA_HST+VGA_HBP)) && (xcnt < (VGA_HST+VGA_HBP+VGA_HVT))
				&& (ycnt >= (VGA_VST+VGA_VBP)) && (ycnt < (VGA_VST+VGA_VBP+VGA_VVT)))
		 vga_valid <= 1'b1;
	else vga_valid <= 1'b0;
	
//-----------------------------------------------------------
	//显示色彩生产逻辑
reg vga_rdb;	//R色彩
reg vga_gdb;	//G色彩
reg vga_bdb;	//B色彩

always @(posedge clk or negedge rst_n)
	if(!rst_n) begin
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;
	end
	else if(xcnt == (VGA_HST+VGA_HBP)) begin	//显示第一行为绿色
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(xcnt == (VGA_HST+VGA_HBP+VGA_HVT-1'b1)) begin	//显示最后一行为绿色
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(ycnt == (VGA_VST+VGA_VBP)) begin	//显示第一列为绿色
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;			
	end
	else if(ycnt == (VGA_VST+VGA_VBP+VGA_VVT-1'b1)) begin	//显示最后一列为绿色
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;		
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER)) begin		//显示第1个Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER)) begin		//显示第2个Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b1;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第3个Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第4个Color bar
		vga_rdb <= 1'b0;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b1;
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第5个Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b0;	
	end	
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第6个Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b0;
		vga_bdb <= 1'b1;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第7个Color bar
		vga_rdb <= 1'b1;
		vga_gdb <= 1'b1;
		vga_bdb <= 1'b0;	
	end
	else if(xcnt <= (VGA_HST+VGA_HBP+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER+VGA_CORBER)) begin		//显示第8个Color bar
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

