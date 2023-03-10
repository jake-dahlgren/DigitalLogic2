--Jake Dahlgren 1/31/2023
--List of instructions to execute
library ieee; 
use ieee.std_logic_1164.all; 
use work.instructions.all; 
 
entity irom is  
port(address: in std_logic_vector(7 downto 0); 
     q: out std_logic_vector(3 downto 0)); 
end entity irom; 
 
architecture mux of irom is  
begin
--Beep 3 seconds
--display hello 2 seconds
--start 1 sec
-- repeat 4 times 
-- {
-- display go 1 sec
-- forward 1 foot
-- display back 1 sec
-- backward 1 foot
-- display turn-r 1 sec
-- spin/turn right 90 degrees
-- display wait 1 sec
-- }
-- display off until reset

with address select q <=
	  beep when 8d"0",  
     beep when 8d"1",  
     beep when 8d"2",  
     displayhello when 8d"3",  
     displayhello when 8d"4",  
     displaystart when 8d"5", 
	  
     displaygo  	when 8d"6",  
     forward   	when 8d"7",
	  forward   	when 8d"8",
	  forward   	when 8d"9",
     displayback  when 8d"10",  
     backward   	when 8d"11",
	  backward   	when 8d"12",
	  backward   	when 8d"13",  
     displayturnr when 8d"14",  
     rightspin    when 8d"15",  
     displaywait  when 8d"16", 
	  
	  displaygo    when 8d"17",  
     forward   	when 8d"18",
	  forward   	when 8d"19",
	  forward   	when 8d"20",  
     displayback  when 8d"21",  
     backward   	when 8d"22",
	  backward   	when 8d"23",
	  backward  	when 8d"24",  
     displayturnr when 8d"25",  
     rightspin   	when 8d"26",  
     displaywait  when 8d"27", 
	  
	  displaygo    when 8d"28",  
     forward   	when 8d"29",
	  forward   	when 8d"30",
	  forward   	when 8d"31",  
     displayback  when 8d"32",  
     backward   	when 8d"33",
	  backward   	when 8d"34",
	  backward   	when 8d"35",  
     displayturnr when 8d"36",  
     rightspin    when 8d"37",  
     displaywait  when 8d"38", 
	  
	  displaygo    when 8d"39",  
     forward   	when 8d"40",
	  forward   	when 8d"41", 
	  forward   	when 8d"42",   
     displayback  when 8d"43",  
     backward   	when 8d"44",
	  backward   	when 8d"45",
	  backward   	when 8d"46",
     displayturnr when 8d"47",  
     rightspin    when 8d"48",  
     displaywait  when 8d"49", 
	
     displayoff when others; -- addresses 50 through 255 

end architecture mux; 