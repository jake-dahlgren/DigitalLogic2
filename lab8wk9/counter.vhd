--Jake Dahlgren 2/7/2023
--Counter
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
 
entity counter is  
port( 
	clk50MHz: in std_logic;
	rst: in std_logic;
	q: out std_logic_vector(7 downto 0);
	coll: in std_logic;
	d: in std_logic_vector(7 downto 0);
	load: in std_logic
); 
end entity counter; 
 
architecture mealy of counter is  
--make a saturating counter that counts from 0 to 255 
--use a std_logic_vector for the counter output, not an intger 
signal cnt: integer range 0 to 25000000;
signal slowclock: std_logic;
begin
-- *** slow clock *** --
slowclk:process(all)
begin

if rising_edge(clk50MHz) then 
	cnt <= cnt + 1;
	if cnt = 12000000 then 
		slowclock <= not slowclock;
		cnt <= 0;
	end if;
end if;


end process;


-- *** counter *** --
count:process(all)
begin

if rst = '0' then
	q <= (others => '0');
elsif load = '1' then
	q <= d;
elsif rising_edge(slowclock) then
	if  coll = '0' then 
		if q = 255 then 
			q <= q;
		else
			q <= q + 1;
		end if;
	else
		q <= q;
	end if;
end if;

end process;


 
end architecture mealy; 