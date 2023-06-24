library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_divider is
	port (our_clock: IN STD_LOGIC;
			clock_enable: OUT STD_LOGIC);
end freq_divider;

architecture Behavioral of freq_divider is

begin

	process (our_clock) is
		variable count: natural;
	begin
		if rising_edge(our_clock) then
			clock_enable <= '0';
			count := count +1;
			if count = 50000000 then 
			clock_enable <= '1';
			count := 0;
			end if;
		end if;
	end process;

end Behavioral;
