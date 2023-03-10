--Varnell 1/5/23
-- 6 state FSM design:
-- User pushes button when fifth LED is lit to win game
-- set unused pins "as output driving ground"
-- change VHDL version to 2008
--- Pins:
-- CLK -> P11
-- RST -> A7 ('bottom' button)
-- button -> B8 ('top' button)
-- LED9 -> B11
-- LED8 -> A11
-- LED7 -> D14
-- LED6 -> E14
-- LED5 -> C13
-- LED4 -> D13
library ieee;
use ieee.std_logic_1164.all;
entity game is
port(
RST: in std_logic;
CLK: in std_logic;
button: in std_logic;
LED9, LED8, LED7, LED6, LED5, LED4: out std_logic
);
end entity;
architecture behav of game is
type state is (DP0, DP1, DP2, DP3, P, WIN);
signal Q: state;
signal D: state;
signal slow_clk: std_logic;
signal cnt: integer range 0 to 25000000;
constant pressed: std_logic:= '0';
--constant DP0: std_logic_vector(2 downto 0):= "000";
--constant DP1: std_logic_vector(2 downto 0):= "001";
--constant DP2: std_logic_vector(2 downto 0):= "010";
--constant DP3: std_logic_vector(2 downto 0):= "011";
--constant P: std_logic_vector(2 downto 0):= "100";
--constant WIN: std_logic_vector(2 downto 0):= "101";
attribute chip_pin : string;
attribute chip_pin of RST : signal is "A7";
attribute chip_pin of CLK : signal is "P11";
attribute chip_pin of button : signal is "B8";
attribute chip_pin of LED9 : signal is "B11";
attribute chip_pin of LED8 : signal is "A11";
attribute chip_pin of LED7 : signal is "D14";
attribute chip_pin of LED6 : signal is "E14";
attribute chip_pin of LED5 : signal is "C13";
attribute chip_pin of LED4 : signal is "D13";
begin
-- **** REGISTER ****--
clock:process(all)
begin
if rising_edge(slow_clk) then
if RST = '0' then
Q <= DP0;
else
Q <= D;
end if;
end if;
end process;
--**** NSL ****--t
NSL:process(all)
begin
case Q is
when DP0 =>
if button = pressed then D <= DP0;
else D <= DP1;
end if;
when DP1 =>
if button = pressed then D <= DP0;
else D <= DP2;
end if;
when DP2 =>
if button = pressed then D <= DP0;
else D <= DP3;
end if;
when DP3 =>
if button = pressed then D <= DP0;
else D <= P;
end if;
when P =>
if button = pressed then D <= WIN;
else D <= DP0;
end if;
when others => --WIN
D <= WIN;
end case;
end process;
--**** OUTPUT LOGIC ****--
LED9 <= '1' when Q = DP0 else '0';
LED8 <= '1' when Q = DP1 else '0';
LED7 <= '1' when Q = DP2 else '0';
LED6 <= '1' when Q = DP3 else '0';
LED5 <= '1' when Q = P   else '0';
LED4 <= '1' when Q = WIN else '0';
--**** SLOW CLOCK PROCESS ****--
SlowClock:process(all)
begin
if rising_edge(CLK)
then  cnt <= cnt+1;
if cnt = 3000000 then -- 8.3 Hz slow clock
slow_clk <= not slow_clk;
cnt <= 0;
end if;
end if;
end process;
end architecture;