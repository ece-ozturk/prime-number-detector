library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity project_of_prime_num_detector is
	PORT( board_clock : in  STD_LOGIC;
				EN : in  STD_LOGIC;
				RSET: in STD_LOGIC := '0';
				SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
				SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0));
end project_of_prime_num_detector;

architecture structural of project_of_prime_num_detector is

component counter_and_prime_num_detector
	port( board_clock : in  STD_LOGIC;
         EN : in  STD_LOGIC;
         RSET: in STD_LOGIC := '0';
			prime: out STD_LOGIC_VECTOR(11 downto 0));
end component;

component shift_and_add3
port(   binary: in std_logic_vector(11 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0));
end component;

component bcd_7seg
	port ( d: in std_logic_vector (3 downto 0);
	s: out std_logic_vector ( 7 downto 0) );
end component;

component nexys3_sseg_driver
    port( 
		MY_CLK 	: in  STD_LOGIC;
		DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
		DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
		SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
		SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal mid1: STD_LOGIC_VECTOR(11 downto 0);
signal mid_bcd0, mid_bcd1, mid_bcd2, mid_bcd3, mid_bcd4, mid_an: STD_LOGIC_VECTOR(3 downto 0);
signal mid_digit0, mid_digit1, mid_digit2, mid_digit3, mid_ca: STD_LOGIC_VECTOR(7 downto 0);

begin

counter_and_prime_num_detector1: counter_and_prime_num_detector PORT MAP(board_clock, EN, RSET, mid1);
shift_and_add3_1: shift_and_add3 PORT MAP(mid1, mid_bcd0, mid_bcd1, mid_bcd2, mid_bcd3, mid_bcd4);
bcd_7seg_0: bcd_7seg PORT MAP(mid_bcd0, mid_digit0);
bcd_7seg_1: bcd_7seg PORT MAP(mid_bcd1, mid_digit1);
bcd_7seg_2: bcd_7seg PORT MAP(mid_bcd2, mid_digit2);
bcd_7seg_3: bcd_7seg PORT MAP(mid_bcd3, mid_digit3);
nexys3_1: nexys3_sseg_driver PORT MAP(board_clock, mid_digit0, mid_digit1, mid_digit2, mid_digit3, mid_ca, mid_an);

SSEG_CA <= mid_ca;
SSEG_AN <= mid_an;

end structural;

