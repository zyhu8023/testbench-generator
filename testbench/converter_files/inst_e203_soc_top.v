
`timescale 1ns/1ns
module e203_soc_top_tb ();
                
reg     hfextclk;
wire    hfxoscen;
reg     lfextclk;
wire    lfxoscen;
reg     io_pads_jtag_TCK_i_ival;
reg     io_pads_jtag_TMS_i_ival;
reg     io_pads_jtag_TDI_i_ival;
wire    io_pads_jtag_TDO_o_oval;
wire    io_pads_jtag_TDO_o_oe;
reg     io_pads_gpio_0_i_ival;
wire    io_pads_gpio_0_o_oval;
wire    io_pads_gpio_0_o_oe;
wire    io_pads_gpio_0_o_ie;
wire    io_pads_gpio_0_o_pue;
wire    io_pads_gpio_0_o_ds;
reg     io_pads_gpio_1_i_ival;
wire    io_pads_gpio_1_o_oval;
wire    io_pads_gpio_1_o_oe;
wire    io_pads_gpio_1_o_ie;
wire    io_pads_gpio_1_o_pue;
wire    io_pads_gpio_1_o_ds;
reg     io_pads_gpio_2_i_ival;
wire    io_pads_gpio_2_o_oval;
wire    io_pads_gpio_2_o_oe;
wire    io_pads_gpio_2_o_ie;
wire    io_pads_gpio_2_o_pue;
wire    io_pads_gpio_2_o_ds;
reg     io_pads_gpio_3_i_ival;
wire    io_pads_gpio_3_o_oval;
wire    io_pads_gpio_3_o_oe;
wire    io_pads_gpio_3_o_ie;
wire    io_pads_gpio_3_o_pue;
wire    io_pads_gpio_3_o_ds;
reg     io_pads_gpio_4_i_ival;
wire    io_pads_gpio_4_o_oval;
wire    io_pads_gpio_4_o_oe;
wire    io_pads_gpio_4_o_ie;
wire    io_pads_gpio_4_o_pue;
wire    io_pads_gpio_4_o_ds;
reg     io_pads_gpio_5_i_ival;
wire    io_pads_gpio_5_o_oval;
wire    io_pads_gpio_5_o_oe;
wire    io_pads_gpio_5_o_ie;
wire    io_pads_gpio_5_o_pue;
wire    io_pads_gpio_5_o_ds;
reg     io_pads_gpio_6_i_ival;
wire    io_pads_gpio_6_o_oval;
wire    io_pads_gpio_6_o_oe;
wire    io_pads_gpio_6_o_ie;
wire    io_pads_gpio_6_o_pue;
wire    io_pads_gpio_6_o_ds;
reg     io_pads_gpio_7_i_ival;
wire    io_pads_gpio_7_o_oval;
wire    io_pads_gpio_7_o_oe;
wire    io_pads_gpio_7_o_ie;
wire    io_pads_gpio_7_o_pue;
wire    io_pads_gpio_7_o_ds;
reg     io_pads_gpio_8_i_ival;
wire    io_pads_gpio_8_o_oval;
wire    io_pads_gpio_8_o_oe;
wire    io_pads_gpio_8_o_ie;
wire    io_pads_gpio_8_o_pue;
wire    io_pads_gpio_8_o_ds;
reg     io_pads_gpio_9_i_ival;
wire    io_pads_gpio_9_o_oval;
wire    io_pads_gpio_9_o_oe;
wire    io_pads_gpio_9_o_ie;
wire    io_pads_gpio_9_o_pue;
wire    io_pads_gpio_9_o_ds;
reg     io_pads_gpio_10_i_ival;
wire    io_pads_gpio_10_o_oval;
wire    io_pads_gpio_10_o_oe;
wire    io_pads_gpio_10_o_ie;
wire    io_pads_gpio_10_o_pue;
wire    io_pads_gpio_10_o_ds;
reg     io_pads_gpio_11_i_ival;
wire    io_pads_gpio_11_o_oval;
wire    io_pads_gpio_11_o_oe;
wire    io_pads_gpio_11_o_ie;
wire    io_pads_gpio_11_o_pue;
wire    io_pads_gpio_11_o_ds;
reg     io_pads_gpio_12_i_ival;
wire    io_pads_gpio_12_o_oval;
wire    io_pads_gpio_12_o_oe;
wire    io_pads_gpio_12_o_ie;
wire    io_pads_gpio_12_o_pue;
wire    io_pads_gpio_12_o_ds;
reg     io_pads_gpio_13_i_ival;
wire    io_pads_gpio_13_o_oval;
wire    io_pads_gpio_13_o_oe;
wire    io_pads_gpio_13_o_ie;
wire    io_pads_gpio_13_o_pue;
wire    io_pads_gpio_13_o_ds;
reg     io_pads_gpio_14_i_ival;
wire    io_pads_gpio_14_o_oval;
wire    io_pads_gpio_14_o_oe;
wire    io_pads_gpio_14_o_ie;
wire    io_pads_gpio_14_o_pue;
wire    io_pads_gpio_14_o_ds;
reg     io_pads_gpio_15_i_ival;
wire    io_pads_gpio_15_o_oval;
wire    io_pads_gpio_15_o_oe;
wire    io_pads_gpio_15_o_ie;
wire    io_pads_gpio_15_o_pue;
wire    io_pads_gpio_15_o_ds;
reg     io_pads_gpio_16_i_ival;
wire    io_pads_gpio_16_o_oval;
wire    io_pads_gpio_16_o_oe;
wire    io_pads_gpio_16_o_ie;
wire    io_pads_gpio_16_o_pue;
wire    io_pads_gpio_16_o_ds;
reg     io_pads_gpio_17_i_ival;
wire    io_pads_gpio_17_o_oval;
wire    io_pads_gpio_17_o_oe;
wire    io_pads_gpio_17_o_ie;
wire    io_pads_gpio_17_o_pue;
wire    io_pads_gpio_17_o_ds;
reg     io_pads_gpio_18_i_ival;
wire    io_pads_gpio_18_o_oval;
wire    io_pads_gpio_18_o_oe;
wire    io_pads_gpio_18_o_ie;
wire    io_pads_gpio_18_o_pue;
wire    io_pads_gpio_18_o_ds;
reg     io_pads_gpio_19_i_ival;
wire    io_pads_gpio_19_o_oval;
wire    io_pads_gpio_19_o_oe;
wire    io_pads_gpio_19_o_ie;
wire    io_pads_gpio_19_o_pue;
wire    io_pads_gpio_19_o_ds;
reg     io_pads_gpio_20_i_ival;
wire    io_pads_gpio_20_o_oval;
wire    io_pads_gpio_20_o_oe;
wire    io_pads_gpio_20_o_ie;
wire    io_pads_gpio_20_o_pue;
wire    io_pads_gpio_20_o_ds;
reg     io_pads_gpio_21_i_ival;
wire    io_pads_gpio_21_o_oval;
wire    io_pads_gpio_21_o_oe;
wire    io_pads_gpio_21_o_ie;
wire    io_pads_gpio_21_o_pue;
wire    io_pads_gpio_21_o_ds;
reg     io_pads_gpio_22_i_ival;
wire    io_pads_gpio_22_o_oval;
wire    io_pads_gpio_22_o_oe;
wire    io_pads_gpio_22_o_ie;
wire    io_pads_gpio_22_o_pue;
wire    io_pads_gpio_22_o_ds;
reg     io_pads_gpio_23_i_ival;
wire    io_pads_gpio_23_o_oval;
wire    io_pads_gpio_23_o_oe;
wire    io_pads_gpio_23_o_ie;
wire    io_pads_gpio_23_o_pue;
wire    io_pads_gpio_23_o_ds;
reg     io_pads_gpio_24_i_ival;
wire    io_pads_gpio_24_o_oval;
wire    io_pads_gpio_24_o_oe;
wire    io_pads_gpio_24_o_ie;
wire    io_pads_gpio_24_o_pue;
wire    io_pads_gpio_24_o_ds;
reg     io_pads_gpio_25_i_ival;
wire    io_pads_gpio_25_o_oval;
wire    io_pads_gpio_25_o_oe;
wire    io_pads_gpio_25_o_ie;
wire    io_pads_gpio_25_o_pue;
wire    io_pads_gpio_25_o_ds;
reg     io_pads_gpio_26_i_ival;
wire    io_pads_gpio_26_o_oval;
wire    io_pads_gpio_26_o_oe;
wire    io_pads_gpio_26_o_ie;
wire    io_pads_gpio_26_o_pue;
wire    io_pads_gpio_26_o_ds;
reg     io_pads_gpio_27_i_ival;
wire    io_pads_gpio_27_o_oval;
wire    io_pads_gpio_27_o_oe;
wire    io_pads_gpio_27_o_ie;
wire    io_pads_gpio_27_o_pue;
wire    io_pads_gpio_27_o_ds;
reg     io_pads_gpio_28_i_ival;
wire    io_pads_gpio_28_o_oval;
wire    io_pads_gpio_28_o_oe;
wire    io_pads_gpio_28_o_ie;
wire    io_pads_gpio_28_o_pue;
wire    io_pads_gpio_28_o_ds;
reg     io_pads_gpio_29_i_ival;
wire    io_pads_gpio_29_o_oval;
wire    io_pads_gpio_29_o_oe;
wire    io_pads_gpio_29_o_ie;
wire    io_pads_gpio_29_o_pue;
wire    io_pads_gpio_29_o_ds;
reg     io_pads_gpio_30_i_ival;
wire    io_pads_gpio_30_o_oval;
wire    io_pads_gpio_30_o_oe;
wire    io_pads_gpio_30_o_ie;
wire    io_pads_gpio_30_o_pue;
wire    io_pads_gpio_30_o_ds;
reg     io_pads_gpio_31_i_ival;
wire    io_pads_gpio_31_o_oval;
wire    io_pads_gpio_31_o_oe;
wire    io_pads_gpio_31_o_ie;
wire    io_pads_gpio_31_o_pue;
wire    io_pads_gpio_31_o_ds;
wire    io_pads_qspi_sck_o_oval;
wire    io_pads_qspi_cs_0_o_oval;
reg     io_pads_qspi_dq_0_i_ival;
wire    io_pads_qspi_dq_0_o_oval;
wire    io_pads_qspi_dq_0_o_oe;
wire    io_pads_qspi_dq_0_o_ie;
wire    io_pads_qspi_dq_0_o_pue;
wire    io_pads_qspi_dq_0_o_ds;
reg     io_pads_qspi_dq_1_i_ival;
wire    io_pads_qspi_dq_1_o_oval;
wire    io_pads_qspi_dq_1_o_oe;
wire    io_pads_qspi_dq_1_o_ie;
wire    io_pads_qspi_dq_1_o_pue;
wire    io_pads_qspi_dq_1_o_ds;
reg     io_pads_qspi_dq_2_i_ival;
wire    io_pads_qspi_dq_2_o_oval;
wire    io_pads_qspi_dq_2_o_oe;
wire    io_pads_qspi_dq_2_o_ie;
wire    io_pads_qspi_dq_2_o_pue;
wire    io_pads_qspi_dq_2_o_ds;
reg     io_pads_qspi_dq_3_i_ival;
wire    io_pads_qspi_dq_3_o_oval;
wire    io_pads_qspi_dq_3_o_oe;
wire    io_pads_qspi_dq_3_o_ie;
wire    io_pads_qspi_dq_3_o_pue;
wire    io_pads_qspi_dq_3_o_ds;
reg     io_pads_aon_erst_n_i_ival;
reg     io_pads_dbgmode0_n_i_ival;
reg     io_pads_dbgmode1_n_i_ival;
reg     io_pads_dbgmode2_n_i_ival;
reg     io_pads_bootrom_n_i_ival;
reg     io_pads_aon_pmu_dwakeup_n_i_ival;
wire    io_pads_aon_pmu_padrst_o_oval;
wire    io_pads_aon_pmu_vddpaden_o_oval;


initial 
    begin

    end

e203_soc_top inst_e203_soc_top(
    .hfextclk                        (hfextclk                        ),
    .hfxoscen                        (hfxoscen                        ),
    .lfextclk                        (lfextclk                        ),
    .lfxoscen                        (lfxoscen                        ),
    .io_pads_jtag_TCK_i_ival         (io_pads_jtag_TCK_i_ival         ),
    .io_pads_jtag_TMS_i_ival         (io_pads_jtag_TMS_i_ival         ),
    .io_pads_jtag_TDI_i_ival         (io_pads_jtag_TDI_i_ival         ),
    .io_pads_jtag_TDO_o_oval         (io_pads_jtag_TDO_o_oval         ),
    .io_pads_jtag_TDO_o_oe           (io_pads_jtag_TDO_o_oe           ),
    .io_pads_gpio_0_i_ival           (io_pads_gpio_0_i_ival           ),
    .io_pads_gpio_0_o_oval           (io_pads_gpio_0_o_oval           ),
    .io_pads_gpio_0_o_oe             (io_pads_gpio_0_o_oe             ),
    .io_pads_gpio_0_o_ie             (io_pads_gpio_0_o_ie             ),
    .io_pads_gpio_0_o_pue            (io_pads_gpio_0_o_pue            ),
    .io_pads_gpio_0_o_ds             (io_pads_gpio_0_o_ds             ),
    .io_pads_gpio_1_i_ival           (io_pads_gpio_1_i_ival           ),
    .io_pads_gpio_1_o_oval           (io_pads_gpio_1_o_oval           ),
    .io_pads_gpio_1_o_oe             (io_pads_gpio_1_o_oe             ),
    .io_pads_gpio_1_o_ie             (io_pads_gpio_1_o_ie             ),
    .io_pads_gpio_1_o_pue            (io_pads_gpio_1_o_pue            ),
    .io_pads_gpio_1_o_ds             (io_pads_gpio_1_o_ds             ),
    .io_pads_gpio_2_i_ival           (io_pads_gpio_2_i_ival           ),
    .io_pads_gpio_2_o_oval           (io_pads_gpio_2_o_oval           ),
    .io_pads_gpio_2_o_oe             (io_pads_gpio_2_o_oe             ),
    .io_pads_gpio_2_o_ie             (io_pads_gpio_2_o_ie             ),
    .io_pads_gpio_2_o_pue            (io_pads_gpio_2_o_pue            ),
    .io_pads_gpio_2_o_ds             (io_pads_gpio_2_o_ds             ),
    .io_pads_gpio_3_i_ival           (io_pads_gpio_3_i_ival           ),
    .io_pads_gpio_3_o_oval           (io_pads_gpio_3_o_oval           ),
    .io_pads_gpio_3_o_oe             (io_pads_gpio_3_o_oe             ),
    .io_pads_gpio_3_o_ie             (io_pads_gpio_3_o_ie             ),
    .io_pads_gpio_3_o_pue            (io_pads_gpio_3_o_pue            ),
    .io_pads_gpio_3_o_ds             (io_pads_gpio_3_o_ds             ),
    .io_pads_gpio_4_i_ival           (io_pads_gpio_4_i_ival           ),
    .io_pads_gpio_4_o_oval           (io_pads_gpio_4_o_oval           ),
    .io_pads_gpio_4_o_oe             (io_pads_gpio_4_o_oe             ),
    .io_pads_gpio_4_o_ie             (io_pads_gpio_4_o_ie             ),
    .io_pads_gpio_4_o_pue            (io_pads_gpio_4_o_pue            ),
    .io_pads_gpio_4_o_ds             (io_pads_gpio_4_o_ds             ),
    .io_pads_gpio_5_i_ival           (io_pads_gpio_5_i_ival           ),
    .io_pads_gpio_5_o_oval           (io_pads_gpio_5_o_oval           ),
    .io_pads_gpio_5_o_oe             (io_pads_gpio_5_o_oe             ),
    .io_pads_gpio_5_o_ie             (io_pads_gpio_5_o_ie             ),
    .io_pads_gpio_5_o_pue            (io_pads_gpio_5_o_pue            ),
    .io_pads_gpio_5_o_ds             (io_pads_gpio_5_o_ds             ),
    .io_pads_gpio_6_i_ival           (io_pads_gpio_6_i_ival           ),
    .io_pads_gpio_6_o_oval           (io_pads_gpio_6_o_oval           ),
    .io_pads_gpio_6_o_oe             (io_pads_gpio_6_o_oe             ),
    .io_pads_gpio_6_o_ie             (io_pads_gpio_6_o_ie             ),
    .io_pads_gpio_6_o_pue            (io_pads_gpio_6_o_pue            ),
    .io_pads_gpio_6_o_ds             (io_pads_gpio_6_o_ds             ),
    .io_pads_gpio_7_i_ival           (io_pads_gpio_7_i_ival           ),
    .io_pads_gpio_7_o_oval           (io_pads_gpio_7_o_oval           ),
    .io_pads_gpio_7_o_oe             (io_pads_gpio_7_o_oe             ),
    .io_pads_gpio_7_o_ie             (io_pads_gpio_7_o_ie             ),
    .io_pads_gpio_7_o_pue            (io_pads_gpio_7_o_pue            ),
    .io_pads_gpio_7_o_ds             (io_pads_gpio_7_o_ds             ),
    .io_pads_gpio_8_i_ival           (io_pads_gpio_8_i_ival           ),
    .io_pads_gpio_8_o_oval           (io_pads_gpio_8_o_oval           ),
    .io_pads_gpio_8_o_oe             (io_pads_gpio_8_o_oe             ),
    .io_pads_gpio_8_o_ie             (io_pads_gpio_8_o_ie             ),
    .io_pads_gpio_8_o_pue            (io_pads_gpio_8_o_pue            ),
    .io_pads_gpio_8_o_ds             (io_pads_gpio_8_o_ds             ),
    .io_pads_gpio_9_i_ival           (io_pads_gpio_9_i_ival           ),
    .io_pads_gpio_9_o_oval           (io_pads_gpio_9_o_oval           ),
    .io_pads_gpio_9_o_oe             (io_pads_gpio_9_o_oe             ),
    .io_pads_gpio_9_o_ie             (io_pads_gpio_9_o_ie             ),
    .io_pads_gpio_9_o_pue            (io_pads_gpio_9_o_pue            ),
    .io_pads_gpio_9_o_ds             (io_pads_gpio_9_o_ds             ),
    .io_pads_gpio_10_i_ival          (io_pads_gpio_10_i_ival          ),
    .io_pads_gpio_10_o_oval          (io_pads_gpio_10_o_oval          ),
    .io_pads_gpio_10_o_oe            (io_pads_gpio_10_o_oe            ),
    .io_pads_gpio_10_o_ie            (io_pads_gpio_10_o_ie            ),
    .io_pads_gpio_10_o_pue           (io_pads_gpio_10_o_pue           ),
    .io_pads_gpio_10_o_ds            (io_pads_gpio_10_o_ds            ),
    .io_pads_gpio_11_i_ival          (io_pads_gpio_11_i_ival          ),
    .io_pads_gpio_11_o_oval          (io_pads_gpio_11_o_oval          ),
    .io_pads_gpio_11_o_oe            (io_pads_gpio_11_o_oe            ),
    .io_pads_gpio_11_o_ie            (io_pads_gpio_11_o_ie            ),
    .io_pads_gpio_11_o_pue           (io_pads_gpio_11_o_pue           ),
    .io_pads_gpio_11_o_ds            (io_pads_gpio_11_o_ds            ),
    .io_pads_gpio_12_i_ival          (io_pads_gpio_12_i_ival          ),
    .io_pads_gpio_12_o_oval          (io_pads_gpio_12_o_oval          ),
    .io_pads_gpio_12_o_oe            (io_pads_gpio_12_o_oe            ),
    .io_pads_gpio_12_o_ie            (io_pads_gpio_12_o_ie            ),
    .io_pads_gpio_12_o_pue           (io_pads_gpio_12_o_pue           ),
    .io_pads_gpio_12_o_ds            (io_pads_gpio_12_o_ds            ),
    .io_pads_gpio_13_i_ival          (io_pads_gpio_13_i_ival          ),
    .io_pads_gpio_13_o_oval          (io_pads_gpio_13_o_oval          ),
    .io_pads_gpio_13_o_oe            (io_pads_gpio_13_o_oe            ),
    .io_pads_gpio_13_o_ie            (io_pads_gpio_13_o_ie            ),
    .io_pads_gpio_13_o_pue           (io_pads_gpio_13_o_pue           ),
    .io_pads_gpio_13_o_ds            (io_pads_gpio_13_o_ds            ),
    .io_pads_gpio_14_i_ival          (io_pads_gpio_14_i_ival          ),
    .io_pads_gpio_14_o_oval          (io_pads_gpio_14_o_oval          ),
    .io_pads_gpio_14_o_oe            (io_pads_gpio_14_o_oe            ),
    .io_pads_gpio_14_o_ie            (io_pads_gpio_14_o_ie            ),
    .io_pads_gpio_14_o_pue           (io_pads_gpio_14_o_pue           ),
    .io_pads_gpio_14_o_ds            (io_pads_gpio_14_o_ds            ),
    .io_pads_gpio_15_i_ival          (io_pads_gpio_15_i_ival          ),
    .io_pads_gpio_15_o_oval          (io_pads_gpio_15_o_oval          ),
    .io_pads_gpio_15_o_oe            (io_pads_gpio_15_o_oe            ),
    .io_pads_gpio_15_o_ie            (io_pads_gpio_15_o_ie            ),
    .io_pads_gpio_15_o_pue           (io_pads_gpio_15_o_pue           ),
    .io_pads_gpio_15_o_ds            (io_pads_gpio_15_o_ds            ),
    .io_pads_gpio_16_i_ival          (io_pads_gpio_16_i_ival          ),
    .io_pads_gpio_16_o_oval          (io_pads_gpio_16_o_oval          ),
    .io_pads_gpio_16_o_oe            (io_pads_gpio_16_o_oe            ),
    .io_pads_gpio_16_o_ie            (io_pads_gpio_16_o_ie            ),
    .io_pads_gpio_16_o_pue           (io_pads_gpio_16_o_pue           ),
    .io_pads_gpio_16_o_ds            (io_pads_gpio_16_o_ds            ),
    .io_pads_gpio_17_i_ival          (io_pads_gpio_17_i_ival          ),
    .io_pads_gpio_17_o_oval          (io_pads_gpio_17_o_oval          ),
    .io_pads_gpio_17_o_oe            (io_pads_gpio_17_o_oe            ),
    .io_pads_gpio_17_o_ie            (io_pads_gpio_17_o_ie            ),
    .io_pads_gpio_17_o_pue           (io_pads_gpio_17_o_pue           ),
    .io_pads_gpio_17_o_ds            (io_pads_gpio_17_o_ds            ),
    .io_pads_gpio_18_i_ival          (io_pads_gpio_18_i_ival          ),
    .io_pads_gpio_18_o_oval          (io_pads_gpio_18_o_oval          ),
    .io_pads_gpio_18_o_oe            (io_pads_gpio_18_o_oe            ),
    .io_pads_gpio_18_o_ie            (io_pads_gpio_18_o_ie            ),
    .io_pads_gpio_18_o_pue           (io_pads_gpio_18_o_pue           ),
    .io_pads_gpio_18_o_ds            (io_pads_gpio_18_o_ds            ),
    .io_pads_gpio_19_i_ival          (io_pads_gpio_19_i_ival          ),
    .io_pads_gpio_19_o_oval          (io_pads_gpio_19_o_oval          ),
    .io_pads_gpio_19_o_oe            (io_pads_gpio_19_o_oe            ),
    .io_pads_gpio_19_o_ie            (io_pads_gpio_19_o_ie            ),
    .io_pads_gpio_19_o_pue           (io_pads_gpio_19_o_pue           ),
    .io_pads_gpio_19_o_ds            (io_pads_gpio_19_o_ds            ),
    .io_pads_gpio_20_i_ival          (io_pads_gpio_20_i_ival          ),
    .io_pads_gpio_20_o_oval          (io_pads_gpio_20_o_oval          ),
    .io_pads_gpio_20_o_oe            (io_pads_gpio_20_o_oe            ),
    .io_pads_gpio_20_o_ie            (io_pads_gpio_20_o_ie            ),
    .io_pads_gpio_20_o_pue           (io_pads_gpio_20_o_pue           ),
    .io_pads_gpio_20_o_ds            (io_pads_gpio_20_o_ds            ),
    .io_pads_gpio_21_i_ival          (io_pads_gpio_21_i_ival          ),
    .io_pads_gpio_21_o_oval          (io_pads_gpio_21_o_oval          ),
    .io_pads_gpio_21_o_oe            (io_pads_gpio_21_o_oe            ),
    .io_pads_gpio_21_o_ie            (io_pads_gpio_21_o_ie            ),
    .io_pads_gpio_21_o_pue           (io_pads_gpio_21_o_pue           ),
    .io_pads_gpio_21_o_ds            (io_pads_gpio_21_o_ds            ),
    .io_pads_gpio_22_i_ival          (io_pads_gpio_22_i_ival          ),
    .io_pads_gpio_22_o_oval          (io_pads_gpio_22_o_oval          ),
    .io_pads_gpio_22_o_oe            (io_pads_gpio_22_o_oe            ),
    .io_pads_gpio_22_o_ie            (io_pads_gpio_22_o_ie            ),
    .io_pads_gpio_22_o_pue           (io_pads_gpio_22_o_pue           ),
    .io_pads_gpio_22_o_ds            (io_pads_gpio_22_o_ds            ),
    .io_pads_gpio_23_i_ival          (io_pads_gpio_23_i_ival          ),
    .io_pads_gpio_23_o_oval          (io_pads_gpio_23_o_oval          ),
    .io_pads_gpio_23_o_oe            (io_pads_gpio_23_o_oe            ),
    .io_pads_gpio_23_o_ie            (io_pads_gpio_23_o_ie            ),
    .io_pads_gpio_23_o_pue           (io_pads_gpio_23_o_pue           ),
    .io_pads_gpio_23_o_ds            (io_pads_gpio_23_o_ds            ),
    .io_pads_gpio_24_i_ival          (io_pads_gpio_24_i_ival          ),
    .io_pads_gpio_24_o_oval          (io_pads_gpio_24_o_oval          ),
    .io_pads_gpio_24_o_oe            (io_pads_gpio_24_o_oe            ),
    .io_pads_gpio_24_o_ie            (io_pads_gpio_24_o_ie            ),
    .io_pads_gpio_24_o_pue           (io_pads_gpio_24_o_pue           ),
    .io_pads_gpio_24_o_ds            (io_pads_gpio_24_o_ds            ),
    .io_pads_gpio_25_i_ival          (io_pads_gpio_25_i_ival          ),
    .io_pads_gpio_25_o_oval          (io_pads_gpio_25_o_oval          ),
    .io_pads_gpio_25_o_oe            (io_pads_gpio_25_o_oe            ),
    .io_pads_gpio_25_o_ie            (io_pads_gpio_25_o_ie            ),
    .io_pads_gpio_25_o_pue           (io_pads_gpio_25_o_pue           ),
    .io_pads_gpio_25_o_ds            (io_pads_gpio_25_o_ds            ),
    .io_pads_gpio_26_i_ival          (io_pads_gpio_26_i_ival          ),
    .io_pads_gpio_26_o_oval          (io_pads_gpio_26_o_oval          ),
    .io_pads_gpio_26_o_oe            (io_pads_gpio_26_o_oe            ),
    .io_pads_gpio_26_o_ie            (io_pads_gpio_26_o_ie            ),
    .io_pads_gpio_26_o_pue           (io_pads_gpio_26_o_pue           ),
    .io_pads_gpio_26_o_ds            (io_pads_gpio_26_o_ds            ),
    .io_pads_gpio_27_i_ival          (io_pads_gpio_27_i_ival          ),
    .io_pads_gpio_27_o_oval          (io_pads_gpio_27_o_oval          ),
    .io_pads_gpio_27_o_oe            (io_pads_gpio_27_o_oe            ),
    .io_pads_gpio_27_o_ie            (io_pads_gpio_27_o_ie            ),
    .io_pads_gpio_27_o_pue           (io_pads_gpio_27_o_pue           ),
    .io_pads_gpio_27_o_ds            (io_pads_gpio_27_o_ds            ),
    .io_pads_gpio_28_i_ival          (io_pads_gpio_28_i_ival          ),
    .io_pads_gpio_28_o_oval          (io_pads_gpio_28_o_oval          ),
    .io_pads_gpio_28_o_oe            (io_pads_gpio_28_o_oe            ),
    .io_pads_gpio_28_o_ie            (io_pads_gpio_28_o_ie            ),
    .io_pads_gpio_28_o_pue           (io_pads_gpio_28_o_pue           ),
    .io_pads_gpio_28_o_ds            (io_pads_gpio_28_o_ds            ),
    .io_pads_gpio_29_i_ival          (io_pads_gpio_29_i_ival          ),
    .io_pads_gpio_29_o_oval          (io_pads_gpio_29_o_oval          ),
    .io_pads_gpio_29_o_oe            (io_pads_gpio_29_o_oe            ),
    .io_pads_gpio_29_o_ie            (io_pads_gpio_29_o_ie            ),
    .io_pads_gpio_29_o_pue           (io_pads_gpio_29_o_pue           ),
    .io_pads_gpio_29_o_ds            (io_pads_gpio_29_o_ds            ),
    .io_pads_gpio_30_i_ival          (io_pads_gpio_30_i_ival          ),
    .io_pads_gpio_30_o_oval          (io_pads_gpio_30_o_oval          ),
    .io_pads_gpio_30_o_oe            (io_pads_gpio_30_o_oe            ),
    .io_pads_gpio_30_o_ie            (io_pads_gpio_30_o_ie            ),
    .io_pads_gpio_30_o_pue           (io_pads_gpio_30_o_pue           ),
    .io_pads_gpio_30_o_ds            (io_pads_gpio_30_o_ds            ),
    .io_pads_gpio_31_i_ival          (io_pads_gpio_31_i_ival          ),
    .io_pads_gpio_31_o_oval          (io_pads_gpio_31_o_oval          ),
    .io_pads_gpio_31_o_oe            (io_pads_gpio_31_o_oe            ),
    .io_pads_gpio_31_o_ie            (io_pads_gpio_31_o_ie            ),
    .io_pads_gpio_31_o_pue           (io_pads_gpio_31_o_pue           ),
    .io_pads_gpio_31_o_ds            (io_pads_gpio_31_o_ds            ),
    .io_pads_qspi_sck_o_oval         (io_pads_qspi_sck_o_oval         ),
    .io_pads_qspi_cs_0_o_oval        (io_pads_qspi_cs_0_o_oval        ),
    .io_pads_qspi_dq_0_i_ival        (io_pads_qspi_dq_0_i_ival        ),
    .io_pads_qspi_dq_0_o_oval        (io_pads_qspi_dq_0_o_oval        ),
    .io_pads_qspi_dq_0_o_oe          (io_pads_qspi_dq_0_o_oe          ),
    .io_pads_qspi_dq_0_o_ie          (io_pads_qspi_dq_0_o_ie          ),
    .io_pads_qspi_dq_0_o_pue         (io_pads_qspi_dq_0_o_pue         ),
    .io_pads_qspi_dq_0_o_ds          (io_pads_qspi_dq_0_o_ds          ),
    .io_pads_qspi_dq_1_i_ival        (io_pads_qspi_dq_1_i_ival        ),
    .io_pads_qspi_dq_1_o_oval        (io_pads_qspi_dq_1_o_oval        ),
    .io_pads_qspi_dq_1_o_oe          (io_pads_qspi_dq_1_o_oe          ),
    .io_pads_qspi_dq_1_o_ie          (io_pads_qspi_dq_1_o_ie          ),
    .io_pads_qspi_dq_1_o_pue         (io_pads_qspi_dq_1_o_pue         ),
    .io_pads_qspi_dq_1_o_ds          (io_pads_qspi_dq_1_o_ds          ),
    .io_pads_qspi_dq_2_i_ival        (io_pads_qspi_dq_2_i_ival        ),
    .io_pads_qspi_dq_2_o_oval        (io_pads_qspi_dq_2_o_oval        ),
    .io_pads_qspi_dq_2_o_oe          (io_pads_qspi_dq_2_o_oe          ),
    .io_pads_qspi_dq_2_o_ie          (io_pads_qspi_dq_2_o_ie          ),
    .io_pads_qspi_dq_2_o_pue         (io_pads_qspi_dq_2_o_pue         ),
    .io_pads_qspi_dq_2_o_ds          (io_pads_qspi_dq_2_o_ds          ),
    .io_pads_qspi_dq_3_i_ival        (io_pads_qspi_dq_3_i_ival        ),
    .io_pads_qspi_dq_3_o_oval        (io_pads_qspi_dq_3_o_oval        ),
    .io_pads_qspi_dq_3_o_oe          (io_pads_qspi_dq_3_o_oe          ),
    .io_pads_qspi_dq_3_o_ie          (io_pads_qspi_dq_3_o_ie          ),
    .io_pads_qspi_dq_3_o_pue         (io_pads_qspi_dq_3_o_pue         ),
    .io_pads_qspi_dq_3_o_ds          (io_pads_qspi_dq_3_o_ds          ),
    .io_pads_aon_erst_n_i_ival       (io_pads_aon_erst_n_i_ival       ),
    .io_pads_dbgmode0_n_i_ival       (io_pads_dbgmode0_n_i_ival       ),
    .io_pads_dbgmode1_n_i_ival       (io_pads_dbgmode1_n_i_ival       ),
    .io_pads_dbgmode2_n_i_ival       (io_pads_dbgmode2_n_i_ival       ),
    .io_pads_bootrom_n_i_ival        (io_pads_bootrom_n_i_ival        ),
    .io_pads_aon_pmu_dwakeup_n_i_ival(io_pads_aon_pmu_dwakeup_n_i_ival),
    .io_pads_aon_pmu_padrst_o_oval   (io_pads_aon_pmu_padrst_o_oval   ),
    .io_pads_aon_pmu_vddpaden_o_oval (io_pads_aon_pmu_vddpaden_o_oval )
);
endmodule
    
