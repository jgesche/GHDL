-------------------------------------------------------
-- Project : Testbench for clock divider
-- Author : juliangesche
-- Date : 2020-04-23
-- File : tb_clock_divider.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_divider is
end;

architecture behavior of tb_clock_divider is

    -- Inputs
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';

    -- Outputs
    signal clock_out: std_logic;


-- Clock period definitions
constant clk_period: time := 20 ns;

begin
    UUT : entity work.clock_divider port map (
    clk => clk,
    reset => reset,
    clock_out => clock_out
    );
    clk_process: process
      begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
      end process;

      -- Stimulus process
    stim_proc: process
      begin
      reset <= '1';
      wait for 100 ns;
      reset <= '0';
      wait;
    end process;
end;
