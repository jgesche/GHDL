-------------------------------------------------------
-- Project : vga_controller
-- Author : juliangesche
-- Date : 2020-06-02
-- File : tb_pong_top_st.vhd
------------------------------------------------------
-- Description : Testbench for pong_top_st
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_pong_top_st is
end entity;


architecture behavior of tb_pong_top_st is

    -- Inputs
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';

    -- Outputs
    signal hsync, vsync: std_logic := '0';
    signal rgb: std_logic_vector(2 downto 0);
    -- Clock period definitions
    constant clk_period: time := 40 ns;

begin
    UUT : entity work.pong_top_st port map (
    clk => clk,
    rst => rst,
    hsync => hsync,
    vsync => vsync,
    rgb => rgb
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
      rst <= '1';
      wait for 100 ns;
      rst <= '0';
      wait;
    end process;
end;
