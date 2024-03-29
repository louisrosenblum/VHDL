library IEEE;
use IEEE.std_logic_1164.all;

entity fsm2_behavioral is
   port (Clock, Reset : in  std_logic;
         Din          : in  std_logic;
         Dout         : out std_logic);
end entity;

architecture fsm2_behavioral_arch of fsm2_behavioral is

	type State_Type is (S0,S1,S2,S3);
	signal current_state, next_state : State_Type;

	begin

	STATE_MEM : process(Clock,Reset)
		begin
			if (Reset = '0') then 
			current_state <= S0;
			elsif (rising_edge(Clock)) then
			current_state <= next_state;
				
			end if;
		end process;

	NEXT_LOGIC : process(current_state,Din)
		begin
		
		if (current_state = S0) and (Din='1') then
		next_state <= S1;
		elsif (current_state = S0) and (Din='0') then
		next_state <= S0;
		elsif (current_state = S1) and (Din='0') then
		next_state <= S2;
		elsif (current_state = S1) and (Din='1') then
		next_state <= S3;
		elsif (current_state = S2) and (Din='1') then
		next_state <= S3;
		elsif (current_state = S2) and (Din='0') then
		next_state <= S0;
		elsif (current_state = S3) and (Din='0') then
		next_state <= S3;
		elsif (current_state = S3) and (Din='1') then
		next_state <= S0;

		end if;
		end process;

	OUT_LOGIC : process(current_state,Din)
		begin
		if (current_state = S0) and (Din='1') then
		Dout <= '1';
		elsif (current_state = S0) and (Din='0') then
		Dout <= '0';
		elsif (current_state = S1) and (Din='1') then
		Dout <= '0';
		elsif (current_state = S1) and (Din='0') then
		Dout <= '1';
		elsif (current_state = S2) and (Din='1') then
		Dout <= '1';
		elsif (current_state = S2) and (Din='0') then
		Dout <= '0';
		elsif (current_state = S3) and (Din='1') then
		Dout <= '1';
		elsif (current_state = S3) and (Din='0') then
		Dout <= '0';
		
		end if;
		end process;



end architecture;