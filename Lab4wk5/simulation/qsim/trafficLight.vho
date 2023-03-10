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

-- DATE "01/10/2023 11:51:16"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	trafficLight IS
    PORT (
	nsRed : BUFFER std_logic;
	nsYellow : BUFFER std_logic;
	nsGreen : BUFFER std_logic;
	ewRed : BUFFER std_logic;
	ewYellow : BUFFER std_logic;
	ewGreen : BUFFER std_logic;
	enable : IN std_logic;
	rst : IN std_logic;
	CLK : IN std_logic
	);
END trafficLight;

ARCHITECTURE structure OF trafficLight IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_nsRed : std_logic;
SIGNAL ww_nsYellow : std_logic;
SIGNAL ww_nsGreen : std_logic;
SIGNAL ww_ewRed : std_logic;
SIGNAL ww_ewYellow : std_logic;
SIGNAL ww_ewGreen : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL \nsRed~output_o\ : std_logic;
SIGNAL \nsYellow~output_o\ : std_logic;
SIGNAL \nsGreen~output_o\ : std_logic;
SIGNAL \ewRed~output_o\ : std_logic;
SIGNAL \ewYellow~output_o\ : std_logic;
SIGNAL \ewGreen~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \Q~18_combout\ : std_logic;
SIGNAL \Q.nsY2~q\ : std_logic;
SIGNAL \Q~31_combout\ : std_logic;
SIGNAL \Q.nsRED1~q\ : std_logic;
SIGNAL \Q~25_combout\ : std_logic;
SIGNAL \Q.ewG1~q\ : std_logic;
SIGNAL \Q~26_combout\ : std_logic;
SIGNAL \Q.ewG2~q\ : std_logic;
SIGNAL \Q~27_combout\ : std_logic;
SIGNAL \Q.ewG3~q\ : std_logic;
SIGNAL \Q~28_combout\ : std_logic;
SIGNAL \Q.ewG4~q\ : std_logic;
SIGNAL \Q~23_combout\ : std_logic;
SIGNAL \Q.ewY1~q\ : std_logic;
SIGNAL \Q~24_combout\ : std_logic;
SIGNAL \Q.ewY2~q\ : std_logic;
SIGNAL \Q~29_combout\ : std_logic;
SIGNAL \Q.ewRED1~q\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \Q~30_combout\ : std_logic;
SIGNAL \Q.RESET~q\ : std_logic;
SIGNAL \Q~19_combout\ : std_logic;
SIGNAL \Q.nsG1~q\ : std_logic;
SIGNAL \Q~20_combout\ : std_logic;
SIGNAL \Q.nsG2~q\ : std_logic;
SIGNAL \Q~21_combout\ : std_logic;
SIGNAL \Q.nsG3~q\ : std_logic;
SIGNAL \Q~22_combout\ : std_logic;
SIGNAL \Q.nsG4~q\ : std_logic;
SIGNAL \Q~17_combout\ : std_logic;
SIGNAL \Q.nsY1~q\ : std_logic;
SIGNAL \WideNor0~0_combout\ : std_logic;
SIGNAL \WideNor0~combout\ : std_logic;
SIGNAL \WideNor0~1_combout\ : std_logic;
SIGNAL \WideNor3~0_combout\ : std_logic;
SIGNAL \WideNor3~combout\ : std_logic;
SIGNAL \WideNor3~1_combout\ : std_logic;

BEGIN

nsRed <= ww_nsRed;
nsYellow <= ww_nsYellow;
nsGreen <= ww_nsGreen;
ewRed <= ww_ewRed;
ewYellow <= ww_ewYellow;
ewGreen <= ww_ewGreen;
ww_enable <= enable;
ww_rst <= rst;
ww_CLK <= CLK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\nsRed~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor0~combout\,
	devoe => ww_devoe,
	o => \nsRed~output_o\);

\nsYellow~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor0~1_combout\,
	devoe => ww_devoe,
	o => \nsYellow~output_o\);

\nsGreen~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor0~0_combout\,
	devoe => ww_devoe,
	o => \nsGreen~output_o\);

\ewRed~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor3~combout\,
	devoe => ww_devoe,
	o => \ewRed~output_o\);

\ewYellow~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor3~1_combout\,
	devoe => ww_devoe,
	o => \ewYellow~output_o\);

\ewGreen~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideNor3~0_combout\,
	devoe => ww_devoe,
	o => \ewGreen~output_o\);

\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

\Q~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~18_combout\ = (\Q.nsY1~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsY1~q\,
	datab => \rst~input_o\,
	combout => \Q~18_combout\);

\Q.nsY2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsY2~q\);

\Q~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~31_combout\ = (\Q.nsY2~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsY2~q\,
	datab => \rst~input_o\,
	combout => \Q~31_combout\);

\Q.nsRED1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsRED1~q\);

\Q~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~25_combout\ = (\rst~input_o\ & \Q.nsRED1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \Q.nsRED1~q\,
	combout => \Q~25_combout\);

\Q.ewG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewG1~q\);

\Q~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~26_combout\ = (\Q.ewG1~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewG1~q\,
	datab => \rst~input_o\,
	combout => \Q~26_combout\);

\Q.ewG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewG2~q\);

\Q~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~27_combout\ = (\Q.ewG2~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewG2~q\,
	datab => \rst~input_o\,
	combout => \Q~27_combout\);

\Q.ewG3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewG3~q\);

\Q~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~28_combout\ = (\Q.ewG3~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewG3~q\,
	datab => \rst~input_o\,
	combout => \Q~28_combout\);

\Q.ewG4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewG4~q\);

\Q~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~23_combout\ = (\Q.ewG4~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewG4~q\,
	datab => \rst~input_o\,
	combout => \Q~23_combout\);

\Q.ewY1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewY1~q\);

\Q~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~24_combout\ = (\Q.ewY1~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewY1~q\,
	datab => \rst~input_o\,
	combout => \Q~24_combout\);

\Q.ewY2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewY2~q\);

\Q~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~29_combout\ = (\Q.ewY2~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewY2~q\,
	datab => \rst~input_o\,
	combout => \Q~29_combout\);

\Q.ewRED1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.ewRED1~q\);

\enable~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

\Q~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~30_combout\ = (\rst~input_o\ & ((\enable~input_o\) # (\Q.RESET~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \enable~input_o\,
	datac => \Q.RESET~q\,
	datad => \rst~input_o\,
	combout => \Q~30_combout\);

\Q.RESET\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.RESET~q\);

\Q~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~19_combout\ = (\rst~input_o\ & ((\Q.ewRED1~q\) # ((\enable~input_o\ & !\Q.RESET~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \Q.ewRED1~q\,
	datac => \enable~input_o\,
	datad => \Q.RESET~q\,
	combout => \Q~19_combout\);

\Q.nsG1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsG1~q\);

\Q~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~20_combout\ = (\Q.nsG1~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsG1~q\,
	datab => \rst~input_o\,
	combout => \Q~20_combout\);

\Q.nsG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsG2~q\);

\Q~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~21_combout\ = (\Q.nsG2~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsG2~q\,
	datab => \rst~input_o\,
	combout => \Q~21_combout\);

\Q.nsG3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsG3~q\);

\Q~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~22_combout\ = (\Q.nsG3~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsG3~q\,
	datab => \rst~input_o\,
	combout => \Q~22_combout\);

\Q.nsG4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsG4~q\);

\Q~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q~17_combout\ = (\Q.nsG4~q\ & \rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsG4~q\,
	datab => \rst~input_o\,
	combout => \Q~17_combout\);

\Q.nsY1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Q~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q.nsY1~q\);

\WideNor0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor0~0_combout\ = (!\Q.nsG1~q\ & (!\Q.nsG2~q\ & (!\Q.nsG3~q\ & !\Q.nsG4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsG1~q\,
	datab => \Q.nsG2~q\,
	datac => \Q.nsG3~q\,
	datad => \Q.nsG4~q\,
	combout => \WideNor0~0_combout\);

WideNor0 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor0~combout\ = (\Q.nsY1~q\) # ((\Q.nsY2~q\) # (!\WideNor0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.nsY1~q\,
	datab => \Q.nsY2~q\,
	datad => \WideNor0~0_combout\,
	combout => \WideNor0~combout\);

\WideNor0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor0~1_combout\ = (!\Q.nsY1~q\ & !\Q.nsY2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Q.nsY1~q\,
	datad => \Q.nsY2~q\,
	combout => \WideNor0~1_combout\);

\WideNor3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor3~0_combout\ = (!\Q.ewG1~q\ & (!\Q.ewG2~q\ & (!\Q.ewG3~q\ & !\Q.ewG4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewG1~q\,
	datab => \Q.ewG2~q\,
	datac => \Q.ewG3~q\,
	datad => \Q.ewG4~q\,
	combout => \WideNor3~0_combout\);

WideNor3 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor3~combout\ = (\Q.ewY1~q\) # ((\Q.ewY2~q\) # (!\WideNor3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Q.ewY1~q\,
	datab => \Q.ewY2~q\,
	datad => \WideNor3~0_combout\,
	combout => \WideNor3~combout\);

\WideNor3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \WideNor3~1_combout\ = (!\Q.ewY1~q\ & !\Q.ewY2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Q.ewY1~q\,
	datad => \Q.ewY2~q\,
	combout => \WideNor3~1_combout\);

ww_nsRed <= \nsRed~output_o\;

ww_nsYellow <= \nsYellow~output_o\;

ww_nsGreen <= \nsGreen~output_o\;

ww_ewRed <= \ewRed~output_o\;

ww_ewYellow <= \ewYellow~output_o\;

ww_ewGreen <= \ewGreen~output_o\;
END structure;


