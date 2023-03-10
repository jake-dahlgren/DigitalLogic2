--Jake Dahlgren 1/24/2023
--Decode instructions to the digibot
library ieee; use ieee.std_logic_1164.all; 
library work; use work.instructions.all; 
library work; use work.dseg7font.all; 
 
entity idecode is  
port(
    instruction: in std_logic_vector(2 downto 0); 
    hex2: out std_logic_vector(7 downto 0);  
    hex1: out std_logic_vector(7 downto 0);  
    hex0: out std_logic_vector(7 downto 0);  
    beeper: out std_logic; 
    motors: out std_logic_vector(3 downto 0)); 
end entity idecode; 
 
architecture mux of idecode is  

begin  
 
  with instruction select  
  hex2 <= dseg7_r when displayrun, -- r 
          dseg7_e when displayend, -- e 
      dseg7_blank when others; -- display off 
 
  with instruction select  
  hex1 <= dseg7_u when displayrun, -- u 
          dseg7_n when displayend, -- n 
      dseg7_blank when others; -- display off 
        
  with instruction select  
  hex0 <= dseg7_n when displayrun, -- n 
          dseg7_d when displayend, -- d 
      dseg7_blank when others; -- display off
     
  with instruction select  
  beeper <= '1' when beep,  
            '0' when others; 
         
  with instruction select motors <= 
  B"1111" when forward,  
  B"1100" when backward,
  B"0111" when rightturn,
  B"1011" when leftturn,
  B"0000" when others;
 
         
end architecture mux; 