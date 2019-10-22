library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
 port (SW : in std_logic_vector (3 downto 0);
 LEDR : out std_logic_vector (3 downto 0);
HEX0 : out std_logic_vector (6 downto 0);
HEX1 : out std_logic_vector (6 downto 0);
HEX2 : out std_logic_vector (6 downto 0);
HEX3 : out std_logic_vector (6 downto 0));
end entity;

architecture top_arch of top is


component binary
 port (BIN_IN : in std_logic;
 HEX_OUT : out std_logic_vector (6 downto 0));
end component;



 begin
 LEDR <= SW;
 
	
C0 : binary port map (BIN_IN => SW(0), HEX_OUT => HEX0);
C1 : binary port map (BIN_IN => SW(1), HEX_OUT => HEX1);
C2 : binary port map (BIN_IN => SW(2), HEX_OUT => HEX2);
C3 : binary port map (BIN_IN => SW(3), HEX_OUT => HEX3);

	

end architecture;