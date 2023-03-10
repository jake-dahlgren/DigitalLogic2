--Jake Dahlgren 2/7/2023
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
--say reset
--beep
--say hello
--beep
--say run
--beep
-- {*6*}
-- say ahead
--forward 3 feet
--say turn_r
--turn right 90
--goto {*6*}

with address select q <=

	  --introduction
	  displayreset when 8d"0",  
	  displayreset when 8d"1",
     beep when 8d"2",  
	  beep when 8d"3", 
     displayhello when 8d"4",  
	  displayhello when 8d"5", 
	  beep when 8d"6",  
	  beep when 8d"7", 
     displayrun when 8d"8",  
	  displayrun when 8d"9",  
     beep when 8d"10", 
	  beep when 8d"11", 
	  
	  --Forward 3 feet {GOTO HERE}
     displayahead when 8d"12",  
	  displayahead when 8d"13",  
     forward when 8d"14",
	  forward when 8d"15",
	  forward when 8d"16",
     forward when 8d"17",  
     forward when 8d"18",
	  forward when 8d"19",
	  forward when 8d"20",  
     forward when 8d"21",  
     forward when 8d"22",  
	  forward when 8d"23",
	  forward when 8d"24",
	  forward when 8d"25",
     forward when 8d"26",  
     forward when 8d"27",
	  forward when 8d"28",
	  forward when 8d"29",  
     forward when 8d"30",  
	  
	  --turn 90 degrees
     displayturnr when 8d"31", 
	  displayturnr when 8d"32", 
	  rightturn when 8d"33",  
	  rightturn when 8d"34",  
	  rightturn when 8d"35",  
	  
	  --goto 12
     goto when 8d"36",
	
     beep when others; -- addresses 37 through 255  (should never reach this state)

end architecture mux; 