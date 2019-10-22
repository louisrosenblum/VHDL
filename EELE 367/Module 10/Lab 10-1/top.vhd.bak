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
			GPIO_1 : out std_logic_vector (7 downto 0));
end entity;

architecture top_arch of top is

signal Clock_Div: std_logic;
signal cnt: std_logic_vector(23 downto 0);
signal cnt_int : integer;

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

component BCD
port (BIN_IN : in std_logic_vector (23 downto 0);
			sig0 : out std_logic_vector (3 downto 0);
			sig1 : out std_logic_vector (3 downto 0);
			sig2 : out std_logic_vector (3 downto 0);
			sig3 : out std_logic_vector (3 downto 0);
			sig4 : out std_logic_vector (3 downto 0);
			sig5 : out std_logic_vector (3 downto 0));
end component;

begin

Tick0 : clock_div_prec port map (Clock_In => Clock1, Reset => Reset1, Sel => SW, Clock_Out => Clock_Div);

	COUNTER : process(Clock_Div, Reset1)
	begin
	
	if (Reset1 = '0') then
	cnt <= "000000000000000000000000";
	cnt_int <= 0;
	
	elsif (rising_edge(Clock_Div)) then
		if (cnt ="111111111111111111111111") then
			cnt <= "000000000000000000000000";
			cnt_int <= 0;
			
		else
		cnt <= std_logic_vector(to_unsigned(cnt_int + 1,24));
		cnt_int <= cnt_int + 1;
		
		end if;
	
	end if;
	end process;
	
BDC_er : BCD port map(BIN_IN => cnt,sig0 => SIG0,sig1 => SIG1, sig2 => SIG2, sig3 => SIG3, sig4 => SIG4, sig5 => SIG5);

C0 : char_decoder port map (BIN_IN => SIG0, HEX_OUT => HEX5);
C1 : char_decoder port map (BIN_IN => SIG1, HEX_OUT => HEX4);
C2 : char_decoder port map (BIN_IN => SIG2, HEX_OUT => HEX3);
C3 : char_decoder port map (BIN_IN => SIG3, HEX_OUT => HEX2);
C4 : char_decoder port map (BIN_IN => SIG4, HEX_OUT => HEX1);
C5 : char_decoder port map (BIN_IN => SIG5, HEX_OUT => HEX0);	
		
LEDR(0) <= Clock_Div;
GPIO_1(0) <= Clock_Div;		
		
		
		
end architecture;