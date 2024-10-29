onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Clock80MHz_opt

do {wave.do}

view wave
view structure
view signals

do {Clock80MHz.udo}

run -all

quit -force
