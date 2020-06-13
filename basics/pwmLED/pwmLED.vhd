-------------------------------------------------------
-- Project : PWM controlled LED
-- Author : Julian Gesche
-- Date : 2020-04-09
-- File : pwmLED.vhd
------------------------------------------------------
-- Description : This unit controlles a LED with pwm
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity pwmLED is
generic(
		max_val: integer := 1000;
		val_bits: integer := 10
	);
  port(
    clk: in std_logic;
    val_cur: in std_logic_vector((val_bits - 1) downto 0);
    pulse: out std_logic
  );
end entity;

architecture arch of pwmLED is
    signal cnt: std_logic_vector((val_bits - 1) downto 0);

begin
  process(clk)
    begin
      if( clk'event and clk='1') then
        if (cnt < (max_val-1)) then
          cnt <= cnt + 1;
        else
          cnt <= (others => '0');
        end if;
      end if;
  end process;

  process(clk) -- Pulsing
  begin
   if(clk'event and clk = '1') then
     if (val_cur > cnt) then
       pulse <= '1';
     else
       pulse <= '0';
     end if;
     end if;
   end process;
end arch;



