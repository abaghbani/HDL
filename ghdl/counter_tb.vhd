library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;    -- for the unsigned type

entity counter_tb is
end entity counter_tb;

architecture RTL of counter_tb is
	constant clock_period		: time := 5 ns;
	signal reset : std_logic := '1';
	signal clock : std_logic := '0';
	signal writeEn : std_logic := '0';
	signal dataWrite : std_logic_vector(31 downto 0) := (others=>'0');
	signal dataOut : std_logic_vector(31 downto 0) := (others=>'0');
	
	component counter is
	port
	(
		RST   : in std_logic;
		CLK   : in std_logic;
		LOAD  : in std_logic;
		DATA  : in std_logic_vector(31 downto 0);
		Q     : out std_logic_vector(31 downto 0)
	);
	end component;

begin
	
	
	dut : counter
	port map
	(
		RST   => reset,
		CLK   => clock,
		LOAD  => writeEn,
		DATA  => dataWrite,
		
		Q     => dataOut
	);

	process begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
	end process;

	process begin
		wait for 20 ns;
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		wait;
	end process;

	process (clock, reset) begin
		if rising_edge(clock) then
			writeEn		<= not writeEn;
			dataWrite	<= std_logic_vector(unsigned(dataWrite)+1);
		end if;
		
		-- assert false report "end of sim";
		-- wait;
	end process;
	
end architecture RTL;