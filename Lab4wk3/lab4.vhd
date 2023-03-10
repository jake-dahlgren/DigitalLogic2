-- Dahlgren 12/15/22

-- Set device to MAX 10 and name "10m50daf484c7g"

library ieee;
use ieee.std_logic_1164.all;

entity lab4 is
port(
CLK, RST, SW0, COLL: in std_logic;
REN, LEN, RDIR, LDIR, beep: out std_logic
);

end entity;

architecture behav of lab4 is
--inputs CLK, RST, SW0, COLL
--outputs REN, LEN, RDIR, LDIR, beep
signal Q, D: std_logic_vector(4 downto 0);
-- set pins

attribute chip_pin : string;
attribute chip_pin of RST : signal is "B8";
attribute chip_pin of CLK : signal is "AB19";
attribute chip_pin of SW0 : signal is "C10";
attribute chip_pin of COLL : signal is "AB17";
attribute chip_pin of REN : signal is "Y10";
attribute chip_pin of LEN : signal is "AB8";
attribute chip_pin of RDIR : signal is "AB9";
attribute chip_pin of LDIR : signal is "AB7";
attribute chip_pin of beep : signal is "AA11";
begin
-- **** REGISTER ****--

reg:process(all)
begin
--synchronous RST (active low)
-- Q <= "00000";
if RST = '0' then Q <= 5d"0"; -- reset
elsif rising_edge(CLK) then Q <= D;
end if;
end process;

--**** NSL ****--
-- WAIT = "00000"
--ALARM = "00001"
--other states = "00010" -> "10101"
NSL:process(all)
begin

if (COLL = '1' and Q /= 5d"0") then D <= 5d"1";
else
	case Q is
		when 5d"0" => --wait
			if SW0 = '0' then D <= 5d"0"; --wait
			elsif (SW0 = '1' and COLL = '0') then D <= 5d"2"; --side 1_1
			else D <= 5d"1";
		end if;
		when 5d"1" => --alarm 
			D <= 5d"1"; --alarm
		when 5d"2" => --side 1_1
			D <= 5d"3"; --side 1_2
		when 5d"3" => --side 1_2
			D <= 5d"4"; --side 1_3
		when 5d"4" => --side 1_3
			D <= 5d"5"; --side 1_4
		when 5d"5" => --side 1_4
			D <= 5d"6"; --TURN 1
		when 5d"6" => --TURN 1
			D <= 5d"7"; --side 2_1
		when 5d"7" => --side 2_1
			D <= 5d"8"; --side 2_2
		when 5d"8" => --side 2_2
			D <= 5d"9"; --side 2_3
		when 5d"9" => --side 2_3
			D <= 5d"10"; --side 2_4
		when 5d"10" => --side 2_4
			D <= 5d"11"; --TURN 2
		when 5d"11" => --TURN 2
			D <= 5d"12"; --side 3_1
		when 5d"12" => --side 3_1
			D <= 5d"13"; --side 3_2
		when 5d"13" => --side 3_2
			D <= 5d"14"; --side 3_3
		when 5d"14" => --side 3_3
			D <= 5d"15"; --side 3_4
		when 5d"15" => --side 3_4
			D <= 5d"16"; --TURN 3
		when 5d"16" => --TURN 3
			D <= 5d"17"; --side 4_1
		when 5d"17" => --side 4_1
			D <= 5d"18"; --side 4_2
		when 5d"18" => --side 4_2
			D <= 5d"19"; --side 4_3
		when 5d"19" => --side 4_3
			D <= 5d"20"; --side 4_4
		when 5d"20" => --side 4_4
			D <= 5d"0"; --WAIT
		when others => D <= 5d"1"; --ALARM
	end case;
end if;
end process;

--**** OUTPUT LOGIC ****--
--use "fast spin" (right 0 left 1)
with Q select REN <= 
	'0' when 5d"0"|5d"1",
	'1' when others;
with Q select LEN <=
	'0' when 5d"0"|5d"1",
	'1' when others;
with Q select RDIR <=
	'0' when 5d"6"|5d"11"|5d"16",
	'1' when others;
with Q select LDIR <=
	'1' when others;
	
with Q select beep <=
	'1' when 5d"1",
	'0' when others;
	


end architecture;




	

