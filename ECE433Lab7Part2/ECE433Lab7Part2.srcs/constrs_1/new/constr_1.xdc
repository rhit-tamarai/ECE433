# Lab7I2Cphase2fall2024JJS.xdc
#ECE433 Fall 2024
#Nexys A7
#100MHz crystal oscillator
set_property PACKAGE_PIN E3 [get_ports Clock]
#LD15 clock ready indicator
set_property PACKAGE_PIN V11 [get_ports ClockLocked]
#LD14 is on if temparature reading is complete
set_property PACKAGE_PIN V12 [get_ports DONE]
#BTNU single shot to sample a TMP101
set_property PACKAGE_PIN M18 [get_ports Start]
#SW15 Mode=0 for single shot and Mode=1 for continuous mode
set_property PACKAGE_PIN V10 [get_ports Mode]
#BTND
set_property PACKAGE_PIN P18 [get_ports Reset]
#JC3
set_property PACKAGE_PIN J2 [get_ports SCL]
#JC4
set_property PACKAGE_PIN G6 [get_ports SDA]

#7-segments
set_property PACKAGE_PIN H15 [get_ports {Display[7]}]
set_property PACKAGE_PIN L18 [get_ports {Display[6]}]
set_property PACKAGE_PIN T11 [get_ports {Display[5]}]
set_property PACKAGE_PIN P15 [get_ports {Display[4]}]
set_property PACKAGE_PIN K13 [get_ports {Display[3]}]
set_property PACKAGE_PIN K16 [get_ports {Display[2]}]
set_property PACKAGE_PIN R10 [get_ports {Display[1]}]
set_property PACKAGE_PIN T10 [get_ports {Display[0]}]
#7-segment power transistor switches
set_property PACKAGE_PIN U13 [get_ports {Transistors[7]}]
set_property PACKAGE_PIN K2 [get_ports {Transistors[6]}]
set_property PACKAGE_PIN T14 [get_ports {Transistors[5]}]
set_property PACKAGE_PIN P14 [get_ports {Transistors[4]}]
set_property PACKAGE_PIN J14 [get_ports {Transistors[3]}]
set_property PACKAGE_PIN T9 [get_ports {Transistors[2]}]
set_property PACKAGE_PIN J18 [get_ports {Transistors[1]}]
set_property PACKAGE_PIN J17 [get_ports {Transistors[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {Display[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Display[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Transistors[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ClockLocked]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]

set_property IOSTANDARD LVCMOS33 [get_ports {ChipSelect[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ChipSelect[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ChipSelect[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ReceivedData[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports Clock]
set_property IOSTANDARD LVCMOS33 [get_ports Start]
set_property IOSTANDARD LVCMOS33 [get_ports Mode]
set_property IOSTANDARD LVCMOS33 [get_ports DONE]

set_property PACKAGE_PIN U16 [get_ports {ReceivedData[7]}]
set_property PACKAGE_PIN U17 [get_ports {ReceivedData[6]}]
set_property PACKAGE_PIN V17 [get_ports {ReceivedData[5]}]
set_property PACKAGE_PIN R18 [get_ports {ReceivedData[4]}]
set_property PACKAGE_PIN N14 [get_ports {ReceivedData[3]}]
set_property PACKAGE_PIN J13 [get_ports {ReceivedData[2]}]
set_property PACKAGE_PIN K15 [get_ports {ReceivedData[1]}]
set_property PACKAGE_PIN H17 [get_ports {ReceivedData[0]}]
set_property PACKAGE_PIN R15 [get_ports {ChipSelect[2]}]
set_property PACKAGE_PIN M13 [get_ports {ChipSelect[1]}]
set_property PACKAGE_PIN L16 [get_ports {ChipSelect[0]}]
