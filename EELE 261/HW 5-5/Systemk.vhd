entity SystemI is 
port(A,B,C,D: in bit;
	F: out bit);

end entity; --entity	

architecture SystemI_arch of SystemI is

signal An, Bn, Cn, Dn: bit;


component inv1
	port(A: in bit;
	F: out bit);
end component;

component or2
port(A,B,C,D: in bit;
	F: out bit);
end component;

begin

U1: inv1 port map (A => A, F => An);
U2: inv1 port map (A => B, F => Bn);
U3: inv1 port map (A => C, F => Cn);
U4: inv1 port map (A => D, F => Dn);
U9: or2 port map(A => Cn, B => Dn, F => F);

end architecture;


