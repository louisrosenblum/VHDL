library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	port (Clock1 : in std_logic;
			Reset1 : in std_logic;
			SW : in std_logic_vector(1 downto 0);
			HEX0 : out std_logic_vector (6 downto 0);
			HEX1 : out std_logic_vector (6 downto 0);
			HEX2 : out std_logic_vector (6 downto 0);
			HEX3 : out std_logic_vector (6 downto 0);
			HEX4 : out std_logic_vector (6 downto 0);
			HEX5 : out std_logic_vector (6 downto 0);
			LEDR : out std_logic_vector (9 downto 0);
			GPIO_1 : out std_logic_vector (14 downto 0));
end entity;

architecture top_arch of top is

signal Clock_Div: std_logic;
signal cnt: std_logic_vector(23 downto 0);
signal cnt_int : integer;

signal data : std_logic_vector(7 downto 0);
signal bab : integer;
signal addy : std_logic_vector(5 downto 0);
signal ones: std_logic_vector (3 downto 0);

signal SIG0 : std_logic_vector(3 downto 0);
signal SIG1 : std_logic_vector(3 downto 0);
signal SIG2 : std_logic_vector(3 downto 0);
signal SIG3 : std_logic_vector(3 downto 0);
signal SIG4: std_logic_vector(3 downto 0);
signal SIG5 : std_logic_vector(3 downto 0);


component clock_div_prec
 port (Clock_in : in std_logic;
 Reset : in std_logic;
 Sel : in std_logic_vector (1 downto 0);
 Clock_out : out std_logic);
end component;

component char_decoder
 port (BIN_IN : in std_logic_vector (3 downto 0);
 HEX_OUT : out std_logic_vector (6 downto 0));
end component;

component rom_64x8_sync
		port(clock: in std_logic;
			address : in std_logic_vector(5 downto 0);
			data_out : out std_logic_vector(7 downto 0));
end component;

begin

ones <= "ZZZZ";

Tick0 : clock_div_prec port map (Clock_In => Clock1, Reset => Reset1, Sel => SW, Clock_Out => Clock_Div);

ROM : rom_64x8_sync port map (clock => Clock_Div,address => addy, data_out => data);
	
	INDEXING: process(Clock_Div)
	begin
	
	if (rising_edge(Clock_Div)) then
		if (addy = "111111") then
			bab <= 0;
			addy <= "000000";
			
			else
			bab <= bab + 1;
			addy <= std_logic_vector(to_unsigned(bab+1,6));
		
		end if;
	else
	
		
		end if;
		
		end process;
	
	

C0 : char_decoder port map (BIN_IN => std_logic_vector(to_unsigned(to_integer(unsigned(addy(5 downto 4))),4)), HEX_OUT => HEX5);
C1 : char_decoder port map (BIN_IN => addy(3 downto 0), HEX_OUT => HEX4);
C2 : char_decoder port map (BIN_IN => ones, HEX_OUT => HEX2);
C3 : char_decoder port map (BIN_IN => ones, HEX_OUT => HEX3);	

C4 : char_decoder port map (BIN_IN => data(7 downto 4), HEX_OUT => HEX1);
C5 : char_decoder port map (BIN_IN => data(3 downto 0), HEX_OUT => HEX0);	
		
LEDR(0) <= Clock_Div;
GPIO_1(14) <= Clock_Div;


GPIO_1(7 downto 0) <= data;
GPIO_1(13 downto 8) <= addy;		
		
		
		
end architecture;