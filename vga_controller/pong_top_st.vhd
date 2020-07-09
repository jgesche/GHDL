-------------------------------------------------------
-- Project : VGA
-- Author : juliangesche
-- Date : 2020-05-31
-- File : pong-top-st.vhd
------------------------------------------------------
-- Description : Top Unit for VGA Controller
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pong_top_st is
  port (
    clk ,rst: in std_logic;
    hsync , vsync: out std_logic;
    r, g, b: out std_logic_vector (3 downto 0)
    );
end pong_top_st;

architecture arch of pong_top_st is
  signal pixel_x , pixel_y: unsigned (9 downto 0 );
  signal video_on, pixel_tick, clock_new, reset: std_logic;
  signal rgb_reg, rgb_next: std_logic_vector (2 downto 0);
begin
  -- clock divider
  clock_div: entity work.clock_divider port map(clk=>clk, rst=>reset, clock_out=>clock_new);
  -- instantiate VGA sync
  vga_sync_unit: entity work.vga_sync port map(clock_new=>clk, rst=>rst,
           video_on=>video_on, p_tick=>pixel_tick,
           hsync=>hsync, vsync=>vsync, pixel_x=>pixel_x,
           pixel_y=>pixel_y);
  -- instantiate graphic generator
  pong_grf_st_unit: entity work.pong_graph_st(sq_ball_arch)
  port map (video_on=>video_on, pixel_x=>pixel_x, pixel_y=>pixel_y,
  graph_rgb=>rgb_next);
  -- rgb buffer
  process (clock_new)
    begin
      if (clock_new'event and clock_new='1') then
        if (pixel_tick='1') then
          rgb_reg <= rgb_next ;
        end if;
      end if;
    end process;
  r <= (others => rgb_reg(0));
  g <= (others => rgb_reg(1));
  b <= (others => rgb_reg(2));
end arch;
