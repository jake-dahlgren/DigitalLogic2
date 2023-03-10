-- Jake Dahlgren 1/16/2023
-- Engine Spark Controller
-- for lab 5, CE1911

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity lw6 is

port(
RST: in std_logic;
CLK: in std_logic;
y3, y2, y1, y0: out std_logic
);

end entity;

architecture behav of lw6 is
signal state_count: std_logic_vector(0 to 4);
signal clk5KHz: std_logic;
signal cnt: integer range 0 to 5000; --should be 5000

-- **** PINS ****--
attribute chip_pin : string;
attribute chip_pin of RST : signal is "B8";
attribute chip_pin of CLK : signal is "P11";
attribute chip_pin of y3 : signal is "V10";
attribute chip_pin of y2 : signal is "V9";
attribute chip_pin of y1 : signal is "V8";
attribute chip_pin of y0 : signal is "V7";

--**** testing ****--
--assigns to LED 0-3
--attribute chip_pin of y3 : signal is "A8";
--attribute chip_pin of y2 : signal is "A9";
--attribute chip_pin of y1 : signal is "A10";
--attribute chip_pin of y0 : signal is "B10";

begin

-- **** REGISTER + NSL ****--
clock:process(all)
begin
if RST = '0' then
	state_count <= (others => '0');
elsif rising_edge(clk5KHz) then --assigned to clk5KHz
	if state_count = 20 then
		state_count <= state_count - 19;
	else
		state_count <= state_count + 1;
	end if;
end if;
end process;

--**** OUTPUT ****--
with state_count select y3 <=
'1' when 5d"1"|5d"2"|5d"3"|5d"4"|5d"5",
'0' when others;

with state_count select y2 <=
'1' when 5d"6"|5d"7"|5d"8"|5d"9"|5d"10",
'0' when others;

with state_count select y1 <=
'1' when 5d"11"|5d"12"|5d"13"|5d"14"|5d"15",
'0' when others;

with state_count select y0 <=
'1' when 5d"16"|5d"17"|5d"18"|5d"19"|5d"20",
'0' when others;

--**** SLOW CLOCK PROCESS ****--
-- 50MHz = 50,000,000 clocks per second 
-- Slow down by counting to 5000 then toggling slow clock 
-- This will give a clk1Hz output that is low for 5000 clocks 
-- toggles, stays high for 5000 clocks = 10,000 total  
-- This repeats then forever – converting 50,000,000 fast clocks to 1 slower clock 
counter: process(CLK) 
begin 
  if rising_edge(CLK) then  
  cnt <= cnt+1; 
  if cnt = 5000 then  --should be 5000
    clk5KHz <= not clk5KHz; 
    cnt <= 0; 
  end if; 
  end if; 
end process;
end architecture;