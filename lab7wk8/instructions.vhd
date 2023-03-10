--Jake SDahlgren 1/24/2023
--Instruction constants
library ieee; use ieee.std_logic_1164.all; 
package instructions is  
 
  constant stop:    std_logic_vector(3 downto 0) := B"0000"; 
  constant leftturn:   std_logic_vector(3 downto 0) := B"0001"; 
  constant rightturn:   std_logic_vector(3 downto 0) := B"0010"; 
  constant forward:   std_logic_vector(3 downto 0) := B"0011"; 
  constant backward:   std_logic_vector(3 downto 0) := B"0100"; 
  constant beep:    std_logic_vector(3 downto 0) := B"0101"; 
  constant displayhello:  std_logic_vector(3 downto 0) := B"0110"; 
  constant displayoff:  std_logic_vector(3 downto 0) := B"0111"; 
  constant displaystart:  std_logic_vector(3 downto 0) := B"1000"; 
  constant displaygo:  std_logic_vector(3 downto 0) := B"1001"; 
  constant leftspin:   std_logic_vector(3 downto 0) := B"1010"; 
  constant rightspin:   std_logic_vector(3 downto 0) := B"1011";
  constant displaywait:   std_logic_vector(3 downto 0) := B"1100"; 
  constant displayback:   std_logic_vector(3 downto 0) := B"1101"; 
  constant displayturnl:   std_logic_vector(3 downto 0) := B"1110"; 
  constant displayturnr:   std_logic_vector(3 downto 0) := B"1111"; 
   
end package instructions;