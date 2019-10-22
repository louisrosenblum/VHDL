library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_div_prec is
 port (Clock_in : in std_logic;
 Reset : in std_logic;
 Sel : in std_logic_vector (1 downto 0);
 Clock_out : out std_logic);
end entity;

architecture clock_div_prec_arch of clock_div_prec is
signal count : integer;
signal clock2 : std_logic;

begin

	COUNTER : process(Clock_in,Reset)
	begin
	if (Reset = '0') then
		count <= 0;
		Clock_out <= '0';
		clock2 <= '0';
	else if (rising_edge(Clock_in)) then
		if (Sel = "00") then
			if (count = 25000000) then
				count <= 0;
				Clock_out <= not(clock2);
				clock2 <= not(clock2);
			else
				count <= count + 1;
			end if;
			
		elsif (Sel = "01") then
			if (count = 2500000) then
				count <= 0;
				Clock_out <= not(clock2);
				clock2 <= not(clock2);
			else
				count <= count + 1;
			end if;
		
		elsif (Sel = "10") then
			if (count = 250000) then
				count <= 0;
				Clock_out <= not(clock2);
				clock2 <= not(clock2);
			else
				count <= count + 1;
			end if;
		
		elsif (Sel = "11") then
			if (count = 25000) then
				count <= 0;
				Clock_out <= not(clock2);
				clock2 <= not(clock2);
			else
				count <= count + 1;
			end if;
		end if;
		end if;
		end if;
		end process;
		
end architecture; 