library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

entity SystemL_TB is
end entity;

architecture SystemL_TB_arch of SystemL_TB is
	-- Declarations

	signal ABCD_TB: std_logic_vector(3 downto 0);
	signal F_TB: std_logic;

	component SystemL is
		port (ABCD  : in  std_logic_vector(3 downto 0);
        F     : out std_logic);
	end component;


	begin

	DUT1 : SystemL port map (ABCD => ABCD_TB, F => F_TB);



	process
	
	file Dude: TEXT open READ_MODE is "e7.txt";
		
	VARIABLE cl : line;
	VARIABLE cf : std_logic_vector(3 downto 0);
	VARIABLE cw : line;
		
	begin

		while (not endfile(Dude)) loop
			
			readline(Dude, cl);
			read(cl, cf);
			ABCD_TB <= cf; wait for 100 ns;
			
			write(cw, string'("Input Vector ABCD_TB = "));
			write(cw, ABCD_TB);
			write(cw, string'(" Output F_TB = "));
			write(cw, F_TB);
			writeline(OUTPUT, cw);
			
		end loop;
			
		wait for 100 ns;


	end process;
end architecture;


