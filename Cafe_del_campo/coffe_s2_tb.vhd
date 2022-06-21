library ieee;
use ieee.std_logic_1164.all;

entity COFFE_S2_TB is
    
end entity;

architecture C2TB of COFFE_S2_TB is
    component Coffe_S2
    port (ST1_OUT : in std_logic_vector(3 downto 0);
	  COFFEE: out std_logic_vector (3 downto 0);
	  SUGAR: out std_logic_vector (3 downto 0);
	  MILK: out std_logic_vector (3 downto 0);
	  WATER: out std_logic_vector (3 downto 0);
	  FOAM: out std_logic_vector (3 downto 0));
    end component;
    signal ST1_OUT : std_logic_vector (3 downto 0);
    signal COFFEE: std_logic_vector (3 downto 0);
    signal  SUGAR: std_logic_vector (3 downto 0);
    signal  MILK: std_logic_vector (3 downto 0);
    signal  WATER: std_logic_vector (3 downto 0);
    signal  FOAM: std_logic_vector (3 downto 0);

    begin

        UUT: Coffe_S2 port map (ST1_OUT, COFFEE=>COFFEE, SUGAR=>SUGAR, MILK=>MILK, WATER=>WATER, FOAM=>FOAM);

	ST1_OUT <= "0000", "0001" after 100 ns, "0010" after 200 ns, "0011" after 300 ns, "0100" after 400 ns, "0101" after 500 ns,
             "0110" after 600 ns, "0111" after 700 ns, "1000" after 800 ns, "1001" after 900 ns;


end C2TB;