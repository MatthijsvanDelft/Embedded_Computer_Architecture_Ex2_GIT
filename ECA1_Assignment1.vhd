LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity ECA1_Assignment1 is
	Port(
		clk : in std_logic;
		outputDataReady : out std_logic
	);
end ECA1_Assignment1;

architecture Behavioral of ECA1_Assignment1 is

	constant MAX_ELEM : integer := 169;
	constant MAX_ROWS : integer := 13;
	constant MAX_COLS : integer := 13;
	
	type twoDtype is array (0 to MAX_ROWS - 1, 0 to MAX_COLS - 1) of integer;
	signal matrix1, matrix2 : twoDtype;		
	shared variable result : twoDtype;
	
	type RAM is array (0 to 12) of integer range 0 to 15;
	signal procCycles : RAM;
	
begin
	
	matrix1 <=				
	((28,  122,  80,   42,   54,   122,  98,   42,   99,   58,   124,  29,   21),
    (113, 85,   30,   35,   41,   98,   103,  68,   15,   50,   31,   80,   54),
    (47,  37,   23,   96,   59,   47,   84,   26,   84,   72,   51,   118,  119),
    (38,  121,  45,   21,   87,   91,   20,   69,   98,   119,  15,   89,   47),
    (40,  71,   105,  76,   31,   65,   109,  30,   127,  110,  17,   64,   64),
    (45,  20,   113,  86,   86,   51,   104,  115,  61,   103,  60,   113,  44),
    (101, 107,  33,   63,   39,   47,   120,  20,   41,   64,   102,  59,   86),
    (9,   42,   118,  26,   83,   123,  10,   82,   47,   108,  127,  4,    66),
    (75,  26,   117,  80,   47,   111,  38,   22,   98,   101,  92,   100,  48),
    (90,  9,    71,   36,   90,   95,   4,    94,   72,   29,   77,   118,  78),
    (81,  75,   97,   127,  22,   8,    96,   80,   100,  88,   69,   114,  16),
    (25,  109,  74,   3,    126,  56,   99,   15,   69,   73,   76,   19,   97),
    (59,  84,   102,  53,   30,   34,   33,   105,  75,   102,  60,   121,  93));
				
	matrix2 <= 
	 ((102,  61,   111,  79,   99,   3,    25,   50,   33,   48,   5,    94,   28),
    (106, 89,   35,   37,   112,  51,   13,   70,   3,    110,  31,   7,    99),
    (65,  115,  94,   68,   95,   114,  34,   34,   64,   1,    11,   66,   126),
    (114, 37,   42,   3,    88,   35,   124,  50,   74,   95,   25,   34,   24),
    (25,  111,  4,    116,  54,   90,   11,   32,   121,  20,   26,   62,   60),
    (45,  41,   20,   33,   89,   75,   89,   2,    28,   19,   96,   46,   119),
    (39,  68,   87,   59,   33,   82,   94,   14,   115,  0,    0,    92,   85),
    (58,  62,   122,  106,  93,   39,   86,   80,   75,   23,   57,   89,   7),
    (119, 75,   20,   42,   1,    120,  83,   24,   62,   78,   20,   25,   126),
    (121, 42,   78,   45,   8,    17,   52,   38,   44,   13,   104,  57,   62),
    (29,  96,   0,    64,   47,   50,   22,   17,   88,   63,   108,  78,   101),
    (70,  108,  69,   12,   0,    80,   115,  107,  71,   54,   5,    57,   3),
    (123, 72,   56,   5,    30,   45,   2,    11,   124,  84,   63,   47,   104));				

	
	-- Multiply column 1 of matrix B times all rows of matrix A
	processOne : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		if (procCycles(0) = 1) then
			for i in 0 to MAX_ROWS - 1 loop
				resultSum := resultSum + matrix1(0,0) * matrix2(0,i);
				resultSum := resultSum + matrix1(0,1) * matrix2(1,i);
				resultSum := resultSum + matrix1(0,2) * matrix2(2,i);
				resultSum := resultSum + matrix1(0,3) * matrix2(3,i);
				resultSum := resultSum + matrix1(0,4) * matrix2(4,i);
				resultSum := resultSum + matrix1(0,5) * matrix2(5,i);
				resultSum := resultSum + matrix1(0,6) * matrix2(6,i);
				resultSum := resultSum + matrix1(0,7) * matrix2(7,i);
				resultSum := resultSum + matrix1(0,8) * matrix2(8,i);
				resultSum := resultSum + matrix1(0,9) * matrix2(9,i);
				resultSum := resultSum + matrix1(0,10) * matrix2(10,i);
				resultSum := resultSum + matrix1(0,11) * matrix2(11,i);
				resultSum := resultSum + matrix1(0,12) * matrix2(12,i);
				result(0,i) := resultSum;
				resultSum := 0;
			end loop;
		end if;

		procCycles(0) <= procCycles(0) + 1;
	end process;
	
	
	--
	processTwo : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(1,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(1,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(1,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(1,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(1,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(1,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(1,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(1,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(1,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(1,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(1,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(1,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(1,12) * matrix2(12,i);
			result(1,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processThree : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(2,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(2,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(2,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(2,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(2,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(2,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(2,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(2,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(2,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(2,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(2,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(2,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(2,12) * matrix2(12,i);
			result(2,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processFour : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(3,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(3,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(3,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(3,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(3,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(3,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(3,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(3,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(3,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(3,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(3,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(3,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(3,12) * matrix2(12,i);
			result(3,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processFive : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(4,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(4,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(4,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(4,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(4,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(4,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(4,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(4,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(4,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(4,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(4,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(4,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(4,12) * matrix2(12,i);
			result(4,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processSix : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(5,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(5,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(5,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(5,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(5,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(5,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(5,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(5,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(5,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(5,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(5,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(5,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(5,12) * matrix2(12,i);
			result(5,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processSeven : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(6,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(6,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(6,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(6,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(6,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(6,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(6,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(6,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(6,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(6,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(6,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(6,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(6,12) * matrix2(12,i);
			result(6,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processEight : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(7,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(7,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(7,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(7,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(7,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(7,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(7,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(7,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(7,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(7,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(7,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(7,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(7,12) * matrix2(12,i);
			result(7,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processNine : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(8,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(8,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(8,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(8,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(8,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(8,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(8,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(8,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(8,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(8,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(8,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(8,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(8,12) * matrix2(12,i);
			result(8,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processTen : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(9,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(9,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(9,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(9,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(9,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(9,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(9,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(9,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(9,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(9,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(9,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(9,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(9,12) * matrix2(12,i);
			result(9,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processEleven : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(10,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(10,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(10,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(10,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(10,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(10,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(10,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(10,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(10,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(10,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(10,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(10,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(10,12) * matrix2(12,i);
			result(10,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processTwelve : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(11,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(11,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(11,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(11,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(11,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(11,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(11,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(11,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(11,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(11,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(11,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(11,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(11,12) * matrix2(12,i);
			result(11,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	--
	processThirteen : process (matrix1, matrix2)
		variable resultSum : integer := 0;
	begin
		for i in 0 to MAX_ROWS - 1 loop
			resultSum := resultSum + matrix1(12,0) * matrix2(0,i);
			resultSum := resultSum + matrix1(12,1) * matrix2(1,i);
			resultSum := resultSum + matrix1(12,2) * matrix2(2,i);
			resultSum := resultSum + matrix1(12,3) * matrix2(3,i);
			resultSum := resultSum + matrix1(12,4) * matrix2(4,i);
			resultSum := resultSum + matrix1(12,5) * matrix2(5,i);
			resultSum := resultSum + matrix1(12,6) * matrix2(6,i);
			resultSum := resultSum + matrix1(12,7) * matrix2(7,i);
			resultSum := resultSum + matrix1(12,8) * matrix2(8,i);
			resultSum := resultSum + matrix1(12,9) * matrix2(9,i);
			resultSum := resultSum + matrix1(12,10) * matrix2(10,i);
			resultSum := resultSum + matrix1(12,11) * matrix2(11,i);
			resultSum := resultSum + matrix1(12,12) * matrix2(12,i);
			result(12,i) := resultSum;
			resultSum := 0;
		end loop;
				
		
	end process;
	
	
	-- Check if full matrix calculation is ready
	calcReady : process (clk)
		
	begin

	end process;
	
	
end Behavioral;