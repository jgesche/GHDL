-------------------------------------------------------
-- Project : 3x8 Priority Decoder
-- Author : Julian Gesche
-- Date : 2020-01-02
-- File : decoder_3x8_seq.vhd
------------------------------------------------------
-- Description : This unit works as 3x8 priority decoder
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity decoder_3x8_seq is
  Port(
    d_in: in std_logic_vector(2 downto 0);
    q_out: out std_logic_vector(7 downto 0)
  );
end;

architecture rtl of decoder_3x8_seq is
begin
  process(d_in)
    begin
      if(d_in="000") then
        q_out <= "00000001";
      elsif (d_in="001") then
        q_out <= "00000010";
      elsif (d_in="010") then
        q_out <= "00000100";
      elsif (d_in="011") then
        q_out <= "00001000";
      elsif (d_in="100") then
        q_out <= "00010000";
      elsif (d_in="101") then
        q_out <= "00100000";
      elsif (d_in="110") then
        q_out <= "01000000";
      elsif (d_in="111") then
        q_out <= "10000000";
      else q_out <= "XXXXXXXX";
      end if;
    end process;
end rtl;
