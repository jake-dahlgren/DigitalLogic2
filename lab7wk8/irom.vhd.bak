--Jake Dahlgren 1/24/2023
--List of instructions to execute
library ieee; 
use ieee.std_logic_1164.all; 
use work.instructions.all; 
 
entity irom is  
port(address: in std_logic_vector(7 downto 0); 
     q: out std_logic_vector(2 downto 0)); 
end entity irom; 
 
architecture mux of irom is  
begin
--Beep 1
--displayrun 1
--forward 8
--turn 4
--forward 8
--end
with address select  q <=
	  beep   when B"0000_0000",  
     displayrun when B"0000_0001",  
     forward when B"0000_0010",  
     forward when B"0000_0011",  
     forward   when B"0000_0100",  
     forward   when B"0000_0101",  
     forward   when B"0000_0110",  
     forward   when B"0000_0111",  
     forward   when B"0000_1000",  
     forward   when B"0000_1001",  
     leftturn   when B"0000_1010",  
     leftturn   when B"0000_1011",  
     leftturn   when B"0000_1100", 
	  leftturn   when B"0000_1101", 
	  forward   when B"0000_1110", 
	  forward   when B"0000_1111", 
	  forward   when B"0001_0000", 
	  forward   when B"0001_0001", 
	  forward   when B"0001_0010",
	  forward   when B"0001_0011",
	  forward   when B"0001_0100",
	  forward   when B"0001_0101",
     displayend when others; -- addresses 22 through 255 

end architecture mux; 