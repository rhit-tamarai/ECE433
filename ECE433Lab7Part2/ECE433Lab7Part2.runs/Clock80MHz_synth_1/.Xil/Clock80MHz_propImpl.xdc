set_property SRC_FILE_INFO {cfile:c:/Xilinx/ECE433/Lab7/ECE433/ECE433Lab7Part2/ECE433Lab7Part2.srcs/sources_1/ip/Clock80MHz/Clock80MHz.xdc rfile:../../../ECE433Lab7Part2.srcs/sources_1/ip/Clock80MHz/Clock80MHz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in100MHz]] 0.1
