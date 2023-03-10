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
# File: lab6.tcl
# Generated on: Tue Jan 24 13:01:26 2023

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "lab6"]} {
		puts "Project lab6 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists lab6]} {
		project_open -revision lab6 lab6
	} else {
		project_new -revision lab6 lab6
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name DEVICE 10M50DAF484C7G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "11:28:43  JANUARY 24, 2023"
	set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name VHDL_FILE dseg7font.vhd
	set_global_assignment -name VHDL_FILE instructions.vhd
	set_global_assignment -name VHDL_FILE counter.vhd
	set_global_assignment -name VHDL_FILE irom.vhd
	set_global_assignment -name VHDL_FILE idecode.vhd
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name BDF_FILE lab6.bdf
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
	set_global_assignment -name VHDL_SHOW_LMF_MAPPING_MESSAGES OFF
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	
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

set_location_assignment PIN_AA11 -to BEEPER
set_location_assignment PIN_AB19 -to clk
set_location_assignment PIN_A7 -to rst


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





	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}