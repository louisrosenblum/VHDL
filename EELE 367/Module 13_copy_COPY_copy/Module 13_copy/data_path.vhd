library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_path is
		port   ( clock          : in   std_logic;
                  reset          : in   std_logic;
		IR_Load : in std_logic;
		IR : out std_logic_vector(7 downto 0);
		MAR_Load: in std_logic;
		address: out std_logic_vector(7 downto 0);
		PC_Load: in std_logic;
		PC_Inc: in std_logic;
		A_Load: in std_logic;
		B_Load: in std_logic;
		ALU_Sel : in std_logic_vector(2 downto 0);
		CCR_Result: out std_logic_vector(3 downto 0);
		CCR_Load : in std_logic;
		from_memory: in std_logic_vector(7 downto 0);
		BUS2_Sel : in std_logic_vector(1 downto 0);
		BUS1_Sel : in std_logic_vector(1 downto 0);
		to_memory: out std_logic_vector(7 downto 0));	
end entity;

architecture data_path_arch of data_path is 
signal BUS2 :  std_logic_vector(7 downto 0);
signal BUS1 : std_logic_vector(7 downto 0);
signal PC: std_logic_vector(7 downto 0);
signal A: std_logic_vector(7 downto 0);
signal B: std_logic_vector(7 downto 0);
signal CCR: std_logic_vector(3 downto 0);
signal ALU_Result1: std_logic_vector(7 downto 0);
signal MAR: std_logic_vector(7 downto 0);

component ALU is
	port (A : in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
	ALU_Sel : in std_logic_vector(2 downto 0);
	NZVC : out std_logic_vector(3 downto 0);
	ALU_Result : out std_logic_vector(7 downto 0));
end component;




begin

ALU_0 : ALU port map(A => A, B => B, ALU_Sel => ALU_Sel, NZVC => CCR, ALU_Result => ALU_Result1);

MULTI2: process(BUS2_Sel,ALU_Result1,Bus1,from_memory)

	begin

	if BUS2_Sel = "00" then
	BUS2 <= ALU_Result1;

	elsif BUS2_Sel = "01" then
	BUS2 <= BUS1;

	elsif BUS2_Sel = "10" then
	BUS2 <= from_memory;

	else 
	BUS2 <= x"00";

	end if;

end process;

MULTI1: process(Bus1_Sel,PC,A,B)

	begin

	if BUS1_Sel = "00" then
	BUS1 <= PC;

	elsif BUS1_Sel = "01" then
	BUS1 <= A;

	elsIf BUS1_Sel = "10" then
	BUS1 <= B;

	else
	BUS1 <= x"00";
	end if;
	end process;

address <= MAR;

to_memory <= BUS1;
	
IR0: process(clock,reset)
	begin
	if reset = '0' then
		IR <= x"00";
	elsif (clock'event and clock = '1') then
		if IR_Load = '1' then
			IR <= BUS2;
		end if;
	end if;
	
	end process;

MAR0: process(clock,reset)
	begin
	if reset = '0' then
		MAR <= x"00";
	elsif (clock'event and clock = '1') then
		if MAR_Load = '1' then
			MAR <= BUS2;
		end if;
	end if;
	
	end process;

PC0: process(clock,reset)
	begin
	if reset = '0' then
		PC <= x"00";
	elsif (clock'event and clock = '1') then
		if PC_Load = '1' then
			PC <= BUS2;
		elsif (PC_Inc = '1') then
			PC <= std_logic_vector(unsigned(PC) + 1);
		end if;
	end if;
	
	end process;

A_REGISTER : process(clock,reset)
	begin
	if reset = '0' then
		A <= x"00";
	elsif (clock'event and clock = '1') then
		if A_Load = '1' then
			A <= BUS2;
		end if;
	end if;
	
	end process;

B_REGISTER : process(clock,reset)
	begin
	if reset = '0' then
		B <= x"00";
	elsif (clock'event and clock = '1') then
		if B_Load = '1' then
			B <= BUS2;
		end if;
	end if;
	
	end process;

CCR0: process(clock,reset)
	begin
	if reset = '0' then
		CCR_Result <= x"0";
	elsif (clock'event and clock = '1') then
		if CCR_Load = '1' then
		CCR_Result <= CCR;
		end if;
	end if;
	end process;


end architecture;
