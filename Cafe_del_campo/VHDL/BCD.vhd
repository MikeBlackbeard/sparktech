library ieee;
use ieee.std_logic_1164.all;

entity BCD is
    port (C : in std_logic_vector(6 downto 0);
	  Z : out std_logic_vector (3 downto 0));
end entity;

architecture COUNTER of BCD is
begin
    process(X)
    begin
    case x is
	when "100000" => Z <= "0000";
	when "010000" => Z <= "0001";
	when "001000" => Z <= "0010";
	when "000100" => Z <= "0011";
	when "000010" => Z <= "0100";
	when "100001" => Z <= "0101";
	when "010001" => Z <= "0110";
	when "001001" => Z <= "0111";
	when "000101" => Z <= "1000";
	when "000011" => Z <= "1001";
	when others => Z <= "1111";
    end case;
    end process;
end COUNTER;
