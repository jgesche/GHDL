-------------------------------------------------------
-- Project : 
-- Author : juliangesche
-- Date : 2020-05-14
-- File : sr_latch.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sr_latch is
  Port(
    set, rst: in std_logic;
    q, qbar: buffer std_logic
  );
end;

architecture rtl of sr_latch is

begin
q <= rst nand qbar;
qbar <= set nand q;

end;
