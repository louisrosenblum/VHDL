library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom_64x8_sync is
	port(clock: in std_logic;
			address : in std_logic_vector(5 downto 0);
			data_out : out std_logic_vector(7 downto 0));
end entity;

architecture rom_64x8_sync_arch of rom_64x8_sync is

	signal int : integer;
	

	begin
	
	
	MEMORY : process(clock, address)
	
		begin
		
		if (rising_edge(clock)) then

		if(address = "000000") then
		data_out <="00000000";
		
		
		
		elsif(address = "000001") then
		data_out <= "00010001";
		
		
		
		elsif(address = "000010") then
		data_out <= "00100010";
		
		
		
		elsif(address = "000011") then
		data_out <= "00110011";
		
		
		
		elsif(address = "000100") then
		data_out <= "01000100";
		
		
		
		elsif(address = "000101") then
		data_out <= "01010101";
		
		
		
		elsif(address = "000110") then
		data_out <= "01100110";
		
		
		
		elsif(address = "000111") then
		data_out <= "01110111";
		
		
		
		elsif(address = "001000") then
		data_out <= "10001000";
		
		
		
		elsif(address = "001001") then
		data_out <= "10011001";
		
		
		
		elsif(address = "001010") then
		data_out <= "10101010";
		
		
		
		elsif(address = "001011") then
		data_out <= "10111011";
		
		
		
		elsif(address = "001100") then
		data_out <= "11001100";
		
		
		
		elsif(address = "001101") then
		data_out <= "11011101";
		
		
		
		elsif(address = "001110") then
		data_out <= "11101110";
		
		
		
		elsif(address = "001111") then
		data_out <= "11111111";
		
		

		
		
		
		
		
		elsif(address = "010000") then
		data_out <="00000000";
		
		
		
		elsif(address = "010001") then
		data_out <= "00010001";
		
		
		
		elsif(address = "010010") then
		data_out <= "00100010";
		
		
		
		elsif(address = "010011") then
		data_out <= "00110011";
		
		
		
		elsif(address = "010100") then
		data_out <= "01000100";
		
		
		
		elsif(address = "010101") then
		data_out <= "01010101";
		
		
		
		elsif(address = "010110") then
		data_out <= "01100110";
		
		
		
		elsif(address = "010111") then
		data_out <= "01110111";
		
		
		
		elsif(address = "011000") then
		data_out <= "10001000";
		
		
		
		elsif(address = "011001") then
		data_out <= "10011001";
		
		
		
		elsif(address = "011010") then
		data_out <= "10101010";
		
		
		
		elsif(address = "011011") then
		data_out <= "10111011";
		
		
		
		elsif(address = "011100") then
		data_out <= "11001100";
		
		
		
		elsif(address = "011101") then
		data_out <= "11011101";
		
		
		
		elsif(address = "011110") then
		data_out <= "11101110";
		
		
		
		elsif(address = "011111") then
		data_out <= "11111111";
		
		
		
		elsif(address = "100000") then
		data_out <="00000000";
		
		
		
		elsif(address = "100001") then
		data_out <="00000000";
		
		
		
		elsif(address = "100010") then
		data_out <="00000000";
		
		
		
		elsif(address = "100011") then
		data_out <="00000000";
		
		
		
		elsif(address = "100100") then
		data_out <="00000000";
		
		
		
		elsif(address = "100101") then
		data_out <="00000000";
		
		
		
		elsif(address = "100110") then
		data_out <="00000000";
		
		
		
		elsif(address = "100111") then
		data_out <="00000000";
		
		
		
		elsif(address = "101000") then
		data_out <="00000000";
		
		
		
		elsif(address = "101001") then
		data_out <="00000000";
		
		
		
		elsif(address = "101010") then
		data_out <="00000000";
		
		
		
		elsif(address = "101011") then
		data_out <="00000000";
		
		
		
		elsif(address = "101100") then
		data_out <="00000000";
		
		
		
		elsif(address = "101101") then
		data_out <="00000000";
		
		
		
		elsif(address = "101110") then
		data_out <="00000000";
		
		
		
		elsif(address = "101111") then
		data_out <="00000000";
		
		
		
		elsif(address = "110000") then
		data_out <="00000000";
		
		
		
		elsif(address = "110001") then
		data_out <="00000000";
		
		
		
		elsif(address = "110010") then
		data_out <="00000000";
		
		
		
		elsif(address = "110011") then
		data_out <="00000000";
		
		
		
		elsif(address = "110100") then
		data_out <="00000000";
		
		
		
		elsif(address = "110101") then
		data_out <="00000000";
		
		
		
		elsif(address = "110110") then
		data_out <="00000000";
		
		
		
		elsif(address = "110111") then
		data_out <="00000000";
		
		
		
		elsif(address = "111000") then
		data_out <="00000000";
		
		
		
		elsif(address = "111001") then
		data_out <="00000000";
		
		
		
		elsif(address = "111010") then
		data_out <="00000000";
		
		
		
		elsif(address = "111011") then
		data_out <="00000000";
		
		
		
		elsif(address = "111100") then
		data_out <="00000000";
		
		
		
		elsif(address = "111101") then
		data_out <="00000000";
		
		
		
		elsif(address = "111110") then
		data_out <="00000000";
		
		
		
		elsif(address = "111111") then
		data_out <="00000000";
		
		else
		
		data_out <="00000000";
		
		
		
		
		end if;
		
		else
		
		end if;
		
		
		
		
		
		end process;








end architecture;



