# Lab7I2Cphase1fall2024JJS.xdc
#ECE433 FALL 2024
#Nexys A7
#100MHz crystal oscillator
set_property PACKAGE_PIN E3 [get_ports clock]
#LD15 LED as clock ready indicator
set_property PACKAGE_PIN V11 [get_ports ClockLocked]
#SW15=1 to start and SW0=0 to stop
set_property PACKAGE_PIN V10 [get_ports Start]
#BTND is reset
set_property PACKAGE_PIN P18 [get_ports Reset]
#JC3 Serial I2C Clock
set_property PACKAGE_PIN J2 [get_ports SCL]
#JC4 Serial I2C Data 
set_property PACKAGE_PIN G6 [get_ports SDA]

set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports ClockLocked]
set_property IOSTANDARD LVCMOS33 [get_ports Start]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]

