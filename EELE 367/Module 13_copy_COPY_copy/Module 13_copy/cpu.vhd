library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpu is
	 port   ( clock          : in   std_logic;
                  reset          : in   std_logic;
		  address : out std_logic_vector(7 downto 0);
		write_out : out std_logic;
		to_memory : out std_logic_vector(7 downto 0);
		from_memory : in std_logic_vector(7 downto 0));
end entity;

architecture cpu_arch of cpu is 

component control_unit is
 	port   ( clock          : in   std_logic;
                  reset          : in   std_logic;
		IR_Load : out std_logic;
		IR : in std_logic_vector(7 downto 0);
		MAR_Load : out std_logic;	
		PC_Load : out std_logic;
		PC_Inc : out std_logic;
		A_Load : out std_logic;
		B_Load : out std_logic;
		ALU_Sel : out std_logic_vector(2 downto 0);
		CCR_Result : in std_logic_vector(3 downto 0);
		CCR_Load : out std_logic;
		Bus2_Sel : out std_logic_vector(1 downto 0);
		Bus1_Sel : out std_logic_vector(1 downto 0);
		write_out : out std_logic);
end component;

component data_path is
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
end component;

signal IR_Load_0: std_logic;
signal IR_0: std_logic_vector(7 downto 0);
signal MAR_Load_0 : std_logic;
signal PC_Load_0 : std_logic;
signal PC_Inc_0 : std_logic;
signal A_Load_0 : std_logic;
signal B_Load_0 : std_logic;
signal Load_0 : std_logic;
signal ALU_Sel_0: std_logic_vector(2 downto 0);
signal CCR_Result_0: std_logic_vector(3 downto 0);
signal CCR_Load_0: std_logic;
signal Bus2_Sel_0 : std_logic_vector(1 downto 0);
signal Bus1_Sel_0 : std_logic_vector(1 downto 0);

begin

control_unit_0 : control_unit port map(clock => clock, reset => reset, IR_Load => IR_Load_0, IR => IR_0, MAR_Load => MAR_Load_0, PC_Load => PC_Load_0, PC_Inc => PC_Inc_0, A_Load => A_Load_0, B_Load => B_Load_0, ALU_Sel => ALU_Sel_0, CCR_Result => CCR_Result_0, CCR_Load => CCR_Load_0,Bus2_Sel => Bus2_Sel_0, Bus1_Sel => Bus1_Sel_0, write_out => write_out); 
data_path_0 : data_path port map(clock => clock, reset => reset, IR_Load => IR_Load_0, IR => IR_0, MAR_Load => MAR_Load_0, address => address, PC_load => PC_Load_0, PC_Inc => PC_Inc_0, A_Load => A_Load_0, B_Load => B_Load_0, ALU_Sel => ALU_Sel_0, CCR_Result => CCR_Result_0, CCR_Load => CCR_Load_0, from_memory => from_memory,BUS1_Sel => Bus1_Sel_0, BUS2_Sel => Bus2_Sel_0, to_memory => to_memory);
end architecture;
