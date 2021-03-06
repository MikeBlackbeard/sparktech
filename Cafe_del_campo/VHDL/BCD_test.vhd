library ieee;
use ieee.std_logic_1164.all;

entity BCD_TEST_BENCH is
    
end entity;

architecture BCD_TB of BCD_TEST_BENCH is
    component BCD
    port (X : in std_logic_vector(3 downto 0);
	  Z : out std_logic_vector (6 downto 0));
    end component;
    signal X : std_logic_vector(3 downto 0);
    signal Z : std_logic_vector(6 downto 0);
    begin

    UUT: BCD port map (X=>X, Z=>Z);
    X <= "0000", "0001" after 100 ns, "0010" after 200 ns, "0011" after 300 ns, "0100" after 400 ns, "0101" after 500 ns, "0110" after 600 ns,
                 "0111" after 700 ns, "1000" after 800 ns, "1001" after 900 ns;
    
end BCD_TB;