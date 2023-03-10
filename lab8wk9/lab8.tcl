# Copyright (C) 2020  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: lab8.tcl
# Generated on: Mon Feb 06 22:46:15 2023

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "lab8"]} {
		puts "Project lab8 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists lab8]} {
		project_open -revision lab8 lab8
	} else {
		project_new -revision lab8 lab8
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name DEVICE 10M50DAF484C7G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "22:38:46  FEBRUARY 06, 2023"
	set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name BDF_FILE lab8.bdf
	set_global_assignment -name VHDL_FILE dseg7font.vhd
	set_global_assignment -name VHDL_FILE instructions.vhd
	set_global_assignment -name VHDL_FILE counter.vhd
	set_global_assignment -name VHDL_FILE irom.vhd
	set_global_assignment -name VHDL_FILE idecode.vhd
	
	set_location_assignment PIN_C14 -to HEX0[0]
	set_location_assignment PIN_E15 -to HEX0[1]
	set_location_assignment PIN_C15 -to HEX0[2]
	set_location_assignment PIN_C16 -to HEX0[3]
	set_location_assignment PIN_E16 -to HEX0[4]
	set_location_assignment PIN_D17 -to HEX0[5]
	set_location_assignment PIN_C17 -to HEX0[6]
	set_location_assignment PIN_D15 -to HEX0[7]
	set_location_assignment PIN_C18 -to HEX1[0]
	set_location_assignment PIN_D18 -to HEX1[1]
	set_location_assignment PIN_E18 -to HEX1[2]
	set_location_assignment PIN_B16 -to HEX1[3]
	set_location_assignment PIN_A17 -to HEX1[4]
	set_location_assignment PIN_A18 -to HEX1[5]
	set_location_assignment PIN_B17 -to HEX1[6]
	set_location_assignment PIN_A16 -to HEX1[7]
	set_location_assignment PIN_B20 -to HEX2[0]
	set_location_assignment PIN_A20 -to HEX2[1]
	set_location_assignment PIN_B19 -to HEX2[2]
	set_location_assignment PIN_A21 -to HEX2[3]
	set_location_assignment PIN_B21 -to HEX2[4]
	set_location_assignment PIN_C22 -to HEX2[5]
	set_location_assignment PIN_B22 -to HEX2[6]
	set_location_assignment PIN_A19 -to HEX2[7]
	set_location_assignment PIN_F21 -to HEX3[0]
	set_location_assignment PIN_E22 -to HEX3[1]
	set_location_assignment PIN_E21 -to HEX3[2]
	set_location_assignment PIN_C19 -to HEX3[3]
	set_location_assignment PIN_C20 -to HEX3[4]
	set_location_assignment PIN_D19 -to HEX3[5]
	set_location_assignment PIN_E17 -to HEX3[6]
	set_location_assignment PIN_D22 -to HEX3[7]
	set_location_assignment PIN_F18 -to HEX4[0]
	set_location_assignment PIN_E20 -to HEX4[1]
	set_location_assignment PIN_E19 -to HEX4[2]
	set_location_assignment PIN_J18 -to HEX4[3]
	set_location_assignment PIN_H19 -to HEX4[4]
	set_location_assignment PIN_F19 -to HEX4[5]
	set_location_assignment PIN_F20 -to HEX4[6]
	set_location_assignment PIN_F17 -to HEX4[7]
	set_location_assignment PIN_J20 -to HEX5[0]
	set_location_assignment PIN_K20 -to HEX5[1]
	set_location_assignment PIN_L18 -to HEX5[2]
	set_location_assignment PIN_N18 -to HEX5[3]
	set_location_assignment PIN_M20 -to HEX5[4]
	set_location_assignment PIN_N19 -to HEX5[5]
	set_location_assignment PIN_N20 -to HEX5[6]
	set_location_assignment PIN_L19 -to HEX5[7]
	
	set_location_assignment PIN_AA11 -to BEEPER
	set_location_assignment PIN_P11 -to clk
	set_location_assignment PIN_A7 -to rst
	set_location_assignment PIN_AB17 -to coll
	
	
	set_location_assignment PIN_A8 -to LEDS[0]
	set_location_assignment PIN_A9 -to LEDS[1]
	set_location_assignment PIN_A10 -to LEDS[2]
	set_location_assignment PIN_B10 -to LEDS[3]
	set_location_assignment PIN_D13 -to LEDS[4]
	set_location_assignment PIN_C13 -to LEDS[5]
	set_location_assignment PIN_E14 -to LEDS[6]
	set_location_assignment PIN_D14 -to LEDS[7]
	
	set_location_assignment PIN_Y10 -to MOTORS[3]
	set_location_assignment PIN_AB8 -to MOTORS[2]
	set_location_assignment PIN_AB9 -to MOTORS[1]
	set_location_assignment PIN_AB7 -to MOTORS[0]
	
	set_location_assignment PIN_C10 -to goto_addr[0]
	set_location_assignment PIN_C11 -to goto_addr[1]
	set_location_assignment PIN_D12 -to goto_addr[2]
	set_location_assignment PIN_C12 -to goto_addr[3]
	set_location_assignment PIN_A12 -to goto_addr[4]
	set_location_assignment PIN_B12 -to goto_addr[5]
	set_location_assignment PIN_A13 -to goto_addr[6]
	set_location_assignment PIN_A14 -to goto_addr[7]

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
