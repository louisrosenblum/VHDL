entity counter_3bit_binary_up_down is
	port(Clock: in bit;
	Reset : in bit;
	Up : in bit;
	Count : out bit_vector (2 downto 0));
end entity;


architecture counter_3bit_binary_up_down_arch of counter_3bit_binary_up_down is

signal q2next, q1next, q0next : bit;
signal q2now, q1now, q0now: bit;
signal q2pnow, q1pnow, q0pnow: bit;
signal current_state : bit_vector (2 downto 0);
signal dude: bit_vector (3 downto 0);

component Dflipflop
	port (Clock : in bit;
	Reset : in bit;
	D : in bit;
	Q, Qn : out bit);
end component;

begin

-- State Memory
	U0: Dflipflop port map (Clock, Reset, q0next, q0now, q0pnow);
	U1: Dflipflop port map (Clock, Reset, q1next, q1now, q1pnow);
	U2: Dflipflop port map (Clock, Reset, q2next, q2now, q2pnow);

-- Next State Logic

	current_state <= q2now & q1now & q0now;
	dude <= q2now & q1now & q0now & Up;


	with dude select
		q2next <= '1' when "0111" | "1001" | "1011" | "1101" | "0000" | "1110" | "1100" | "1010",
				'0' when others;
				
	with dude select
		q1next <= '1' when "0011" | "0101" | "1011" | "1101" | "0000" | "1110" | "0110" | "1000",
		'0' when others;

	with dude select
	q0next <= '1' when "0001" | "0101" | "1001" | "1101" | "0000" | "1100" | "1000" | "0100",
	'0' when others;



-- Output Logic	
	Count <= q2next & q1next& q0next;



end architecture;
