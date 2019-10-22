library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
	port (A : in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
	ALU_Sel : in std_logic_vector(2 downto 0);
	NZVC : out std_logic_vector(3 downto 0);
	ALU_Result : out std_logic_vector(7 downto 0));
end entity;

architecture alu_arch of alu is 

begin

ALU0 : process(A,B,ALU_Sel)

	variable sum_uns : unsigned(8 downto 0);

	begin

	if (ALU_Sel = "000") then --- Addition

		sum_uns := unsigned('0' & A) + unsigned('0'&B);
		ALU_Result <= std_logic_vector(sum_uns(7 downto 0));

		-- Negative Flag

		NZVC(3) <= sum_uns(7);

		-- Zero Flag

		if (sum_uns(7 downto 0) = x"00") then
		NZVC(2) <= '1';
		else
		NZVC(2) <= '0';
		end if;

		-- Overflow Flag

		if (A(7) = '0' and B(7) = '0' and sum_uns(7) = '1') or (A(7) = '1' and B(7) = '1' and sum_uns(7) = '0') then
		NZVC(1) <= '1';	
		else
		NZVC(1) <= '0';
		end if;

		-- Carry Flag

		NZVC(0) <= sum_uns(8);

		end if;

		end process;
	

		


end architecture;
