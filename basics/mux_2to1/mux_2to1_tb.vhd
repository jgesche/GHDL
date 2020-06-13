library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_tb is
end mux_2to1_tb;

architecture behavior of mux_2to1_tb is
	signal a1, a2: std_logic_vector(2 downto 0);
	signal sel: std_logic;
	signal b: std_logic_vector(2 downto 0);
begin
 UUT : entity work.mux_2to1_top port map (a1 => a1, a2 => a2, sel => sel, b => b);

    process
    begin
       wait for 10 ns;
       a1 <= "101";
       wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
       a2 <= "111";
       wait for 10 ns;
       sel <= '0';
       wait for 10 ns;
       wait;
    end process;
end behavior;

