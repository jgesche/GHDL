-------------------------------------------------------
-- Project : VGA Controller
-- Author : juliangesche
-- Date : 2020-05-08
-- File : tb_vga_controller.vhd
------------------------------------------------------
-- Description : Testbench vor VGA controller
-------------------------------------------------------
-- /
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_vga_sync is
end entity;

architecture behavior of tb_vga_sync is
  signal clk, rst: std_logic := '0';
  signal hsync, vsync, video_on, p_tick: std_logic;
  signal pixel_x, pixel_y: unsigned(9 downto 0) := (others => '0');


-- Clock period definitions
constant clk_period: time := 40 ns;

begin
  UUT : entity work.vga_sync port map (clk, rst, hsync, vsync, video_on, p_tick, pixel_x, pixel_y);
  process
    begin
      rst <='0';
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
end behavior;
