--Jake Dahlgren 1/32/2023
--Decode instructions to the digibot
library ieee; use ieee.std_logic_1164.all; 
library work; use work.instructions.all; 
library work; use work.dseg7font.all; 
 
entity idecode is  
port(
    instruction: in std_logic_vector(3 downto 0); 
	 hex5: out std_logic_vector(7 downto 0);
    hex4: out std_logic_vector(7 downto 0);  
    hex3: out std_logic_vector(7 downto 0);
    hex2: out std_logic_vector(7 downto 0);  
    hex1: out std_logic_vector(7 downto 0);  
    hex0: out std_logic_vector(7 downto 0);  
    beeper: out std_logic; 
    motors: out std_logic_vector(3 downto 0);
	 coll: in std_logic); 
end entity idecode; 
 
architecture mux of idecode is  
signal hex0i, hex1i, hex2i, hex3i, hex4i, hex5i: std_logic_vector(7 downto 0);
signal motorsi: std_logic_vector(3 downto 0);
begin  
	
	with coll select 
	hex0 <= dseg7_e when '1',
			  hex0i when others;
	with coll select 
	hex1 <= dseg7_v when '1',
			  hex1i when others;
	with coll select 
	hex2 <= dseg7_o when '1',
			  hex2i when others;
	with coll select 
	hex3 <= dseg7_m when '1',
			  hex3i when others;
	with coll select 
	hex4 <= dseg7_blank when '1',
			  hex4i when others;
	with coll select 
	hex5 <= dseg7_blank when '1',
			  hex5i when others;

  
  with instruction select  
  hex5i <= 
			 dseg7_t when displayturnr,
          dseg7_t when displayturnl,
      dseg7_blank when others; -- display off 
 
  with instruction select  
  hex4i <= dseg7_h when displayhello,
       
			 dseg7_u when displayturnr,
          dseg7_u when displayturnl,
			 
      dseg7_blank when others; -- display off 
        
  with instruction select  
  hex3i <= dseg7_e when displayhello,
          
			 dseg7_r when displayturnr,
          dseg7_r when displayturnl,
			 dseg7_w when displaywait, 
          dseg7_b when displayback,
      dseg7_blank when others; -- display off
 
  with instruction select  
  hex2i <= dseg7_l when displayhello,
      
			 dseg7_n when displayturnr,
          dseg7_n when displayturnl,
			 dseg7_a when displaywait, 
          dseg7_o when displayoff,
			 dseg7_a when displayback,
      dseg7_blank when others; -- display off 
 
  with instruction select  
  hex1i <= dseg7_l when displayhello,
          dseg7_g when displaygo,
			 dseg7_blank when displayturnr,
          dseg7_blank when displayturnl,
			 dseg7_i when displaywait, 
          dseg7_f when displayoff,
			 dseg7_c when displayback,
      dseg7_blank when others; -- display off 
        
  with instruction select  
  hex0i <= dseg7_o when displayhello,
          dseg7_o when displaygo,
			 dseg7_r when displayturnr,
          dseg7_l when displayturnl,
			 dseg7_t when displaywait, 
          dseg7_f when displayoff,
			 dseg7_k when displayback,
      dseg7_blank when others; -- display off
     
  with instruction select  
  beeper <= '1' when beep,  
            '0' when others; 
         
  with instruction select motorsi <= 
  B"1111" when forward,  
  B"1100" when backward,
  B"0111" when rightturn,
  B"1011" when leftturn,
  B"1101" when rightspin,
  B"1110" when leftspin,
  B"0000" when others;
  
  with coll select motors <=
  motorsi when '0',
  B"0000" when others;
 
         
end architecture mux; 