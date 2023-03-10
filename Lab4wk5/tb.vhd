--Jake Dahlgren 1/27/2023
--test bench for traffic light

library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture testbench of tb is
signal nsRed, nsYellow, nsGreen, ewRed, ewYellow, ewGreen: std_logic;
signal enable, rst, CLK: std_logic;
begin

UUT: entity work.trafficLight port map(
nsRed=>nsRed, nsYellow=>nsYellow, nsGreen=>nsGreen, ewRed=>ewRed, ewYellow=>ewYellow, ewGreen=>ewGreen, enable=>enable, rst=>rst, CLK=>CLK
);

clock:process
begin
clk <= '0'; wait for 0.5sec;
clk <= '1'; wait for 0.5sec;
end process;

reset:process
begin
rst <= '0'; wait for 2sec;
rst <= '1'; wait for 1sec;
wait;
end process;

en:process
begin
enable <= '0', '1' after 3sec, '0' after 10sec;
wait;
end process;

end architecture;