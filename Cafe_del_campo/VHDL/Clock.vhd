library ieee;
use ieee.std_logic_1164.all;

entity clock is
    
end entity;


architecture CTB_CLK of clock is

    constant ClockT  : time    := 1000 ns;
     

    signal clk : std_logic := '1';
    
    begin

    clk <= not clk after ClockT/2;

end architecture;
