----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:16:43 05/06/2023 
-- Design Name: 
-- Module Name:    counter_and_prime_num_detector - structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_and_prime_num_detector is

	PORT( board_clock : in  STD_LOGIC;
         EN : in  STD_LOGIC;
         RSET: in STD_LOGIC := '0';
			prime: out STD_LOGIC_VECTOR(11 downto 0));

end counter_and_prime_num_detector;


architecture structural of counter_and_prime_num_detector is

component eight_bit_counter

	PORT(board_clock : in  STD_LOGIC;
        EN : in  STD_LOGIC;
        RSET: in STD_LOGIC := '0';
		  COUNT: out STD_LOGIC_VECTOR(7 downto 0));
	
end component;

component prime_num_detector

	PORT(count: in STD_LOGIC_VECTOR(7 downto 0);
		  prime: out STD_LOGIC_VECTOR(11 downto 0));

end component;

signal mid1: STD_LOGIC_VECTOR(7 downto 0);
signal mid2: STD_LOGIC_VECTOR(11 downto 0);

begin

eight_bit_counter1: eight_bit_counter PORT MAP(board_clock, EN, RSET, mid1);
prime_num_detector1: prime_num_detector PORT MAP(mid1, mid2);

prime <= mid2; 

end structural;

