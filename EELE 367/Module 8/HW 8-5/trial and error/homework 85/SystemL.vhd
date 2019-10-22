library IEEE;
use IEEE.std_logic_1164.all;

entity SystemL is
 	port (ABCD  : in  std_logic_vector(3 downto 0);
        F     : out std_logic);
end entity;

architecture SystemL_arch of SystemL is

	begin
		process  (ABCD)
			begin

			if (ABCD = "0000") then F <= '1';
			elsif (ABCD = "0001") then F <='0';
			elsif (ABCD = "0010") then F <='1';
			elsif (ABCD = "0011") then F <='1';
			elsif (ABCD = "0100") then F <='1';
			elsif (ABCD = "0101") then F <='1';
			elsif (ABCD = "0110") then F <='1';
			elsif (ABCD = "0111") then F <='1';
			elsif (ABCD = "1000") then F <='1';
			elsif (ABCD = "1001") then F <='0';
			elsif (ABCD = "1010") then F <='1';
			elsif (ABCD = "1011") then F <='0';
			elsif (ABCD = "1100") then F <='1';
			elsif (ABCD = "1101") then F <='0';
			elsif (ABCD = "1110") then F <='1';
			elsif (ABCD = "1111") then F <='1';
			else F <='0';

				
			end if;
				

			end process;
end architecture;
		