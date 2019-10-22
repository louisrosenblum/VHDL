entity decoder_1hot_4to16 is 
port(A: in bit_vector(3 downto 0);
	F: out bit_vector(15 downto 0));

end entity;

architecture decoder_1hot_4to16_arch of decoder_1hot_4to16 is



begin

F(0) <= '1' when (A = "0000") else
	'0';
F(1) <= '1' when (A = "0001") else
	'0';
F(2) <= '1' when (A = "0010") else
	'0';
F(3) <= '1' when (A = "0011") else
	'0';
F(4) <= '1' when (A = "0100") else
	'0';
F(5) <= '1' when (A = "0101") else
	'0';
F(6) <= '1' when (A = "0110") else
	'0';
F(7) <= '1' when (A = "0111") else
	'0';
F(8) <= '1' when (A = "1000") else
	'0';
F(9) <= '1' when (A = "1001") else
	'0';
F(10) <= '1' when (A = "1010") else
	'0';
F(11) <= '1' when (A = "1011") else
	'0';
F(12) <= '1' when (A = "1100") else
	'0';
F(13) <= '1' when (A = "1101") else
	'0';
F(14) <= '1' when (A = "1110") else
	'0';
F(15) <= '1' when (A = "1111") else
	'0';


end architecture;


