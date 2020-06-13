-------------------------------------------------------
-- Project : 8x3 Priority Encoder
-- Author : Julian Gesche
-- Date : 2020-01-02
-- File : be_8to3.vhd
------------------------------------------------------
-- Description : This unit works as 8 to 3 priority encoder
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity be_8to3 is
  Port(
    d_in: in std_logic_vector(7 downto 0);
    q_out: out std_logic_vector(2 downto 0));
end;

architecture rtl of be_8to3 is
begin
 process(d_in)
     begin
      if (d_in="00000010") then
        q_out <= "001";
      elsif (d_in="00000100") then
        q_out <= "010";
      elsif (d_in="00001000") then
        q_out <= "011";
      elsif (d_in="00010000") then
        q_out <= "100";
      elsif (d_in="00100000") then
        q_out <= "101";
      elsif (d_in="01000000") then
        q_out <= "110";
      elsif (d_in="10000000") then
        q_out <= "111";
      elsif (d_in="00000001") then
        q_out <= "000";
      else
        q_out <= "ZZZ";
      end if;
  end process;
end rtl;
