library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binary_display is
 port (BIN_IN : in bit;
 HEX_OUT : out bit_vector (6 downto 0));
end entity;

architecture binary_display_arch of binary_display is
 begin
 
		process(BIN_IN)
			begin
				if (BIN_IN = '0') then HEX_OUT <= "1000000";
				else HEX_OUT <= "1111001";
				
				end if;
				end process;
		

end architecture;