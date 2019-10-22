library IEEE;
use IEEE.std_logic_1164.all;

entity SystemJ is
 	port (ABCD  : in  bit_vector(3 downto 0);
        F     : out bit);
end entity;

architecture SystemJ_arch of SystemJ is

	begin

		process  (ABCD)
			begin

			case (ABCD) is

				when "0000" => F <= '0';
				when "0001" => F <= '0';
				when "0010" => F <= '0';
				when "0011" => F <= '0';
				when "0100" => F <= '1';
				when "0101" => F <= '1';
				when "0110" => F <= '0';
				when "0111" => F <= '1';
				when "1000" => F <= '0';
				when "1001" => F <= '0';
				when "1010" => F <= '0';
				when "1011" => F <= '0';
				when "1100" => F <= '1';
				when "1101" => F <= '1';
				when "1110" => F <= '0';
				when "1111" => F <= '1';
				
			end case;
				

			end process;

			
			








end architecture;