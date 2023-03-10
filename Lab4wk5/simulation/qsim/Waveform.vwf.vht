-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/10/2023 11:51:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          trafficLight
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY trafficLight_vhd_vec_tst IS
END trafficLight_vhd_vec_tst;
ARCHITECTURE trafficLight_arch OF trafficLight_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL ewGreen : STD_LOGIC;
SIGNAL ewRed : STD_LOGIC;
SIGNAL ewYellow : STD_LOGIC;
SIGNAL nsGreen : STD_LOGIC;
SIGNAL nsRed : STD_LOGIC;
SIGNAL nsYellow : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
COMPONENT trafficLight
	PORT (
	CLK : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	ewGreen : BUFFER STD_LOGIC;
	ewRed : BUFFER STD_LOGIC;
	ewYellow : BUFFER STD_LOGIC;
	nsGreen : BUFFER STD_LOGIC;
	nsRed : BUFFER STD_LOGIC;
	nsYellow : BUFFER STD_LOGIC;
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : trafficLight
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	enable => enable,
	ewGreen => ewGreen,
	ewRed => ewRed,
	ewYellow => ewYellow,
	nsGreen => nsGreen,
	nsRed => nsRed,
	nsYellow => nsYellow,
	rst => rst
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 31250 ps;
	CLK <= '1';
	WAIT FOR 31250 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 640000 ps;
	rst <= '0';
	WAIT FOR 40000 ps;
	rst <= '1';
WAIT;
END PROCESS t_prcs_rst;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
	WAIT FOR 110000 ps;
	enable <= '0';
	WAIT FOR 730000 ps;
	enable <= '1';
	WAIT FOR 20000 ps;
	enable <= '0';
WAIT;
END PROCESS t_prcs_enable;
END trafficLight_arch;
