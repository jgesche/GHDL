-------------------------------------------------------
-- Project : 
-- Author : juliangesche
-- Date : 2020-05-14
-- File : tb_sr_latch.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_sr_latch is
end;

architecture behavior of tb_sr_latch is
  signal set, rst: std_logic := '0';
  signal q, q_bar: std_logic := '0';
begin
  UUT: entity work.sr_latch port map(set, rst, q, q_bar);
  process
    begin
    set <= '0';
    rst <= '0';
    wait for 20 ns;
    set <= '1';
    wait for 20 ns;
    set <= '0';
    rst <= '1';
    wait for 20 ns;
    set <= '1';
    rst <= '1';
    wait for 20 ns;
    wait;
    end process;
end;
