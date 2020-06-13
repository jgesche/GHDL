-------------------------------------------------------
-- Project : VGA
-- Author : juliangesche
-- Date : 2020-05-31
-- File : pong_graph_st.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all ;

entity pong_graph_st is
  port(
    video_on: in std_logic;
    pixel_x ,pixel_y: in unsigned (9 downto 0);
    graph_rgb: out std_logic_vector (2 downto 0)
    );
end pong_graph_st;

architecture sq_ball_arch of pong_graph_st is
  signal pix_x, pix_y : unsigned (9 downto 0);
  constant MAX_X: integer :=640;
  constant MAX_Y: integer :=480;
  ---------------------------------------------
  -- vertical stripe as a wall
  ---------------------------------------------
  constant WALL_X_L: integer :=32;
  constant WALL_X_R: integer :=35;

  signal wall_on: std_logic;
  signal wall_rgb: std_logic_vector (2 downto 0) ;


  begin
    pix_x <= unsigned(pixel_x);
    pix_y <= unsigned(pixel_y);
    ---------------------------------------------
    -- (wall) left vertical stripe
    ---------------------------------------------
    wall_on <= '1' when (WALL_X_L<=pix_x) and (pix_x<=WALL_X_R) else
    '0';
    wall_rgb <= "001"; -- blue
    ---------------------------------------------
    -- rgb multiplexing circuit
    ---------------------------------------------
    process(video_on,wall_on)
    begin
      if video_on='0' then
        graph_rgb <= "000" ; --blank
      else
        if wall_on='1' then
          graph_rgb <= wall_rgb;
        else
          graph_rgb <= "110"; -- yellow background

        end if;
      end if;
    end process;
end sq_ball_arch;
