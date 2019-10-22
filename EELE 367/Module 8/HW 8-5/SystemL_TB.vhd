library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity SystemL_TB is
end entity;

architecture SystemL_TB_arch of SystemL_TB is
	

	signal ABCD_TB: std_logic_vector(3 downto 0);
	signal F_TB: std_logic;

	component SystemL is
	 	port (ABCD  : in  std_logic_vector(3 downto 0);
        F     : out std_logic);
	end component;


	begin

	DUT1 : SystemL port map (ABCD => ABCD_TB, F => F_TB);

	STIM: process

	file Fin: TEXT open READ_MODE is "input_vectors.txt";

	variable current_line: line;
	variable current_field: std_logic_vector(3 downto 0);
	variable current_write: line;

	begin

		while (not endfile(Fin)) loop
		
		readline(Fin, current_line);
		read(current_line, current_field);
		ABCD_TB <= current_field; wait for 100 ns;
		
		if (ABCD_TB = "0000") then assert (F_TB ='1') report "Failed at input 0000" severity FAILURE;
		elsif (ABCD_TB = "0001") then assert (F_TB ='0') report "Failed at input 0001" severity FAILURE;
		elsif (ABCD_TB = "0010") then assert (F_TB ='1') report "Failed at input 0010" severity FAILURE;
		elsif (ABCD_TB = "0011") then assert (F_TB ='1') report "Failed at input 0011" severity FAILURE;
		elsif (ABCD_TB = "0100") then assert (F_TB ='1') report "Failed at input 0100" severity FAILURE;
		elsif (ABCD_TB = "0101") then assert (F_TB ='1') report "Failed at input 0101" severity FAILURE;
		elsif (ABCD_TB = "0110") then assert (F_TB ='1') report "Failed at input 0110" severity FAILURE;
		elsif (ABCD_TB = "0111") then assert (F_TB ='1') report "Failed at input 0111" severity FAILURE;
		elsif (ABCD_TB = "1000") then assert (F_TB ='1') report "Failed at input 1000" severity FAILURE;
		elsif (ABCD_TB = "1001") then assert (F_TB ='0') report "Failed at input 1001" severity FAILURE;
		elsif (ABCD_TB = "1010") then assert (F_TB ='1') report "Failed at input 1010" severity FAILURE;
		elsif (ABCD_TB = "1011") then assert (F_TB ='0') report "Failed at input 1011" severity FAILURE;
		elsif (ABCD_TB = "1100") then assert (F_TB ='1') report "Failed at input 1100" severity FAILURE;
		elsif (ABCD_TB = "1101") then assert (F_TB ='0') report "Failed at input 1101" severity FAILURE;
		elsif (ABCD_TB = "1110") then assert (F_TB ='1') report "Failed at input 1110" severity FAILURE;
		elsif (ABCD_TB = "1111") then assert (F_TB ='1') report "Failed at input 1111" severity FAILURE;
		end if;
		
		
		write(current_write, string'("Input Vector ABCD_TB = "));
		write(current_write, ABCD_TB);
		write(current_write, string'(" Output F_TB = "));
		write(current_write, F_TB);
		writeline(OUTPUT, current_write);


		end loop;
		
		wait;

			end process;
end architecture;


