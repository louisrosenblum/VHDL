entity SystemI is 
port(A,B,C,D: in bit;
	F: out bit);

end entity;

architecture SystemI_arch of SystemI is

signal An, Bn, Cn, Dn: bit;
signal m1,m3,m9,m11: bit;

component inv1
	port(A: in bit;
	F: out bit);
end component;


component and4
port(A,B,C,D: in bit;
	F: out bit);
end component;

component or4
port(A,B,C,D: in bit;
	F: out bit);
end component;

begin

U1: inv1 port map (A => A, F => An);
U2: inv1 port map (A => B, F => Bn);
U3: inv1 port map (A => C, F => Cn);
U4: inv1 port map (A => D, F => Dn);
U5: and4 port map(A => An, B => Bn, C => Cn, D => D, F => m1);
U6: and4 port map(A => An, B => Bn, C => C, D => D, F => m3);
U7: and4 port map(A => A, B => Bn, C => Cn, D => D, F => m9);
U8: and4 port map(A => A, B => Bn, C => C, D => D, F => m11);
U9: or4 port map(A => m1, B => m3, C => m9, D => m11, F => F);

end architecture;

