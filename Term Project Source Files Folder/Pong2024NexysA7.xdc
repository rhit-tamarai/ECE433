#ECE433 Fall 2024
#Date: October 23, 2024
#Pong for Nexys A7
#BTND reset
set_property PACKAGE_PIN P18 [get_ports Reset]
#100MHz
set_property PACKAGE_PIN E3 [get_ports Clock]
#Pin 13 on VGA connector
set_property PACKAGE_PIN B11 [get_ports hsync]
#Pin 14 on VGA connector
set_property PACKAGE_PIN B12 [get_ports vsync]
#JB3 rotary encoder
set_property PACKAGE_PIN G16 [get_ports rota]
#JB4 rotary encoder
set_property PACKAGE_PIN H14 [get_ports rotb]
set_property PACKAGE_PIN D8 [get_ports {blue[3]}]
set_property PACKAGE_PIN D7 [get_ports {blue[2]}]
set_property PACKAGE_PIN C7 [get_ports {blue[1]}]
set_property PACKAGE_PIN B7 [get_ports {blue[0]}]
set_property PACKAGE_PIN A6 [get_ports {green[3]}]
set_property PACKAGE_PIN B6 [get_ports {green[2]}]
set_property PACKAGE_PIN A5 [get_ports {green[1]}]
set_property PACKAGE_PIN C6 [get_ports {green[0]}]
set_property PACKAGE_PIN A4 [get_ports {red[3]}]
set_property PACKAGE_PIN C5 [get_ports {red[2]}]
set_property PACKAGE_PIN B4 [get_ports {red[1]}]
set_property PACKAGE_PIN A3 [get_ports {red[0]}]


set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports rota]
set_property IOSTANDARD LVCMOS33 [get_ports rotb]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Clock]


