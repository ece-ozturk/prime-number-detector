library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity shift_and_add3 is
port(
        binary: in std_logic_vector(11 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)

    );
end shift_and_add3;

architecture Behavioral of shift_and_add3 is

signal i : INTEGER;

begin

process(binary) 
variable temp_bcd0: UNSIGNED(3 downto 0);
variable temp_bcd1: UNSIGNED(3 downto 0);
variable temp_bcd2: UNSIGNED(3 downto 0);
variable temp_bcd3: UNSIGNED(3 downto 0);
variable temp_bcd4: UNSIGNED(3 downto 0);
begin

temp_bcd0 := "0000";
temp_bcd1 := "0000";
temp_bcd2 := "0000";
temp_bcd3 := "0000";
temp_bcd4 := "0000";

--variable i: INTEGER := 15;

--if i >= 0 then
for i in 11 downto 0 loop
	if (temp_bcd4 >4) then 
		temp_bcd4 := temp_bcd4 + 3;
	end if;
	
	if (temp_bcd3 >4) then 
		temp_bcd3 := temp_bcd3 + 3;
	end if;
	
	if (temp_bcd2 >4) then 
		temp_bcd2 := temp_bcd2 + 3;
	end if;
	
	if (temp_bcd1 >4) then 
		temp_bcd1 := temp_bcd1 + 3;
	end if;
	
	if (temp_bcd0 >4) then 
		temp_bcd0 := temp_bcd0 + 3;
	end if;

	temp_bcd4 := temp_bcd4 sll 1;
	temp_bcd4(0) := temp_bcd3(3);

	temp_bcd3 := temp_bcd3 sll 1;
	temp_bcd3(0) := temp_bcd2(3);

	temp_bcd2 := temp_bcd2 sll 1;
	temp_bcd2(0) := temp_bcd1(3);
	
	temp_bcd1 := temp_bcd1 sll 1;
	temp_bcd1(0) := temp_bcd0(3);
	
	temp_bcd0 := temp_bcd0 sll 1;
	temp_bcd0(0) := binary(i);

--end if;
end loop;

bcd3 <= STD_LOGIC_VECTOR(temp_bcd3);
bcd2 <= STD_LOGIC_VECTOR(temp_bcd2);
bcd1 <= STD_LOGIC_VECTOR(temp_bcd1);
bcd0 <= STD_LOGIC_VECTOR(temp_bcd0);

end process;

end Behavioral;

