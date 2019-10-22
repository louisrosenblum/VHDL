library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_n_sub_8bit_TB is
end entity;

architecture add_n_sub_8bit_TB_arch of add_n_sub_8bit_TB is

component add_n_sub_8bit is
	port 	(A,B : in std_logic_vector(7 downto 0);
		sign : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		CBout : out std_logic;
		Vout : out std_logic);
end component;

signal A_TB, B_TB, Sum_TB : std_logic_vector(7 downto 0);
signal sign_TB,Cout_TB, Vout_TB : std_logic;

begin

DUT : add_n_sub_8bit port map (A_TB,B_TB,Sign_TB,Sum_TB,Cout_TB,Vout_TB);

STIM : process

	begin
		for k in 0 to 1 loop
		for i in 0 to 255 loop
			for j in 0 to 255 loop

				A_TB <= std_logic_vector(to_unsigned(i,8));
				B_TB <= std_logic_vector(to_unsigned(j,8));
				sign_TB <= std_logic(to_unsigned(k,1)(0));
				wait for 30 ns;

			end loop;
		end loop;
		end loop;
	end process;

end architecture;
