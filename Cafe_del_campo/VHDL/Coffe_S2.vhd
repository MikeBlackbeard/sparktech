library ieee;
use ieee.std_logic_1164.all;

entity Coffe_S2 is
    port (ST1_OUT : in std_logic_vector(3 downto 0);
	  COFFEE: out std_logic_vector (3 downto 0);
	  SUGAR: out std_logic_vector (3 downto 0);
	  MILK: out std_logic_vector (3 downto 0);
	  WATER: out std_logic_vector (3 downto 0);
	  FOAM: out std_logic_vector (3 downto 0));
	
end entity;

architecture Mix of Coffe_S2 is
	
begin
    process(ST1_OUT)
    begin
    case ST1_OUT is
	when "0001" => 
		COFFEE <= "0001";
		MILK <= "0000";
		WATER <= "0000";
		SUGAR <= "0000";
		FOAM <= "0000";

	when "0010" => 
		COFFEE <= "0010";
		MILK <= "0000";
		WATER <= "0011";
		SUGAR <= "0000";
		FOAM <= "0000";

	when "0011" => 
		COFFEE <= "0010";
		MILK <= "0010";
		WATER <= "0000";
		SUGAR <= "0000";
		FOAM <= "0010";

	when "0100" => 
		COFFEE <= "0010";
		MILK <= "1000";
		WATER <= "0000";
		SUGAR <= "0000";
		FOAM <= "0001";

	when "0101" => 
		COFFEE <= "0010";
		MILK <= "0000";
		WATER <= "0000";
		SUGAR <= "0000";
		FOAM <= "0001";

	when "0110" => 
		COFFEE <= "0001";
		MILK <= "0000";
		WATER <= "0000";
		SUGAR <= "0001";
		FOAM <= "0000";

	when "0111" => 
		COFFEE <= "0010";
		MILK <= "0000";
		WATER <= "0011";
		SUGAR <= "0001";
		FOAM <= "0000";

	when "1000" => 
		COFFEE <= "0010";
		MILK <= "0010";
		WATER <= "0000";
		SUGAR <= "0001";
		FOAM <= "0010";

	when "1001" => 
		COFFEE <= "0010";
		MILK <= "1000";
		WATER <= "0000";
		SUGAR <= "0001";
		FOAM <= "0001";

	when "1010" => 
		COFFEE <= "0010";
		MILK <= "0000";
		WATER <= "0000";
		SUGAR <= "0001";
		FOAM <= "0001";
	
	when others => 
		COFFEE <= "0000";
		MILK <= "0000";
		WATER <= "0000";
		SUGAR <= "0000";
		FOAM <= "0000";
    end case;

    end process;
end Mix;