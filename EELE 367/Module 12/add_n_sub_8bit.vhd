library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity add_n_sub_8bit is
	port 	(A,B : in std_logic_vector(7 downto 0);
		sign : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		CBout : out std_logic;
		Vout : out std_logic);
end entity;

architecture add_n_sub_8bit_arch of add_n_sub_8bit is

	begin

	STIM : process(A,B,sign)

		begin

		if (sign = '0') then
		sum <= std_logic_vector(signed(A) + signed(B));
			if (signed(A) > 0 and signed(B) > 0) then
				if((signed(A) + signed(B)) < 0) then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			elsif (signed(A) < 0 and signed(B) < 0) then
				if((signed(A) + signed(B)) > 0) then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			else
			Vout <= '0';
			end if;


			if (((to_integer(signed(A)) + to_integer(signed(B))) > 127)) then
				if ((signed(A) + signed(B)) > 0) then
				CBout <= '1';
				else
				CBout <= '0';
				end if;
			elsif  ((to_integer(signed(A)) + to_integer(signed(B))) < -128) then
				if ((signed(A) + signed(B)) < 0) then
				CBout <= '1';
				else
				CBout <= '0';
				end if;

			else
			CBout <='0';

			end if;


		else
		sum <= std_logic_vector(signed(A) - signed(B));
			if (signed(A) > 0 and signed(B) < 0) then
				if((signed(A) - signed(B)) < 0) then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			elsif (signed(A) < 0 and signed(B) > 0) then
				if((signed(A) - signed(B)) > 0) then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			else
			Vout <= '0';
			end if;


			if (((to_integer(signed(A)) - to_integer(signed(B))) > 127)) THEN
				if ((signed(A) + signed(B)) > 0) then
				CBout <= '1';
				else
				CBout <= '0';
				end if;
			elsif  ((to_integer(signed(A)) - to_integer(signed(B))) < -128) then
				if ((signed(A) + signed(B)) < 0) then
				CBout <= '1';
				else
				CBout <= '0';
				end if;

			else
			CBout <='0';

			end if;
		end if;
		end process;

end architecture; 

