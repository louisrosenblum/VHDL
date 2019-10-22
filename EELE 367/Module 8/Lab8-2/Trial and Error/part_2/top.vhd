
entity top is
 port (SW : in bit_vector (3 downto 0);
 LEDR : out bit_vector (3 downto 0);
HEX0 : out bit_vector (6 downto 0);
HEX1 : out bit_vector (6 downto 0);
HEX2 : out bit_vector (6 downto 0);
HEX3 : out bit_vector (6 downto 0));
end entity;


architecture top_arch of top is

component binary_display
 port (BIN_IN : in bit;
 HEX_OUT : out bit_vector (6 downto 0));
end component;

begin
 LEDR <= SW;
 
C0 : binary_display port map (BIN_IN => SW(0), HEX_OUT => HEX0);
C1 : binary_display port map (BIN_IN => SW(1), HEX_OUT => HEX1);
C2 : binary_display port map (BIN_IN => SW(2), HEX_OUT => HEX2);
C3 : binary_display port map (BIN_IN => SW(3), HEX_OUT => HEX3);


end architecture;