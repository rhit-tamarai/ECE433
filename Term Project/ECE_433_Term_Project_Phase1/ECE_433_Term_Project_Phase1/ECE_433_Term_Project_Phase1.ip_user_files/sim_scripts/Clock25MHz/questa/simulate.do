onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Clock25MHz_opt

do {wave.do}

view wave
view structure
view signals

do {Clock25MHz.udo}

run -all

quit -force
