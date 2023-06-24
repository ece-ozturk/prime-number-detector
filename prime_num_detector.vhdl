library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity prime_num_detector is
	port( count: in STD_LOGIC_VECTOR(7 downto 0);
			prime: out STD_LOGIC_VECTOR(11 downto 0));		
end prime_num_detector;


architecture Behavioral of prime_num_detector is
begin

PROCESS(count)
variable temp_num: INTEGER range 0 to 2000;
variable temp_prime: INTEGER range 0 to 2000;
variable is_prime: BIT;

BEGIN
	
	--check whether input count = 0
	IF (count = "00000000") THEN 
		temp_num := 0; 
	END IF;
	
	FIND_NEXT_PRIME: LOOP
		is_prime := '1';

		--is it 0 or 1? NOT prime
		if (temp_num=0 or temp_num=1) then 
			is_prime := '0';
		
		--is it 2? PRIME
		elsif (temp_num=2) then
			--do nothing
			
		--is it something else?
		else
			for i in 2 to temp_num - 1 loop
				if (temp_num mod i=0) then --divisible without remainder
					is_prime := '0';
					EXIT;
				end if;
		end loop;

		END IF;
		
		temp_num := temp_num + 1;
		
		if (is_prime = '1') then 
		temp_prime:=temp_num - 1;
		EXIT;
		end if;
		
	
	END LOOP FIND_NEXT_PRIME;

	prime <= std_logic_vector(to_unsigned(temp_prime, 12));
			
end PROCESS;
end Behavioral;