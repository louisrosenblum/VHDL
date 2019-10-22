entity SystemJ is 
port(A,B,C,D: in bit;
	F: out bit);

end entity;

architecture SystemJ_arch of SystemJ is

signal An, Bn, Cn, Dn: bit;
signal m4,m5,m7,m12,m13,m15: bit;

component inv1
	port(A: in bit;
	F: out bit);
end component;


component and4
port(A,B,C,D: in bit;
	F: out bit);
end component;

component or6
	port(A,B,C,D,E,G: in bit;
	F: out bit);
end component;

begin

U1: inv1 port map (A => A, F => An);
U2: inv1 port map (A => B, F => Bn);
U3: inv1 port map (A => C, F => Cn);
U4: inv1 port map (A => D, F => Dn);

U5: and4 port map(A => An, B => B, C => Cn, D => Dn, F => m4);
U6: and4 port map(A => An, B => B, C => Cn, D => D, F => m5);
U7: and4 port map(A => An, B => B, C => C, D => D, F => m7);
U8: and4 port map(A => A, B => B, C => Cn, D => Dn, F => m12);
U9: and4 port map(A => A, B => B, C => Cn, D => D, F => m13);
U10: and4 port map(A => A, B => B, C => C, D => D, F => m15);


U11: or6 port map(A => m4, B => m5, C => m7, D => m12, E => m13, G => m15,  F => F);

end architecture;


