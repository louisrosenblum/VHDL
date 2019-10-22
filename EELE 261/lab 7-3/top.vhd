entity top is
	port (Clock: in bit;
			Reset: in bit;
			Up : in bit;
		LEDR : out bit_vector(3 downto 0);
		Prime : out bit;
		SevenSeg : out bit_vector (6 downto 0));
		
	end entity;
	
	architecture top_arch of top is
	
	component dflipflop
		port (Clock           : in   bit;
            Reset           : in   bit;
            D               : in   bit;
            Q, Qn           : out  bit);
		end component;
		
		
	signal Q_nxt, Q_cur, Qn_cur : bit_vector (3 downto 0);
	signal Count: bit_vector (3 downto 0);
	
	
	begin
	
	-----------------------------------------
	
	-- FSM
	
	-- State Memory
	
	DFF0 : Dflipflop port map (Clock, Reset, Q_nxt(0), Q_cur(0), Qn_cur(0));
	DFF1 : Dflipflop port map (Clock, Reset, Q_nxt(1), Q_cur(1), Qn_cur(1));
	DFF2 : Dflipflop port map (Clock, Reset, Q_nxt(2), Q_cur(2), Qn_cur(2));
	DFF3 : Dflipflop port map (Clock, Reset, Q_nxt(3), Q_cur(3), Qn_cur(3));
	
	---------------------------------------
	
	-- Next State Logic
	
	Q_nxt <= "0001" when (Q_cur = "0000" and Up = '1') else
				"0010" when (Q_cur = "0001" and Up = '1') else 
				"0011" when (Q_cur = "0010" and Up = '1') else 
				"0100" when (Q_cur = "0011" and Up = '1') else 
				"0101" when (Q_cur = "0100" and Up = '1') else 
				"0110" when (Q_cur = "0101" and Up = '1') else 
				"0111" when (Q_cur = "0110" and Up = '1') else 
				"1000" when (Q_cur = "0111" and Up = '1') else 
				"1001" when (Q_cur = "1000" and Up = '1') else 
				"1010" when (Q_cur = "1001" and Up = '1') else
				"1011" when (Q_cur = "1010" and Up = '1') else 
				"1100" when (Q_cur = "1011" and Up = '1') else 
				"1101" when (Q_cur = "1100" and Up = '1') else 
				"1110" when (Q_cur = "1101" and Up = '1') else 
				"1111" when (Q_cur = "1110" and Up = '1') else
				"0000" when (Q_cur = "1111" and Up = '1') else
				"1110" when (Q_cur = "1111" and Up = '0') else
				"1101" when (Q_cur = "1110" and Up = '0') else	
				"1100" when (Q_cur = "1101" and Up = '0') else	
				"1011" when (Q_cur = "1100" and Up = '0') else	
				"1010" when (Q_cur = "1011" and Up = '0') else	
				"1001" when (Q_cur = "1010" and Up = '0') else	
				"1000" when (Q_cur = "1001" and Up = '0') else	
				"0111" when (Q_cur = "1000" and Up = '0') else	
				"0110" when (Q_cur = "0111" and Up = '0') else	
				"0101" when (Q_cur = "0110" and Up = '0') else	
				"0100" when (Q_cur = "0101" and Up = '0') else	
				"0011" when (Q_cur = "0100" and Up = '0') else	
				"0010" when (Q_cur = "0011" and Up = '0') else	
				"0001" when (Q_cur = "0010" and Up = '0') else	
				"0000" when (Q_cur = "0001" and Up = '0') else	
				"1111" when (Q_cur = "0000" and Up = '0');	
	
	-- Output Logic
	
	Count <= Q_cur;
	
	------------------------------
	
	
	LEDR <= Count;
	
	with (Count) select
		Prime <= '0' when "0000",
		'0' when "0001",
		'1' when "0010",
		'1' when "0011",
		'0' when "0100",
		'1' when "0101",
		'0' when "0110",
		'1' when "0111",
		'0' when "1000",
		'0' when "1001",
		'0' when "1010",
		'1' when "1011",
		'0' when "1100",
		'1' when "1101",
		'0' when "1110",
		'0' when "1111";
		
	SevenSeg <= "1111110" when (Count = "0000") else
		"0110000" when (Count = "0001") else
		"1101101" when (Count = "0010") else
		"1111001" when (Count = "0011") else
		"0110011" when (Count = "0100") else
		"1011011" when (Count = "0101") else
		"1011111" when (Count = "0110") else
		"1110000" when (Count = "0111") else
		"1111111" when (Count = "1000") else
		"1111011" when  (Count = "1001") else
		"1110111" when (Count = "1010") else
		"0011111" when  (Count = "1011") else
		"0001101" when (Count = "1100") else
		"0111101" when (Count = "1101") else
		"1001111" when (Count = "1110") else
		"1000111" when (Count = "1111");
	
	
	
	end architecture;
