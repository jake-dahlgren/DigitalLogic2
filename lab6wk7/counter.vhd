--Jake Dahlgren 1/24/2023
--Counter
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
 
entity counter is  
port( 
	clk1Hz: in std_logic;
	rst: in std_logic;
	q: out std_logic_vector(7 downto 0)
); 
end entity counter; 
 
architecture moore of counter is  
--make a saturating counter that counts from 0 to 255 
--use a std_logic_vector for the counter output, not an intger 
begin
-- *** counter *** --
cnt:process(all)
begin

if rst = '0' then
	q <= (others => '0');
elsif rising_edge(clk1Hz) then
	if q = 255 then 
		q <= q;
	else
		q <= q + 1;
	end if;
end if;

end process;


 
end architecture moore; 