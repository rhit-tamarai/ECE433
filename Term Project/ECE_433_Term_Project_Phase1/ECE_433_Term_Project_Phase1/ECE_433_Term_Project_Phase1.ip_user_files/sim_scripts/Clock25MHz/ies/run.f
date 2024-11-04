-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../ECE_433_Term_Project_Phase1.srcs/sources_1/ip/Clock25MHz/Clock25MHz_clk_wiz.v" \
  "../../../../ECE_433_Term_Project_Phase1.srcs/sources_1/ip/Clock25MHz/Clock25MHz.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

