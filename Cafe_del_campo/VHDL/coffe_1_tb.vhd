library ieee;
use ieee.std_logic_1164.all;

entity COFFE_1_TB is
    
end entity;

architecture CTB of COFFE_1_TB is
    component dummy_coffee_Machine
    port (UINPUT : in std_logic_vector(5 downto 0);
	  ST1_OUT : out std_logic_vector (3 downto 0));
    end component;
    signal UINPUT : std_logic_vector(5 downto 0);
    signal ST1_OUT : std_logic_vector (3 downto 0);


    begin

        UUT: dummy_coffee_Machine port map (UINPUT, ST1_OUT);

	UINPUT <= "100000", "010000" after 100ns, "001000" after 200ns,  "000100" after 300ns,   "000010" after 400ns, 
             "100001" after 500ns, "010001" after 600ns,  "001001" after 700ns,  "000101" after 800ns,   "000011" after 900ns,
	     "110001" after 1000ns, "101010" after 1100ns, "101100" after 1200ns;


end CTB;
