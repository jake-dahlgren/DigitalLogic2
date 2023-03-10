-- Dahlgren 1/13/2023
-- Blinks "MSOE" in Morse Code
-- Reset is connected to SW0

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity msoe is

port(
RST: in std_logic;
CLK: in std_logic;
LED, IO13: inout std_logic
);

end entity;

architecture behav of msoe is
signal state_count: std_logic_vector(0 to 5);
signal slow_clk: std_logic;
signal cnt: integer range 0 to 25000000;
attribute chip_pin : string;
attribute chip_pin of RST : signal is "C10";
attribute chip_pin of CLK : signal is "P11";
attribute chip_pin of LED : signal is "A8";
attribute chip_pin of IO13 : signal is "AB20";
begin

-- **** REGISTER + NSL ****--

clock:process(all)
begin
if RST = '0' then
state_count <= (others => '0');
elsif rising_edge(slow_clk) then
if state_count = 40 then
state_count <= (others => '0');
else
state_count <= state_count + 1;
end if;
end if;
end process;

--**** OUTPUT ****--

with state_count select LED <=
'0' when 6d"0"|6d"4"|6d"8"|6d"9"|6d"10"|6d"12"|6d"14"|6d"16"|6d"17"|6d"18"|6d"22"|6d"26"|6d"30"|6d"31"|6d"32"|6d"34"|6d"35"|6d"36"|6d"37"|6d"38"|6d"39"|6d"40",
'1' when others;
IO13 <= LED;

--**** SLOW CLOCK PROCESS ****--

SlowClock:process(all)
begin
if rising_edge(CLK)
then  cnt <= cnt+1;
if cnt = 5000000 then -- 5 Hz slow clock
slow_clk <= not slow_clk;
cnt <= 0;
end if;
end if;
end process;
end architecture;