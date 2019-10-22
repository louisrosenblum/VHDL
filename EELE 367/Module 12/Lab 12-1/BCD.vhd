library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library MATH_REAL;
use MATH_REAL.ALL;

entity BCD is
 port (BIN_IN : in std_logic_vector (23 downto 0);
			sig0 : out std_logic_vector (3 downto 0);
			sig1 : out std_logic_vector (3 downto 0);
			sig2 : out std_logic_vector (3 downto 0);
			sig3 : out std_logic_vector (3 downto 0);
			sig4 : out std_logic_vector (3 downto 0);
			sig5 : out std_logic_vector (3 downto 0));
end entity;

architecture BCD_arch of BCD is

signal int : integer;

begin

	DISPLAY_0 : process(BIN_IN)
	
	variable x1 : integer;
	variable x2 : integer;
	variable x3 : integer;
	variable x4 : integer;
	variable x5 : integer;
	variable x6 : integer;
	
	begin
	
	
	
	if (to_integer(unsigned(BIN_IN)) < 10) then
	
	sig0 <= "0000";
	sig1 <= "0000";
	sig2 <= "0000";
	sig3 <= "0000";
	sig4 <= "0000";
	sig5 <= std_logic_vector(to_unsigned(to_integer(unsigned(BIN_IN)),4));
	
	elsif (to_integer(unsigned(BIN_IN)) < 100) then
		if (to_integer(unsigned(BIN_IN)) > 9) then
	
	sig0 <= "0000";
	sig1 <= "0000";
	sig2 <= "0000";
	sig3 <= "0000";
	sig4 <= std_logic_vector(to_unsigned((integer(to_integer(unsigned(BIN_IN)) / 10)),4));
	sig5 <= std_logic_vector(to_unsigned((to_integer(unsigned(BIN_IN)) mod 10),4));
	
	end if;
	
	elsif (to_integer(unsigned(BIN_IN)) < 1000 and (to_integer(unsigned(BIN_IN)) > 99)) then
	
	sig0 <= "0000";
	sig1 <= "0000";
	sig2 <= "0000";
	
	x1 := to_integer(unsigned(BIN_IN));
	
	sig3 <= std_logic_vector(to_unsigned((integer(x1/100)),4));
	
	sig4 <= std_logic_vector(to_unsigned(integer((x1 mod 100)/10),4));
	
	sig5 <= std_logic_vector(to_unsigned((x1 mod 100) mod 10,4));
	
	elsif (to_integer(unsigned(BIN_IN)) < 10000 and (to_integer(unsigned(BIN_IN)) > 999)) then
	sig0 <= "0000";
	sig1 <= "0000";
	
	x1 := to_integer(unsigned(BIN_IN));
	
	sig2 <= std_logic_vector(to_unsigned((integer(x1/1000)),4));
	
	sig3 <= std_logic_vector(to_unsigned(integer(((x1 mod 1000) / 100)),4));
	
	sig4 <= std_logic_vector(to_unsigned(integer(((x1 mod 1000) mod 100)/10),4));
	
	sig5 <= std_logic_vector(to_unsigned((((x1 mod 1000) mod 100) mod 10),4));
	
	elsif (to_integer(unsigned(BIN_IN)) < 100000 and (to_integer(unsigned(BIN_IN)) > 9999)) then
	
	sig0 <= "0000";

	x1 := to_integer(unsigned(BIN_IN));
	
	sig1 <= std_logic_vector(to_unsigned((integer(x1/10000)),4));
	
	sig2 <= std_logic_vector(to_unsigned((integer((x1 mod 10000)/1000)),4));
	
	sig3 <= std_logic_vector(to_unsigned((integer(((x1 mod 10000) mod 1000)/100)),4));
	
	sig4 <= std_logic_vector(to_unsigned((integer(((x1 mod 10000) mod 1000) mod 100)/10),4));
	
	sig5 <= std_logic_vector(to_unsigned(((((x1 mod 10000) mod 1000) mod 100) mod 10),4));
	
	elsif (to_integer(unsigned(BIN_IN)) < 1000000 and (to_integer(unsigned(BIN_IN)) > 99999)) then
	
	x1 := to_integer(unsigned(BIN_IN));
	
	sig0 <= std_logic_vector(to_unsigned(integer(x1/100000),4));
	
	sig1 <= std_logic_vector(to_unsigned(integer((x1 mod 100000)/10000),4));
	
	sig2 <= std_logic_vector(to_unsigned(integer(((x1 mod 100000)mod 10000)/1000),4));
	
	sig3 <= std_logic_vector(to_unsigned(integer((((x1 mod 100000)mod 10000) mod 1000)/100),4));
	
	sig4 <= std_logic_vector(to_unsigned(integer(((((x1 mod 100000)mod 10000) mod 1000) mod 100)/10),4));
	
	sig5 <= std_logic_vector(to_unsigned((((((x1 mod 100000) mod 10000) mod 1000) mod 100) mod 10),4));
	
	end if;
	
	end process;








end architecture;






