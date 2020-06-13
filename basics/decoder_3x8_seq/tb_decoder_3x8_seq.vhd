-------------------------------------------------------
-- Project : 3x8 Priority Decoder
-- Author : Julian Gesche
-- Date : 2020-01-02
-- File : tb_decoder_3x8_seq.vhd
------------------------------------------------------
-- Description : Testbench for 3x8 priority decoder
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_3x8_seq is
end;

architecture behavior of tb_decoder_3x8_seq is
  signal d_in: std_logic_vector(2 downto 0);
  signal q_out: std_logic_vector(7 downto 0);
begin
  UUT : entity work.decoder_3x8_seq port map (d_in, q_out);
  process
    begin
       d_in<="000";
       wait for 10 ns;
       d_in<="001";
       wait for 10 ns;
       d_in<="010";
       wait for 10 ns;
       d_in<="011";
       wait for 10 ns;
       d_in<="100";
       wait for 10 ns;
       d_in<="101";
       wait for 10 ns;
       d_in<="110";
       wait for 10 ns;
       d_in<="111";
       wait for 10 ns;
       wait;
    end process;
end behavior;
