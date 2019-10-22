library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity computer is
    port   ( clock1          : in   std_logic;
				SW : in std_logic_vector(9 downto 0);
				LEDR : out std_logic_vector(7 downto 0);
				KEY : std_logic_vector(3 downto 0);
				HEX0 : out std_logic_vector (6 downto 0);
				HEX1 : out std_logic_vector (6 downto 0);
				HEX2 : out std_logic_vector (6 downto 0);
				HEX3 : out std_logic_vector (6 downto 0);
				HEX4 : out std_logic_vector (6 downto 0);
				HEX5 : out std_logic_vector (6 downto 0);
							GPIO_1 : out std_logic_vector (14 downto 0);
             port_in_02     : in   std_logic_vector (7 downto 0);
             port_in_03     : in   std_logic_vector (7 downto 0);
             port_in_04     : in   std_logic_vector (7 downto 0);
             port_in_05     : in   std_logic_vector (7 downto 0);
             port_in_06     : in   std_logic_vector (7 downto 0);               
             port_in_07     : in   std_logic_vector (7 downto 0);
             port_in_08     : in   std_logic_vector (7 downto 0);
             port_in_09     : in   std_logic_vector (7 downto 0);
             port_in_10     : in   std_logic_vector (7 downto 0);
             port_in_11     : in   std_logic_vector (7 downto 0);
             port_in_12     : in   std_logic_vector (7 downto 0);
             port_in_13     : in   std_logic_vector (7 downto 0);
             port_in_14     : in   std_logic_vector (7 downto 0);
             port_in_15     : in   std_logic_vector (7 downto 0);                                                                   
             port_out_06    : out  std_logic_vector (7 downto 0);
             port_out_07    : out  std_logic_vector (7 downto 0);
             port_out_08    : out  std_logic_vector (7 downto 0);
             port_out_09    : out  std_logic_vector (7 downto 0);
             port_out_10    : out  std_logic_vector (7 downto 0);
             port_out_11    : out  std_logic_vector (7 downto 0);
             port_out_12    : out  std_logic_vector (7 downto 0);
             port_out_13    : out  std_logic_vector (7 downto 0);
             port_out_14    : out  std_logic_vector (7 downto 0);
             port_out_15    : out  std_logic_vector (7 downto 0));
end entity;

architecture computer_arch of computer is 

signal port_in_00 : std_logic_vector(7 downto 0);
signal port_in_01 : std_logic_vector(7 downto 0);
signal port_out_00 : std_logic_vector(7 downto 0);
signal port_out_01 : std_logic_vector(7 downto 0);
signal port_out_02 : std_logic_vector(7 downto 0);
signal port_out_03 : std_logic_vector(7 downto 0);
signal port_out_04 : std_logic_vector(7 downto 0);
signal port_out_05 : std_logic_vector(7 downto 0);
signal clock : std_logic;
signal reset : std_logic;
signal Clock_Div : std_logic;

component cpu is
	 port   ( clock          : in   std_logic;
                  reset          : in   std_logic;
		  address : out std_logic_vector(7 downto 0);
		write_out : out std_logic;
		to_memory : out std_logic_vector(7 downto 0);
		from_memory : in std_logic_vector(7 downto 0));
end component;

component char_decoder
 port (BIN_IN : in std_logic_vector (3 downto 0);
 HEX_OUT : out std_logic_vector (6 downto 0));
end component;

component clock_div_prec
 port (Clock_in : in std_logic;
 Reset : in std_logic;
 Sel : in std_logic_vector (1 downto 0);
 Clock_out : out std_logic);
end component;



component memory is
	 port   ( clock : in   std_logic;
		reset : in   std_logic;
		address : in std_logic_vector(7 downto 0);
		write_in : in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0);
             port_in_00     : in   std_logic_vector (7 downto 0);
             port_in_01     : in   std_logic_vector (7 downto 0);
             port_in_02     : in   std_logic_vector (7 downto 0);
             port_in_03     : in   std_logic_vector (7 downto 0);
             port_in_04     : in   std_logic_vector (7 downto 0);
             port_in_05     : in   std_logic_vector (7 downto 0);
             port_in_06     : in   std_logic_vector (7 downto 0);               
             port_in_07     : in   std_logic_vector (7 downto 0);
             port_in_08     : in   std_logic_vector (7 downto 0);
             port_in_09     : in   std_logic_vector (7 downto 0);
             port_in_10     : in   std_logic_vector (7 downto 0);
             port_in_11     : in   std_logic_vector (7 downto 0);
             port_in_12     : in   std_logic_vector (7 downto 0);
             port_in_13     : in   std_logic_vector (7 downto 0);
             port_in_14     : in   std_logic_vector (7 downto 0);
             port_in_15     : in   std_logic_vector (7 downto 0);                                                                   
             port_out_00    : out  std_logic_vector (7 downto 0);
             port_out_01    : out  std_logic_vector (7 downto 0);
             port_out_02    : out  std_logic_vector (7 downto 0);
             port_out_03    : out  std_logic_vector (7 downto 0);
             port_out_04    : out  std_logic_vector (7 downto 0);
             port_out_05    : out  std_logic_vector (7 downto 0);
             port_out_06    : out  std_logic_vector (7 downto 0);
             port_out_07    : out  std_logic_vector (7 downto 0);
             port_out_08    : out  std_logic_vector (7 downto 0);
             port_out_09    : out  std_logic_vector (7 downto 0);
             port_out_10    : out  std_logic_vector (7 downto 0);
             port_out_11    : out  std_logic_vector (7 downto 0);
             port_out_12    : out  std_logic_vector (7 downto 0);
             port_out_13    : out  std_logic_vector (7 downto 0);
             port_out_14    : out  std_logic_vector (7 downto 0);
             port_out_15    : out  std_logic_vector (7 downto 0));
end component;

signal address_0 : std_logic_vector(7 downto 0);
signal write_0 : std_logic;
signal to_memory_0 : std_logic_vector(7 downto 0);
signal from_memory_0 : std_logic_vector(7 downto 0);

begin

port_in_00 <= SW(7 downto 0);
port_in_01 <= "0000" and KEY(3 downto 0);
reset <= KEY(4);
clock <= Clock_Div;
LEDR(7 downto 0) <= port_out_00;

C0 : char_decoder port map (BIN_IN => port_out_01(3 downto 0), HEX_OUT => HEX5);
C1 : char_decoder port map (BIN_IN => port_out_01(7 downto 4), HEX_OUT => HEX4);
C2 : char_decoder port map (BIN_IN => port_out_02(3 downto 0), HEX_OUT => HEX3);
C3 : char_decoder port map (BIN_IN => port_out_02(7 downto 4), HEX_OUT => HEX2);
C4 : char_decoder port map (BIN_IN => port_out_03(3 downto 0), HEX_OUT => HEX1);
C5 : char_decoder port map (BIN_IN => port_out_03(7 downto 4), HEX_OUT => HEX0);

GPIO_1(7 downto 0) <= port_out_04;
GPIO_1(15 downto 8) <= port_out_05;


Tick0 : clock_div_prec port map (Clock_In => Clock1, Reset => KEY(4), Sel => SW(9 downto 8), Clock_Out => Clock_Div);

CPU_0 : cpu port map(clock => clock, reset => reset, address => address_0, write_out => write_0, to_memory => to_memory_0, from_memory => from_memory_0);
memory_0: memory port map(clock => clock, reset => reset, address => address_0, write_in => write_0, data_in => to_memory_0, data_out => from_memory_0, port_in_00 => port_in_00, port_in_01 => port_in_01, port_in_02 => port_in_02, port_in_03 => port_in_03, port_in_04 => port_in_04, port_in_05 => port_in_05, port_in_06 => port_in_06, port_in_07 => port_in_07, port_in_08 => port_in_08, port_in_09 => port_in_09, port_in_10 => port_in_10, port_in_11 => port_in_11, port_in_12 => port_in_12, port_in_13 => port_in_13, port_in_14 => port_in_14, port_in_15 => port_in_15, port_out_00 => port_out_00, port_out_01 => port_out_01, port_out_02 => port_out_02, port_out_03 => port_out_03, port_out_04 => port_out_04, port_out_05 => port_out_05, port_out_06 => port_out_06, port_out_07 => port_out_07, port_out_08 => port_out_08, port_out_09 => port_out_09, port_out_10 => port_out_10, port_out_11 => port_out_11, port_out_12 => port_out_12, port_out_13 => port_out_13, port_out_14 => port_out_14, port_out_15 => port_out_15);
end architecture;
