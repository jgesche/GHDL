-------------------------------------------------------
-- Project : VGA
-- Author : juliangesche
-- Date : 2020-05-06
-- File : vga_sync.vhd
------------------------------------------------------
-- Description : 
-------------------------------------------------------
-- /
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_sync is
    generic(
    -- 800
     HD: integer := 640; -- horizontal display area
     HF: integer := 16;  -- h. front porch
     HB: integer := 48;  -- h. back porch
     HR: integer := 96;  -- h. retrace
	 -- VD+VF+VB+VR-1 -> 1087
     VD: integer := 480; -- vertical display area
     VF: integer := 10;  -- v. front porch
     VB: integer := 33;  -- v. back porch
     VR: integer := 2   -- v. retrace
    );
    port(
      clk, rst: in std_logic;
      hsync, vsync: out std_logic;
      video_on, p_tick: out std_logic;
      pixel_x, pixel_y: out unsigned (9 downto 0)
    );
end vga_sync;

architecture behavior of vga_sync is
    signal v_count: unsigned(9 downto 0) := (others => '0');
    signal h_count: unsigned(9 downto 0) := (others => '0');
    begin

      process(clk, rst)
      begin
        if rst='1' then
            v_count <= (others => '0');
            h_count <= (others => '0');
        elsif clk'event and clk = '1' then
          if (h_count < (HD + HF + HB + HR - 1)) then
            h_count <= h_count + 1;
          else
            h_count <= (others => '0');
          end if;
          if (h_count = (HD + HF + HR -1)) then
            if (v_count < (VD + VF + VB + VR - 1)) then
              v_count <= v_count +1;
            else
               v_count <= (others => '0');
            end if;
          end if;
        end if;
      end process;
      -- horizontal and vertical sync
      hsync <= '1' when (h_count >= (HR)) and
                      (h_count <= (HD + HF + HB + HR - 1)) else
             '0';
      vsync <= '0' when (v_count > (VR)) and
                      (v_count <= (VD + VF + VR)) else
             '1';
    -- video on/off
    video_on <= '1' when (h_count <  (HD + HF + HR)) and (h_count >= (HR + HF)) and
                         (v_count < (VD +VF + VR)) and (h_count <= (VR + VF)) else '0';
    -- output signal
    pixel_x <= h_count;
    pixel_y <= v_count;
    p_tick <= clk;
end;
