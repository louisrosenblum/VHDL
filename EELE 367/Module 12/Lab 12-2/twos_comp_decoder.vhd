library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity twos_comp_decoder is
	port(two_in : in std_logic_vector(3 downto 0);
			mag_out : out std_logic_vector(6 downto 0);
			sign_out : out std_logic_vector(6 downto 0));
			end entity;
			

architecture twos_comp_decoder_arch of twos_comp_decoder is

		begin
		
		DISPLAY : process(two_in)
		
			begin
		
			if (two_in = "0000") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "1000000"; -- Zero
				
			elsif (two_in = "0001") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "1111001"; -- One
				
			elsif (two_in = "0010") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "0100100"; -- Two
				
			elsif (two_in = "0011") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "0110000"; -- Three
				
			elsif (two_in = "0100") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "0011001"; -- Four
				
			elsif (two_in = "0101") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "0010010"; -- Five

			elsif (two_in = "0110") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "0000010"; -- Six
				
			elsif (two_in = "0111") then
				sign_out <= "1111111"; -- Positive
				mag_out <= "1111000"; -- Seven
				
				elsif (two_in = "1000") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "0000000"; -- Eight
				
				elsif (two_in = "1001") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "1111000"; -- Seven
				
				elsif (two_in = "1010") then
				sign_out <= "0111111"; -- Negative
				mag_out  <= "0000010"; -- Six
				
				elsif (two_in = "1011") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "0010010"; -- Five
				
				elsif (two_in = "1100") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "0011001"; -- Four
				
				elsif (two_in = "1101") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "0110000"; -- Three
				
				elsif (two_in = "1110") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "0100100"; -- Two
				
				elsif (two_in = "1111") then
				sign_out <= "0111111"; -- Negative
				mag_out <= "1111001"; -- One
				
				else 
				
				sign_out <= "0111111";
				mag_out <= "0111111";
				
				end if;
				
				end process;








end architecture;