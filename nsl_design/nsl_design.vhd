-- DAHLGREN - test nsl designs
library ieee;
use ieee.std_logic_1164.all;

entity nsl_design
port(
	x: in std_logic
);
end entity

architecture behav of nsl_design is
signal Q, D: std_logic_vector(1 downto 0);
signal Qx: std_logic_vector(2 downto 0);
begin 

Qx <= Q & x;
--with-select
/*
with Qx select <= D
"00" when "100",
"01" when "000"|"110"|"111",
"10" when "010"|"011",
"11" when others;
*/
/*
D <= 
"00" when Qx = "100" else
"01" when Qx = "000" or Qx = "110" or Qx = "111" else
"10" when Qx = "010" or Qx = "011" else
"11";
*/
/*
p1:process(all)
begin

case Qx is
when "100" => 
	D <= "00";
when "000"|"110"|"111" =>
	D >= "01";
when "010"|"011" =>
	D <= "10";
when others =>
	D <= "11"
end case;

end process;
*/
/*
p2:process(all)
begin
	if Qx = "100" then
		D<="00";
	elsif Qx = "000" or Qx = "110" or Qx = "111" then
		D<="01";
	elsif Qx = "010" or Qx = "011" then
		D<="10";
	else
		D<="11";
	end if;
end process;
*/
/*
p3:process(all)
begin 
case Q is
when "00" =>
	if x = '0' then D<= "01"; else D <= "11"; end if;
	y <= '0';
when "01" =>
	D <= "10";
	y <= '1';
when "10" =>
	if x = '0' then D <= "00"; e;se D <= "11"; end if;
	y <= '1';
when others =>
	D <= "01";
	y<= '1';
end case;

end process;
*/
p4:process(all)
begin
case Q is 
when "00" =>
	if x = '0' then D <= "01"; else D <= "11"; end if;
	y <= '0';
when "01" =>
	D <= "11";
	y <= '1';
	
when others  =>
	D <= "11";
	y <= '1';
end case;
end process;






















end architecture