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
//驱动VGA显示器，显示8个色彩的Color bar
module cy4(
			input ext_clk_25m,	//外部输入25MHz时钟信号
			input ext_rst_n,	//外部输入复位信号，低电平有效
			output vga_r,	//VGA显示色彩R
			output vga_g,	//VGA显示色彩G
			output vga_b,	//VGA显示色彩B
			output vga_hsy,	//VGA显示行同步信号
			output vga_vsy	//VGA显示场同步信号
		);													

//-------------------------------------
//PLL例化
wire clk_25m;	//PLL输出25MHz时钟
wire clk_50m;	//PLL输出50MHz时钟
wire clk_65m;	//PLL输出65MHz时钟
wire clk_108m;	//PLL输出108MHz时钟
wire clk_130m;	//PLL输出130MHz时钟
wire sys_rst_n;	//PLL输出的locked信号，作为FPGA内部的复位信号，低电平复位，高电平正常工作

pll_controller	pll_controller_inst (
	.areset ( !ext_rst_n ),
	.inclk0 ( ext_clk_25m ),
	.c0 ( clk_25m ),
	.c1 ( clk_50m ),
	.c2 ( clk_65m ),
	.c3 ( clk_108m ),
	.c4 ( clk_130m ),
	.locked ( sys_rst_n )
	);
		

//-------------------------------------
//VGA驱动时序产生，显示Color bar

vga_controller	uut_vga_controller(
				.clk_25m(clk_25m),
				.clk_50m(clk_50m),
				.clk_65m(clk_65m),
				.clk_108m(clk_108m),
				.clk_130m(clk_130m),
				.rst_n(sys_rst_n),
				.vga_r(vga_r),
				.vga_g(vga_g),
				.vga_b(vga_b),
				.vga_hsy(vga_hsy),
				.vga_vsy(vga_vsy)
			);
			
//-------------------------------------




endmodule

