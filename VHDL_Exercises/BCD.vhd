library ieee;
use ieee.std_logic_1164.all;

entity BCD is
    port (X : in std_logic_vector(3 downto 0);
	  Z : out std_logic_vector (6 downto 0));
end entity;

architecture COUNTER of BCD is
begin
    process(X)
    begin
    case x is
	when "0000" => Z <= "1111110";
	when "0001" => Z <= "0110000";
	when "0010" => Z <= "1101101";
	when "0011" => Z <= "1111001";
	when "0100" => Z <= "0110011";
	when "0101" => Z <= "1011011";
	when "0110" => Z <= "1011111";
	when "0111" => Z <= "1110001";
	when "1000" => Z <= "1111111";
	when "1001" => Z <= "1110111";
	when others => Z <= "0000000";
    end case;
    end process;
end COUNTER;
