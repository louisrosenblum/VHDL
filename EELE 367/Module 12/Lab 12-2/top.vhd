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
	signal uns1 : unsigned(3 downto 0);
	signal uns2 : unsigned(3 downto 0);
	signal sum : std_logic_vector(3 downto 0);
	signal overflow : std_logic;
	
component twos_comp_decoder is
	port(two_in : in std_logic_vector(3 downto 0);
			mag_out : out std_logic_vector(6 downto 0);
			sign_out : out std_logic_vector(6 downto 0));
			end component;
			


begin

	ADDER: process(SW)
	
		begin
		
		uns1 <= unsigned(SW(3 downto 0));
		uns2 <= unsigned(SW(7 downto 4));
		sum <= std_logic_vector(unsigned(SW(3 downto 0)) + unsigned(SW(7 downto 4)));
	
		end process;
		
		
	FLOW: process(uns1,uns2,sum)
	
		begin
		
		if(uns1(3) = '0' and uns2(3) = '0' and sum(3) = '1') then
		
			overflow <= '1';
			
		elsif (uns1(3) = '1' and uns2(3) = '1' and sum(3) = '0') then
			
			overflow <= '1';
			
		else
		
			overflow <= '0';
			
			end if;
			
			end process;
			
		
T0 : twos_comp_decoder port map(two_in => SW(3 downto 0), sign_out => HEX1,mag_out => HEX0);
T1 : twos_comp_decoder port map(two_in => SW(7 downto 4), sign_out => HEX3,mag_out => HEX2);
T2 : twos_comp_decoder port map(two_in => sum(3 downto 0), sign_out => HEX5,mag_out => HEX4);
		




		
LEDR(7 downto 0) <= SW(7 downto 0);
LEDR(8) <= '0';
LEDR(9) <= overflow;
	
end architecture;