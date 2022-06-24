library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity ALULULU_TB is
    
end entity;

architecture CTB of ALULULU_TB is
    component Complex_ALU
    port (A : in std_logic_vector(3 downto 0);
          B : in std_logic_vector(3 downto 0);
	  SEL : in std_logic_vector(3 downto 0);
          Y : out std_logic_vector(3 downto 0);
	  MUL : out std_logic_vector(7 downto 0);
	  Re : Out std_logic_vector(3 downto 0));
    end component;

    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);
    signal SEL : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector (3 downto 0);
    signal MUL : std_logic_vector (7 downto 0);
    signal Re : std_logic_vector (3 downto 0);

     begin


        UUT: Complex_ALU port map (A, B, SEL, Y, MUL, Re);

	A <= "0000", "0000" after 100ns, "0000" after 200ns,  "0000" after 300ns,   "0011" after 400ns, 
             "0011" after 500ns, "0011" after 600ns,  "0011" after 700ns,  "1010" after 800ns,   "1010" after 900ns,
	     "1010" after 1000ns, "1010" after 1100ns, "1010" after 1200ns;

	B <= "0000", "0001" after 100ns, "0010" after 200ns,  "0011" after 300ns,   "0100" after 400ns, 
             "0101" after 500ns, "0110" after 600ns,  "0111" after 700ns,  "1000" after 800ns,   "1001" after 900ns,
	     "1010" after 1000ns, "1011" after 1100ns, "1110" after 1200ns;

	SEL <= "0000", "0001" after 100ns, "0010" after 200ns,  "0011" after 300ns,   "0000" after 400ns, 
             "0001" after 500ns, "0011" after 600ns,  "0000" after 700ns,  "0001" after 800ns,   "0010" after 900ns,
	     "0011" after 1000ns, "0000" after 1100ns, "0001" after 1200ns;
end CTB;

