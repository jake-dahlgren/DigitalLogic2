-- ******************************************************** 
-- * PROJECT:   lab9 
-- * ENTITY:    lab9  
-- * AUTHOR:    Jake Dahlgren 
-- * DATE:    	 2/14/2023   
-- * PROVIDES:  
-- * - This is a single file solution to a special purpose  
-- *   data path solving -6X + 4Y + 2. 
-- *  
-- * - All components of the data path are described in  
-- *   this single VHDL file.  
-- ******************************************************** 
-- * INPUTS 
-- ******************************************************** 
-- * - rst:    active-low synchronous reset signal used to  
-- *           zero the controller FSM register as well as  
-- *           the data path registers A and B  
-- * 
-- * - clk:     rising-edge triggered register clock used   
-- *            by all registers  
-- * 
-- * - sliders: 8-bits of user data  
-- *            upper nibble = user input x  
-- *            lower nibble = user input y  
-- ******************************************************** 
-- * OUTPUTS 
-- ******************************************************** 
-- * - hex1: seven-segment decoder output for upper nibble  
-- *         of calculation result  
-- *  
-- * - hex0: seven-segment decoder output for lower nibble  
-- *         of calculation result  
-- ******************************************************** 
-- * INTERNAL SIGNALS  
-- ******************************************************** 
-- * -      d:  register input for controller FSM register 
-- * -      q:  register output for controller FSM register  
-- * -    lda:  active-low load enable for register A 
-- * - rega_d:  data input for data path register A 
-- * - rega_q:  data output for data path register A 
-- * -    ldb:  active-low load enable for register B 
-- * - regb_d:  data input for data path register B  
-- * - regb_q:  data output for data path register B 
-- * -   alus:  alu function select bus   
-- * -   aluf:  alu output  
-- * -   muxs:  4-to-1 data selector/mux select bus  
-- * - muxout:  4-to-1 data selector/mux output  
-- ******************************************************** 
-- * USES  
-- ******************************************************** 
-- * - ieee std_logic_1164 package 
-- * - ieee std_logic_unsigned package 
-- * - ce1911 dseg7font package  
-- ******************************************************** 
 
-- load library packages 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
use work.dseg7font.all; 
 
-- describe functional block symbol 
entity lab9 is  
port(rst, clk: in std_logic; 
     sliders: in std_logic_vector(7 downto 0); 
	  hex1, hex0: out std_logic_vector(7 downto 0));
end entity lab9; 
 
-- describe the system architecture in this single file 
architecture system of lab9 is  
   
  -- chip pins 
  attribute chip_pin: string; 
  attribute chip_pin of hex0: signal is "D15,C17,D17,E16,C16,C15,E15,C14"; 
  attribute chip_pin of hex1: signal is "A16,B17,A18,A17,B16,E18,D18,C18"; 
  attribute chip_pin of sliders: signal is "A14,A13,B12,A12,C12,D12,C11,C10"; 
         
  attribute chip_pin of rst: signal is "B8"; 
  attribute chip_pin of clk: signal is "P11"; 
 
  -- internal signals  
  signal      d: std_logic_vector(3 downto 0); 
  signal      q: std_logic_vector(3 downto 0);  
  signal    lda: std_logic; 
  signal rega_d: std_logic_vector(7 downto 0); 
  signal rega_q: std_logic_vector(7 downto 0); 
  signal    ldb: std_logic; 
  signal regb_d: std_logic_vector(7 downto 0); 
  signal regb_q: std_logic_vector(7 downto 0); 
  signal   alus: std_logic_vector(2 downto 0); 
  signal   aluf: std_logic_vector(7 downto 0);
  signal   muxs: std_logic_vector(1 downto 0);
  signal muxout: std_logic_vector(7 downto 0);
   
     
begin  
 
  -- ***************** controller section *************************** 
  -- * next state logic: saturating up counter 
  -- * register: synchronous reset and no load control 
  -- * output logic: with-select for muxs, alus, lda, ldb, dispsel  
  -- **************************************************************** 
   
  -- next state logic 
  
  d <= q + 1 when q < 4d"8" else q; 
   
  -- register process 
  reg: process(all)  
  begin  
    if rising_edge(clk) then  
     if rst = '0' then q <= B"0000";  
     else q <= d; 
     end if; 
    end if; 
  end process; 
   
  -- control signal output logic 
  with q select  
  muxs <= B"11" when X"0",
			 B"10" when X"4",  
          B"00" when others; 
   
  with q select  
  alus <= B"101" when X"7" | X"5",
			 B"100" when X"6",
			 B"011" when X"2" | X"1",
			 B"010" when X"3",
          B"000" when others; 
   
  with q select  
  lda <= '1' when X"3"|X"7"|X"8", 
         '0' when others; 
   
  with q select  
  ldb <= '1' when X"1"|X"4"|X"5"|X"6"|X"8", 
         '0' when others; 
-- ***************** alu section ********************************** 
  -- * alu input signal: alus  
  -- *    alus: 0=0,1=1,2=B-1,3=A+B,4=A-B,5=A+A,6=A AND B,7=A OR B 
  -- * 
  -- * alu output signal: aluf   
  -- **************************************************************** 
  with alus select  
  aluf <= X"00" when B"000",  
          X"01" when B"001", 
			 regb_q-1 when B"010",
			 rega_q+regb_q when B"011",
			 rega_q-regb_q when B"100",
			 rega_q+rega_q when B"101",
			 rega_q and regb_q when B"110",    
    rega_q or regb_q when others;  
        
  -- ***************** alu register section ************************* 
  -- * rega: 8-bit register with synchronous load and reset signals 
  -- * regb: 8-bit register with synchronous load and reset signals 
  -- **************************************************************** 
   
  -- connect registers to shared muxout data bus 
  rega_d <= muxout; 
  regb_d <= muxout; 
   
  registera: process(rst,clk,lda) 
  begin  
    if rising_edge(CLK) then  
     if rst = '0' then rega_q<= 8d"0"; 
     elsif lda = '0' then rega_q<= rega_d; 
     end if; 
   end if; 
  end process; 
   
  registerb: process(rst,clk,ldb) 
  begin  
    if rising_edge(CLK) then  
     if rst = '0' then regb_q<= 8d"0"; 
     elsif ldb = '0' then regb_q<= regb_d; 
     end if; 
   end if; 
  end process; 
   
  -- ***************** data path mux ******************************** 
  -- * d3: algebraic input X (attached to DE10 sliders 7..4) 
  -- * d2: algebraic input Y (attached to DE10 sliders 3..0) 
  -- * d1: grounded  
  -- * d0: attached to ALUF signal  
  -- **************************************************************** 
   
  -- this multiplexer extends four-bit input nibbles x and y to 
  -- 8-bit output data bytes by concatenating (&) a zero-value upper nibble 
  with muxs select  
  muxout <= B"0000"&sliders(7 downto 4) when B"11", -- x 
            B"0000"&sliders(3 downto 0) when B"10", -- y 
				B"00000000" when B"01", --Zero
            aluf when others;  --ALU function result
        
  -- ***************** seg7decoder ********************************** 
  -- * displays the 8-bit value in register b as two hex nibbles   
  -- * on seven segment displays 
  -- *  
  -- * uses: dseg7font package  
  -- **************************************************************** 
   
  with regb_q(7 downto 4) select -- upper nibble  
  hex1 <= dseg7_0 when X"0",  
          dseg7_1 when X"1",
			 dseg7_2 when X"2",
			 dseg7_3 when X"3",
			 dseg7_4 when X"4",
			 dseg7_5 when X"5",
			 dseg7_6 when X"6",
			 dseg7_7 when X"7",
			 dseg7_8 when X"8",
			 dseg7_9 when X"9",
			 dseg7_a when X"A",
			 dseg7_b when X"B",
			 dseg7_c when X"C",
			 dseg7_d when X"D",
			 dseg7_e when X"E",
			 dseg7_f when X"F",
    dseg7_blank when others; 
        
  with regb_q(3 downto 0) select -- lower nibble  
  hex0 <= dseg7_0 when X"0",  
          dseg7_1 when X"1",
			 dseg7_2 when X"2",
			 dseg7_3 when X"3",
			 dseg7_4 when X"4",
			 dseg7_5 when X"5",
			 dseg7_6 when X"6",
			 dseg7_7 when X"7",
			 dseg7_8 when X"8",
			 dseg7_9 when X"9",
			 dseg7_a when X"A",
			 dseg7_b when X"B",
			 dseg7_c when X"C",
			 dseg7_d when X"D",
			 dseg7_e when X"E",
			 dseg7_f when X"F",
    dseg7_blank when others;
        
end architecture system;