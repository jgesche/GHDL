-------------------------------------------------------
-- Project : clock divider
-- Author : juliangesche
-- Date : 2020-04-23
-- File : clock_divider.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
Port (clk, reset: in std_logic;
      clock_out: out std_logic);
end;

architecture rtl of clock_divider is

signal count: integer:=1;
signal tmp : std_logic:= '0';

begin
  process(clk,reset)
    begin
    if (reset='1') then
      count<=1;
      tmp<='0';
    elsif (clk'event and clk='1') then
      count<=count+1;
      if (count = 25000) then
        tmp <= NOT tmp;
        count <= 1;
      end if;
    end if;
    clock_out <= tmp;
  end process;
end rtl;


