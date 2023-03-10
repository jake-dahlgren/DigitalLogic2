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
-- Generated on "12/12/2022 14:46:28"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          simpleBlink
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY simpleBlink_vhd_vec_tst IS
END simpleBlink_vhd_vec_tst;
ARCHITECTURE simpleBlink_arch OF simpleBlink_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL CLR : STD_LOGIC;
SIGNAL LD : STD_LOGIC;
SIGNAL light : STD_LOGIC;
COMPONENT simpleBlink
	PORT (
	CLK : IN STD_LOGIC;
	CLR : IN STD_LOGIC;
	LD : IN STD_LOGIC;
	light : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : simpleBlink
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	CLR => CLR,
	LD => LD,
	light => light
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		CLK <= '0';
		WAIT FOR 40000 ps;
		CLK <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	CLK <= '0';
WAIT;
END PROCESS t_prcs_CLK;

-- CLR
t_prcs_CLR: PROCESS
BEGIN
	CLR <= '0';
	WAIT FOR 550000 ps;
	CLR <= '1';
	WAIT FOR 280000 ps;
	CLR <= '0';
WAIT;
END PROCESS t_prcs_CLR;

-- LD
t_prcs_LD: PROCESS
BEGIN
	LD <= '1';
	WAIT FOR 410000 ps;
	LD <= '0';
WAIT;
END PROCESS t_prcs_LD;
END simpleBlink_arch;
