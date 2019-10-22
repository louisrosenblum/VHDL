library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
	port (Clock1 : in std_logic;
			Reset1 : in std_logic;
			SW : in std_logic;
			LEDR : out std_logic_vector (9 downto 0);
			HEX0 : out std_logic_vector (6 downto 0);
			HEX1 : out std_logic_vector (6 downto 0);
			HEX2 : out std_logic_vector (6 downto 0);
			HEX3 : out std_logic_vector (6 downto 0);
			HEX4 : out std_logic_vector (6 downto 0);
			HEX5 : out std_logic_vector (6 downto 0);
			GPIO_1 : out std_logic_vector (9 downto 0));
end entity;

architecture top_arch of top is

signal cnt: std_logic_vector(21 downto 0);
signal cntn: std_logic_vector(21 downto 0);
signal Clock_div: std_logic;

type State_Type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
signal current_state, next_state : State_Type;



component char_decoder
 port (BIN_IN : in std_logic_vector (3 downto 0);
 HEX_OUT : out std_logic_vector (6 downto 0));
end component;

component dflipflop
    port   (Clock           : in   std_logic;
            Reset           : in   std_logic;
            D               : in   std_logic;
            Q, Qn           : out  std_logic);
end component;




begin

D0: dflipflop port map (Reset => Reset1,D =>cntn(0),Clock => Clock1, Q => cnt(0),  Qn => cntn(0));
D1: dflipflop port map (Reset => Reset1,D =>cntn(1),Clock => cntn(0), Q => cnt(1),  Qn => cntn(1));	
D2: dflipflop port map (Reset => Reset1,D =>cntn(2),Clock => cntn(1), Q => cnt(2),  Qn => cntn(2));
D3: dflipflop port map (Reset => Reset1,D =>cntn(3),Clock => cntn(2), Q => cnt(3),  Qn => cntn(3));
D4: dflipflop port map (Reset => Reset1,D =>cntn(4),Clock => cntn(3), Q => cnt(4),  Qn => cntn(4));
D5: dflipflop port map (Reset => Reset1,D =>cntn(5),Clock => cntn(4), Q => cnt(5),  Qn => cntn(5));
D6: dflipflop port map (Reset => Reset1,D =>cntn(6),Clock => cntn(5), Q => cnt(6),  Qn => cntn(6));
D7: dflipflop port map (Reset => Reset1,D =>cntn(7),Clock => cntn(6), Q => cnt(7),  Qn => cntn(7));
D8: dflipflop port map (Reset => Reset1,D =>cntn(8),Clock => cntn(7), Q => cnt(8),  Qn => cntn(8));
D9: dflipflop port map (Reset => Reset1,D =>cntn(9),Clock => cntn(8), Q => cnt(9),  Qn => cntn(9));
D10: dflipflop port map (Reset => Reset1,D =>cntn(10),Clock => cntn(9), Q => cnt(10),  Qn => cntn(10));
D11: dflipflop port map (Reset => Reset1,D =>cntn(11),Clock => cntn(10), Q => cnt(11),  Qn => cntn(11));
D12: dflipflop port map (Reset => Reset1,D =>cntn(12),Clock => cntn(11), Q => cnt(12),  Qn => cntn(12));
D13: dflipflop port map (Reset => Reset1,D =>cntn(13),Clock => cntn(12), Q => cnt(13),  Qn => cntn(13));
D14: dflipflop port map (Reset => Reset1,D =>cntn(14),Clock => cntn(13), Q => cnt(14),  Qn => cntn(14));
D15: dflipflop port map (Reset => Reset1,D =>cntn(15),Clock => cntn(14), Q => cnt(15),  Qn => cntn(15));
D16: dflipflop port map (Reset => Reset1,D =>cntn(16),Clock => cntn(15), Q => cnt(16),  Qn => cntn(16));
D17: dflipflop port map (Reset => Reset1,D =>cntn(17),Clock => cntn(16), Q => cnt(17),  Qn => cntn(17));
D18: dflipflop port map (Reset => Reset1,D =>cntn(18),Clock => cntn(17), Q => cnt(18),  Qn => cntn(18));
D19: dflipflop port map (Reset => Reset1,D =>cntn(19),Clock => cntn(18), Q => cnt(19),  Qn => cntn(19));
D20: dflipflop port map (Reset => Reset1,D =>cntn(20),Clock => cntn(19), Q => cnt(20),  Qn => cntn(20));
D21: dflipflop port map (Reset => Reset1,D =>cntn(21),Clock => cntn(20), Q => cnt(21),  Qn => cntn(21));


	STATE_MEM : process(cnt(21), Reset1)
		begin
		if (Reset1 = '0') then 
			current_state <= S0;
			elsif (rising_edge(cnt(21))) then
			current_state <= next_state;
				
			end if;
		
		end process;
		
		
		NEXT_LOGIC : process(current_state,SW)
		begin
		if (current_state = S0) and (SW = '1') then
		next_state <= S1;
		elsif (current_state = S1) and (SW = '1') then
		next_state <= S2;
		elsif (current_state = S2) and (SW = '1') then
		next_state <= S3;
		elsif (current_state = S3) and (SW = '1') then
		next_state <= S4;
		elsif (current_state = S4) and (SW = '1') then
		next_state <= S5;
		elsif (current_state = S5) and (SW = '1') then
		next_state <= S6;
		elsif (current_state = S6) and (SW = '1') then
		next_state <= S7;
		elsif (current_state = S7) and (SW = '1') then
		next_state <= S8;
		elsif (current_state = S8) and (SW = '1') then
		next_state <= S9;
		elsif (current_state = S9) and (SW = '1') then
		next_state <= S0;
		
		elsif (current_state = S1) and (SW = '0') then
		next_state <= S0;
		elsif (current_state = S2) and (SW = '0') then
		next_state <= S1;
		elsif (current_state = S3) and (SW = '0') then
		next_state <= S2;
		elsif (current_state = S4) and (SW = '0') then
		next_state <= S3;
		elsif (current_state = S5) and (SW = '0') then
		next_state <= S4;
		elsif (current_state = S6) and (SW = '0') then
		next_state <= S5;
		elsif (current_state = S7) and (SW = '0') then
		next_state <= S6;
		elsif (current_state = S8) and (SW = '0') then
		next_state <= S7;
		elsif (current_state = S9) and (SW = '0') then
		next_state <= S8;
		elsif (current_state = S0) and (SW = '0') then
		next_state <= S9;
		
		end if;
		
		end process;
		
		
		OUT_LOGIC: process(current_state)
		begin
		
		if (current_state = S0) then	
		LEDR <= "0000000001";
		GPIO_1 <="0000000001";
		
		elsif (current_state = S1) then	
		LEDR <= "0000000010"; 
		GPIO_1 <="0000000010";
		
		elsif (current_state = S2) then	
		LEDR <= "0000000100";
		GPIO_1 <="0000000100";
		
		elsif (current_state = S3) then	
		LEDR <= "0000001000"; 
		GPIO_1 <="0000001000";
		
		elsif (current_state = S4) then	
		LEDR <= "0000010000";
		GPIO_1 <="0000010000";
		
		elsif (current_state = S5) then	
		LEDR <= "0000100000";
		GPIO_1 <="0000100000";
		
		elsif (current_state = S6) then	
		LEDR <= "0001000000";
		GPIO_1 <="0001000000";
		
		elsif (current_state = S7) then	
		LEDR <= "0010000000"; 
		GPIO_1 <="0010000000";
		
		elsif (current_state = S8) then	
		LEDR <= "0100000000";
		GPIO_1 <="0100000000";
		
		elsif (current_state = S9) then	
		LEDR <= "1000000000";
		GPIO_1 <="1000000000";
		
		end if;
		
		end process;
		
end architecture;