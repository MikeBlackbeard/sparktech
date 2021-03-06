library ieee;
use ieee.std_logic_1164.all;

entity TB_COFFE_WOC is
    
end entity;


architecture CTB of TB_COFFE_WOC is
    component COFFEE_M_W
    port (UINPUT : in std_logic_vector(5 downto 0);
	  COFFEE: out std_logic_vector (3 downto 0);
	  SUGAR: out std_logic_vector (3 downto 0);
	  MILK: out std_logic_vector (3 downto 0);
	  WATER: out std_logic_vector (3 downto 0);
	  FOAM: out std_logic_vector (3 downto 0));
    end component;
    signal UINPUT : std_logic_vector(5 downto 0);
    signal COFFEE: std_logic_vector (3 downto 0);
    signal SUGAR: std_logic_vector (3 downto 0);
    signal MILK: std_logic_vector (3 downto 0);
    signal WATER: std_logic_vector (3 downto 0);
    signal FOAM: std_logic_vector (3 downto 0);
    begin

        UUT: COFFEE_M_W port map (UINPUT, COFFEE, SUGAR, MILK, WATER, FOAM);

	UINPUT <= "100000", "010000" after 100ns, "001000" after 200ns,  "000100" after 300ns,   "000010" after 400ns, 
             "100001" after 500ns, "010001" after 600ns,  "001001" after 700ns,  "000101" after 800ns,   "000011" after 900ns,
	     "110001" after 1000ns, "101010" after 1100ns, "101100" after 1200ns;


end CTB;