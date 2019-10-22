

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binary is
 port (BIN_IN : in std_logic;
 HEX_OUT : out std_logic_vector (6 downto 0));
end entity;

architecture binary_arch of binary is
 begin
 
		process(BIN_IN)
			begin
				if (BIN_IN = '0') then HEX_OUT <= "1000000";
				else HEX_OUT <= "1111001";
	
				
					end if;
				end process;
		

end architecture;

