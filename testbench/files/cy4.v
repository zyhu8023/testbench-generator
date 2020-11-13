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
//����VGA��ʾ������ʾ8��ɫ�ʵ�Color bar
module cy4(
			input ext_clk_25m,	//�ⲿ����25MHzʱ���ź�
			input ext_rst_n,	//�ⲿ���븴λ�źţ��͵�ƽ��Ч
			output vga_r,	//VGA��ʾɫ��R
			output vga_g,	//VGA��ʾɫ��G
			output vga_b,	//VGA��ʾɫ��B
			output vga_hsy,	//VGA��ʾ��ͬ���ź�
			output vga_vsy	//VGA��ʾ��ͬ���ź�
		);													

//-------------------------------------
//PLL����
wire clk_25m;	//PLL���25MHzʱ��
wire clk_50m;	//PLL���50MHzʱ��
wire clk_65m;	//PLL���65MHzʱ��
wire clk_108m;	//PLL���108MHzʱ��
wire clk_130m;	//PLL���130MHzʱ��
wire sys_rst_n;	//PLL�����locked�źţ���ΪFPGA�ڲ��ĸ�λ�źţ��͵�ƽ��λ���ߵ�ƽ��������

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
//VGA����ʱ���������ʾColor bar

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

