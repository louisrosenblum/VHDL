library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_div_2ton is
	port (Clock_In : in std_logic;
		Reset2 : in std_logic;
		Sel : in std_logic_vector(1 downto 0);
		Clock_Out : out std_logic);
	end entity;
	
architecture clock_div_2ton_arch of clock_div_2ton is

signal cnt: std_logic_vector(37 downto 0);
signal cntn: std_logic_vector(37 downto 0);

component dflipflop
    port   (Clock           : in   std_logic;
            Reset           : in   std_logic;
            D               : in   std_logic;
            Q, Qn           : out  std_logic);
end component;

begin

D0: dflipflop port map (Reset => Reset2,D =>cntn(0),Clock => Clock_In, Q => cnt(0),  Qn => cntn(0));
D1: dflipflop port map (Reset => Reset2,D =>cntn(1),Clock => cntn(0), Q => cnt(1),  Qn => cntn(1));	
D2: dflipflop port map (Reset => Reset2,D =>cntn(2),Clock => cntn(1), Q => cnt(2),  Qn => cntn(2));
D3: dflipflop port map (Reset => Reset2,D =>cntn(3),Clock => cntn(2), Q => cnt(3),  Qn => cntn(3));
D4: dflipflop port map (Reset => Reset2,D =>cntn(4),Clock => cntn(3), Q => cnt(4),  Qn => cntn(4));
D5: dflipflop port map (Reset => Reset2,D =>cntn(5),Clock => cntn(4), Q => cnt(5),  Qn => cntn(5));
D6: dflipflop port map (Reset => Reset2,D =>cntn(6),Clock => cntn(5), Q => cnt(6),  Qn => cntn(6));
D7: dflipflop port map (Reset => Reset2,D =>cntn(7),Clock => cntn(6), Q => cnt(7),  Qn => cntn(7));
D8: dflipflop port map (Reset => Reset2,D =>cntn(8),Clock => cntn(7), Q => cnt(8),  Qn => cntn(8));
D9: dflipflop port map (Reset => Reset2,D =>cntn(9),Clock => cntn(8), Q => cnt(9),  Qn => cntn(9));
D10: dflipflop port map (Reset => Reset2,D =>cntn(10),Clock => cntn(9), Q => cnt(10),  Qn => cntn(10));
D11: dflipflop port map (Reset => Reset2,D =>cntn(11),Clock => cntn(10), Q => cnt(11),  Qn => cntn(11));
D12: dflipflop port map (Reset => Reset2,D =>cntn(12),Clock => cntn(11), Q => cnt(12),  Qn => cntn(12));
D13: dflipflop port map (Reset => Reset2,D =>cntn(13),Clock => cntn(12), Q => cnt(13),  Qn => cntn(13));
D14: dflipflop port map (Reset => Reset2,D =>cntn(14),Clock => cntn(13), Q => cnt(14),  Qn => cntn(14));
D15: dflipflop port map (Reset => Reset2,D =>cntn(15),Clock => cntn(14), Q => cnt(15),  Qn => cntn(15));
D16: dflipflop port map (Reset => Reset2,D =>cntn(16),Clock => cntn(15), Q => cnt(16),  Qn => cntn(16));
D17: dflipflop port map (Reset => Reset2,D =>cntn(17),Clock => cntn(16), Q => cnt(17),  Qn => cntn(17));
D18: dflipflop port map (Reset => Reset2,D =>cntn(18),Clock => cntn(17), Q => cnt(18),  Qn => cntn(18));
D19: dflipflop port map (Reset => Reset2,D =>cntn(19),Clock => cntn(18), Q => cnt(19),  Qn => cntn(19));
D20: dflipflop port map (Reset => Reset2,D =>cntn(20),Clock => cntn(19), Q => cnt(20),  Qn => cntn(20));
D21: dflipflop port map (Reset => Reset2,D =>cntn(21),Clock => cntn(20), Q => cnt(21),  Qn => cntn(21));
D22: dflipflop port map (Reset => Reset2,D =>cntn(22),Clock => cntn(21), Q => cnt(22),  Qn => cntn(22));
D23: dflipflop port map (Reset => Reset2,D =>cntn(23),Clock => cntn(22), Q => cnt(23),  Qn => cntn(23));
D24: dflipflop port map (Reset => Reset2,D =>cntn(24),Clock => cntn(23), Q => cnt(24),  Qn => cntn(24));
D25: dflipflop port map (Reset => Reset2,D =>cntn(25),Clock => cntn(24), Q => cnt(25),  Qn => cntn(25));
D26: dflipflop port map (Reset => Reset2,D =>cntn(26),Clock => cntn(25), Q => cnt(26),  Qn => cntn(26));
D27: dflipflop port map (Reset => Reset2,D =>cntn(27),Clock => cntn(26), Q => cnt(27),  Qn => cntn(27));
D28: dflipflop port map (Reset => Reset2,D =>cntn(28),Clock => cntn(27), Q => cnt(28),  Qn => cntn(28));
D29: dflipflop port map (Reset => Reset2,D =>cntn(29),Clock => cntn(28), Q => cnt(29),  Qn => cntn(29));
D30: dflipflop port map (Reset => Reset2,D =>cntn(30),Clock => cntn(29), Q => cnt(30),  Qn => cntn(30));
D31: dflipflop port map (Reset => Reset2,D =>cntn(31),Clock => cntn(30), Q => cnt(31),  Qn => cntn(31));
D32: dflipflop port map (Reset => Reset2,D =>cntn(32),Clock => cntn(31), Q => cnt(32),  Qn => cntn(32));
D33: dflipflop port map (Reset => Reset2,D =>cntn(33),Clock => cntn(32), Q => cnt(33),  Qn => cntn(33));
D34: dflipflop port map (Reset => Reset2,D =>cntn(34),Clock => cntn(33), Q => cnt(34),  Qn => cntn(34));
D35: dflipflop port map (Reset => Reset2,D =>cntn(35),Clock => cntn(34), Q => cnt(35),  Qn => cntn(35));
D36: dflipflop port map (Reset => Reset2,D =>cntn(36),Clock => cntn(35), Q => cnt(36),  Qn => cntn(36));
D37: dflipflop port map (Reset => Reset2,D =>cntn(37),Clock => cntn(36), Q => cnt(37),  Qn => cntn(37));



	MULTIPLEXER: process(Clock_In,Sel)
	
		begin
		
		if(Sel = "00") then
		Clock_Out <= cntn(0);
		
		elsif (Sel = "01") then
		Clock_Out <= cntn(17);
		
		elsif (Sel = "10") then
		Clock_Out <= cntn(22);
		
		elsif (Sel = "11") then
		Clock_Out <= cntn(24);
		
		end if;
		end process;




end architecture;
