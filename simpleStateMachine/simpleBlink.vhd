-- Dahlgren 12/12/22
--simple 2 state FSm

library ieee;
use ieee.std_logic_1164.all;

entity simpleBlink is
port(
	CLK, CLR, LD: in std_logic;
	light: out std_logic
);
end entity;

architecture behav of simpleBlink is
signal Q, D: std_logic;
begin

--**** NSL ****--

NSL:process(all)
begin
	case Q is
		when '0' => -- Q = 0
			D <= '1'; -- move to other state
		when others => -- Q = 1
			D <= '0'; -- move to other state
	end case;
end process;


--**** Register ****--
-- async active high clear
-- active high load

reg:process(all)
begin
	if CLR = '1' then
		Q <= '0';
	elsif rising_edge(CLK) then
		if LD = '1' then
			Q <= D;
		end if;
	end if;
end process;


--**** Output Logic ****--

light <= Q;



end architecture;