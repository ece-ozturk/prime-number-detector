library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

use IEEE.NUMERIC_STD.ALL;


entity counter is
	PORT (board_clock: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(7 downto 0));
end counter;

architecture behavioral of counter is

signal mid_q: integer range 0 to 255;


begin

COUNTER: process (board_clock, reset)
begin
	if (reset = '1') then 
		mid_q <= 0;
	elsif (rising_edge(board_clock)) then
	
		if (enable = '1') then
			if (mid_q = 255) then
				mid_q <= 0;
			else
				mid_q <= mid_q + 1;
			end if;
		end if;
	end if;
	
end process;
	
q <= std_logic_vector( to_unsigned(mid_q, 8) );

end behavioral;