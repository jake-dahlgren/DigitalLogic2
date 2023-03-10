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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "12/12/2022 14:46:29"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	simpleBlink IS
    PORT (
	CLK : IN std_logic;
	CLR : IN std_logic;
	LD : IN std_logic;
	light : OUT std_logic
	);
END simpleBlink;

ARCHITECTURE structure OF simpleBlink IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_CLR : std_logic;
SIGNAL ww_LD : std_logic;
SIGNAL ww_light : std_logic;
SIGNAL \light~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \LD~input_o\ : std_logic;
SIGNAL \Q~0_combout\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \Q~q\ : std_logic;
SIGNAL \ALT_INV_Q~q\ : std_logic;
SIGNAL \ALT_INV_LD~input_o\ : std_logic;
SIGNAL \ALT_INV_CLR~input_o\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_CLR <= CLR;
ww_LD <= LD;
light <= ww_light;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Q~q\ <= NOT \Q~q\;
\ALT_INV_LD~input_o\ <= NOT \LD~input_o\;
\ALT_INV_CLR~input_o\ <= NOT \CLR~input_o\;

\light~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~q\,
	devoe => ww_devoe,
	o => \light~output_o\);

\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\LD~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LD,
	o => \LD~input_o\);

\Q~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Q~0_combout\ = !\Q~q\ $ (!\LD~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Q~q\,
	datab => \ALT_INV_LD~input_o\,
	combout => \Q~0_combout\);

\CLR~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

Q : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~0_combout\,
	clrn => \ALT_INV_CLR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q~q\);

ww_light <= \light~output_o\;
END structure;


