library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity eight_bit_counter is
    Port ( board_clock : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RSET: in STD_LOGIC := '0';
				COUNT: out STD_LOGIC_VECTOR(7 downto 0));
end eight_bit_counter;



architecture Behavioral of eight_bit_counter is


component counter
    port (board_clock: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			reset: IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(7 downto 0));
end component;


component freq_divider
	port (our_clock : in STD_LOGIC;
			clock_enable : out STD_LOGIC);
end component;

signal fp0, fp1, fp2, fp3, fp4, fp5, fp6, fp7, mid_e: STD_LOGIC;
--signal vec :  STD_LOGIC_VECTOR(7 downto 0);


begin

our_freq_divider: freq_divider PORT MAP(board_clock, mid_e);
our_counter: counter PORT MAP(q(0)=>fp0, q(1)=>fp1, q(2)=>fp2, q(3)=>fp3, q(4)=>fp4, q(5)=>fp5, q(6)=>fp6, q(7)=> fp7, reset=>RSET, board_clock=>board_clock, enable=>mid_e);


COUNT(0) <= fp0;
COUNT(1) <= fp1;
COUNT(2) <= fp2;
COUNT(3) <= fp3;
COUNT(4) <= fp4;
COUNT(5) <= fp5;
COUNT(6) <= fp6;
COUNT(7) <= fp7;

end Behavioral;