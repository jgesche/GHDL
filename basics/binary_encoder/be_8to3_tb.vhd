

library ieee;
use ieee.std_logic_1164.all;

entity be_8to3_tb is
end be_8to3_tb;


architecture behavior of be_8to3_tb is
  signal d_in: std_logic_vector(7 downto 0);
  signal q_out: std_logic_vector(2 downto 0);
begin
  UUT : entity work.be_8to3 port map (d_in, q_out);
   process
     begin
       d_in<="00000001";
       wait for 10 ns;
       d_in<="00000010";
       wait for 10 ns;
       d_in<="00000100";
       wait for 10 ns;
       d_in<="00001000";
       wait for 10 ns;
       d_in<="00010000";
       wait for 10 ns;
       d_in<="00100000";
       wait for 10 ns;
       d_in<="01000000";
       wait for 10 ns;
       d_in<="10000000";
       wait for 10 ns;
       wait;
   end process;
end behavior;
