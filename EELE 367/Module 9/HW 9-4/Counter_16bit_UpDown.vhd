library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Counter_16bit_UpDown is
     port (Clock, Reset : in  std_logic;
           Up           : in  std_logic;
           Count_Out    : out std_logic_vector(15 downto 0));
end entity;



architecture Counter_16bit_UpDown_arch of Counter_16bit_UpDown is
	
	signal count : integer range 0 to 65535;

	begin

	COUNTER : process(Reset,Up,Clock)
	begin

	if Reset = '0' then
	Count_Out <= "0000000000000000";
	count <= 0;

	elsif(Up ='1' and count = 65535) then
	Count_Out <= "0000000000000000";
	count <= 0;

	elsif(Up ='0' and count = 0) then
	Count_Out <= "1111111111111111";
	count <= 65535;

	elsif(rising_edge(Clock) and Up = '1') then
	Count_Out <= std_logic_vector(to_unsigned(count+1,16));
	count <= count + 1;

	elsif(rising_edge(Clock) and Up = '0') then
	Count_Out <= std_logic_vector(to_unsigned(count-1,16));
	count <= count - 1;

	end if;
	end process;

end architecture;