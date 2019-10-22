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

		write(current_write, string'("Input Vector ABCD_TB = "));
		write(current_write, ABCD_TB);
		write(current_write, string'(" Output F_TB = "));
		write(current_write, F_TB);
		writeline(OUTPUT, current_write);


		end loop;
		
		wait;

			end process;
end architecture;


