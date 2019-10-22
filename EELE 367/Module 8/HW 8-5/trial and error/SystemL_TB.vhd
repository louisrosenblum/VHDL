library IEEE;
use IEEE.std_logic_1164.all;

entity SystemJ_TB is
end entity;

architecture SystemJ_TB_arch of SystemJ_TB is
	-- Declarations

	signal ABCD_TB: bit_vector(3 downto 0);
	signal F_TB: bit;

	component SystemJ is
		port (ABCD  : in  bit_vector(3 downto 0);
         		F     : out bit);
	end component;


	begin

	DUT1 : SystemJ port map (ABCD => ABCD_TB, F => F_TB);

	

	STIM: process
		begin
			report "Starting Input Patterns" severity NOTE;

			ABCD_TB <= "0000"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 0000" severity NOTE;
			report "Inputting Pattern 0000" severity NOTE;
			ABCD_TB <= "0001"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 0001" severity NOTE;
			report "Inputting Pattern 0001" severity NOTE;
			ABCD_TB <= "0010"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 0010" severity NOTE;
			report "Inputting Pattern 0010" severity NOTE;
			ABCD_TB <= "0011"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 0011" severity NOTE;
			report "Inputting Pattern 0011" severity NOTE;
			ABCD_TB <= "0100"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 0100" severity NOTE;
			report "Inputting Pattern 0100" severity NOTE;
			ABCD_TB <= "0101"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 0101" severity NOTE;
			report "Inputting Pattern 0101" severity NOTE;
			ABCD_TB <= "0110"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 0110" severity NOTE;
			report "Inputting Pattern 0110" severity NOTE;
			ABCD_TB <= "0111"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 0111" severity NOTE;
			report "Inputting Pattern 0111" severity NOTE;
			ABCD_TB <= "1000"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 1000" severity NOTE;
			report "Inputting Pattern 1000" severity NOTE;
			ABCD_TB <= "1001"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 1001" severity NOTE;
			report "Inputting Pattern 1001" severity NOTE;
			ABCD_TB <= "1010"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 1010" severity NOTE;
			report "Inputting Pattern 1010" severity NOTE;
			ABCD_TB <= "1011"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 1011" severity NOTE;
			report "Inputting Pattern 1011" severity NOTE;
			ABCD_TB <= "1100"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 1100" severity NOTE;
			report "Inputting Pattern 1100" severity NOTE;
			ABCD_TB <= "1101"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 1101" severity NOTE;
			report "Inputting Pattern 1101" severity NOTE;
			ABCD_TB <= "1110"; wait for 10 ns;
			assert (F_TB ='0') report "Failed at input 1110" severity NOTE;
			report "Inputting Pattern 1110" severity NOTE;
			ABCD_TB <= "1111"; wait for 10 ns;
			assert (F_TB ='1') report "Failed at input 1111" severity NOTE;
			report "Inputting Pattern 1111" severity NOTE;

		end process;
end architecture;



