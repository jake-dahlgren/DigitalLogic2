--Dahlgren 1/9/2023

library ieee;
use ieee.std_logic_1164.all;

entity trafficLight is 
port(
nsRed, nsYellow, nsGreen, ewRed, ewYellow, ewGreen: out std_logic;
enable, rst, CLK: in std_logic
);
end entity;

architecture behav of trafficLight is
type state is (RESET, nsG1, nsG2, nsG3, nsG4, nsY1, nsY2, nsRED1, ewG1, ewG2, ewG3, ewG4, ewY1, ewY2, ewRED1);
signal Q: state;
signal D: state;

--slow clock
signal cnt: integer range 0 to 25000000; 
signal clk1Hz : std_logic;

-- set pins
attribute chip_pin : string;
attribute chip_pin of nsRed : signal is "J20";
attribute chip_pin of nsYellow : signal is "N20";
attribute chip_pin of nsGreen : signal is "N18";
attribute chip_pin of ewRed : signal is "F18";
attribute chip_pin of ewYellow : signal is "F20";
attribute chip_pin of ewGreen : signal is "J18";
attribute chip_pin of enable : signal is "C10";
attribute chip_pin of rst : signal is "B8";
attribute chip_pin of CLK : signal is "P11";

begin
--slow clock process
counter: process(CLK) 
begin 
  if rising_edge(CLK) then  
  cnt <= cnt+1; 
  if cnt = 25000000 then  
    clk1Hz <= not clk1Hz; 
    cnt <= 0; 
  end if; 
  end if; 
end process; 

--register
reg:process(all)
begin
if rising_edge(clk) then
	if rst = '0' then
		Q <= RESET;
	else
		Q <= D;
	end if;
end if;
end process;

-- next state logic

--ns is for north south light
--ew is for east west light
nsl:process(all)
begin
case Q is
	when RESET =>
		if enable = '1' then
			D <= nsG1;
		else D <= RESET;
		end if;
	when nsG1 =>
		D <= nsG2;
	when nsG2 =>
		D <= nsG3;
	when nsG3 =>
		D <= nsG4;
	when nsG4 =>
		D <= nsY1;
	when nsY1 =>
		D <= nsY2;
	when nsY2 =>
		D <= nsRED1;
	when nsRED1 =>
		D <= ewG1;
	when ewG1 =>
		D <= ewG2;
	when ewG2 =>
		D <= ewG3;
	when ewG3 =>
		D <= ewG4;
	when ewG4 =>
		D <= ewY1;
	when ewY1 =>
		D <= ewY2;
	when ewY2 =>
		D <= ewRED1;
	when ewRED1 =>
		D <= nsG1;
	when others =>
		D <= RESET;
end case;
end process;

--output logic

with Q select nsRed <=
'1' when nsG1|nsG2|nsG3|nsG4|nsY1|nsY2,
'0' when others;

with Q select nsYellow <=
'0' when nsY1|nsY2,
'1' when others;

with Q select nsGreen <=
'0' when nsG1|nsG2|nsG3|nsG4,
'1' when others;

with Q select ewRed <=
'1' when ewG1|ewG2|ewG3|ewG4|ewY1|ewY2,
'0' when others;

with Q select ewYellow <=
'0' when ewY1|ewY2,
'1' when others;

with Q select ewGreen <=
'0' when ewG1|ewG2|ewG3|ewG4,
'1' when others;


end architecture;









