library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	port (SW : in std_logic_vector(7 downto 0);
			HEX0 : out std_logic_vector (6 downto 0);
			HEX1 : out std_logic_vector (6 downto 0);
			HEX2 : out std_logic_vector (6 downto 0);
			HEX3 : out std_logic_vector (6 downto 0);
			HEX4 : out std_logic_vector (6 downto 0);
			HEX5 : out std_logic_vector (6 downto 0);
			LEDR : out std_logic_vector (9 downto 0));
end entity;

architecture top_arch of top is
	signal a : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0);
	signal sum : std_logic_vector(3 downto 0);
	signal carry: std_logic_vector(3 downto 0);
	


component char_decoder
 port (BIN_IN : in std_logic_vector (3 downto 0);
 		off : in std_logic;
 HEX_OUT : out std_logic_vector (6 downto 0));
end component;


begin

	ADDER: process(SW)
	
		begin
		
		if ((to_integer(unsigned(SW(3 downto 0))) + to_integer(unsigned(SW(7 downto 4)))) > 15) then 
			carry <= "0001";
			
			sum <= std_logic_vector(unsigned(SW(3 downto 0)) +  unsigned(SW(7 downto 4)));
			
		else
		
			carry <= "0000";
			
			sum <= std_logic_vector(unsigned(SW(3 downto 0)) +  unsigned(SW(7 downto 4)));
		
			end if;
			
		end process;
		

		
C0 : char_decoder port map (BIN_IN => SW(3 downto 0), off => '0', HEX_OUT => HEX0)
;		
C1 : char_decoder port map (BIN_IN => "0000",off => '1',HEX_OUT => HEX1);

C2 : char_decoder port map (BIN_IN => SW(7 downto 4),off => '0', HEX_OUT => HEX2);

C3 : char_decoder port map (BIN_IN => "0000",off => '1', HEX_OUT => HEX3);

C4 : char_decoder port map (BIN_IN => sum,off => '0', HEX_OUT => HEX4);

C5 : char_decoder port map (BIN_IN => carry,off => '0', HEX_OUT => HEX5);



		
LEDR(7 downto 0) <= SW(7 downto 0);
LEDR(8) <= '0';
LEDR(9) <= carry(0);
	
end architecture;