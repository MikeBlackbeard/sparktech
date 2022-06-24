library ieee;
use ieee.std_logic_1164.all;

entity dummy_coffee_Machine is
    port (UINPUT : in std_logic_vector(5 downto 0);
	  CLK : in std_logic;
	  ST1_OUT : out std_logic_vector (3 downto 0));
	  
end entity;

architecture INPUT of dummy_coffee_Machine is

begin
    process(UINPUT, CLK) is
	begin
	if rising_edge (CLK) then

   		case UINPUT is
		when "100000" => ST1_OUT <= "0001";
		when "010000" => ST1_OUT <= "0010";
		when "001000" => ST1_OUT <= "0011";
		when "000100" => ST1_OUT <= "0100";
		when "000010" => ST1_OUT <= "0101";
        	when "100001" => ST1_OUT <= "0110";
		when "010001" => ST1_OUT <= "0111";
		when "001001" => ST1_OUT <= "1000";
		when "000101" => ST1_OUT <= "1001";
		when "000011" => ST1_OUT <= "1010";
		when others => ST1_OUT <= "0000";
    		end case;
	end if;

    	end process;

end INPUT;
