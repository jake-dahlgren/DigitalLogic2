transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/dahlgrenj/OneDrive - Milwaukee School of Engineering/Documents/DigitalLogic2/Lab4wk5/trafficLight.vhd}

vcom -2008 -work work {C:/Users/dahlgrenj/OneDrive - Milwaukee School of Engineering/Documents/DigitalLogic2/Lab4wk5/tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run 30 sec
