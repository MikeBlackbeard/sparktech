library ieee;
use ieee.std_logic_1164.all;

entity COFFEE_M_W is
    port (UINPUT : in std_logic_vector(5 downto 0);
	  COFFEE: out std_logic_vector (3 downto 0);
	  SUGAR: out std_logic_vector (3 downto 0);
	  MILK: out std_logic_vector (3 downto 0);
	  WATER: out std_logic_vector (3 downto 0);
	  FOAM: out std_logic_vector (3 downto 0));
end entity;

architecture C2TB of COFFEE_M_W is

    component dummy_coffee_Machine
    port (UINPUT : in std_logic_vector(5 downto 0);
	  ST1_OUT : out std_logic_vector (3 downto 0));
    end component;

    signal ST1_OUT: std_logic_vector(3 downto 0);

    component Coffe_S2
    port (ST1_OUT : in std_logic_vector(3 downto 0);
	  COFFEE: out std_logic_vector (3 downto 0);
	  SUGAR: out std_logic_vector (3 downto 0);
	  MILK: out std_logic_vector (3 downto 0);
	  WATER: out std_logic_vector (3 downto 0);
	  FOAM: out std_logic_vector (3 downto 0));
    end component;

    begin

        CM1: dummy_coffee_Machine port map (UINPUT, ST1_OUT);
	CM2: Coffe_S2 port map (ST1_OUT, COFFEE, SUGAR, MILK, WATER, FOAM);

end C2TB;
