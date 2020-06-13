library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_top is
    Port ( 
	a1: in std_logic_vector(2 downto 0);
	a2: in std_logic_vector(2 downto 0);
	sel: in std_logic;
	b: out std_logic_vector(2 downto 0));
end;

architecture rtl of mux_2to1_top is

begin
	b <= a1 when (sel = '0') else a2;
end;

 
