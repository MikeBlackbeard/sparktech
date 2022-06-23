library ieee;
use ieee.std_logic_1164.all;

entity TB_COFFE_clock is
    
end entity;


architecture CTB_CLK of TB_COFFE_clock is

    constant ClockFq : integer := 100e6; --100MHz
    constant ClockT  : time    := 1000ms / ClockFq;
     

    signal clk : std_logic := '1';
    
    begin

    clk <= not clk after ClockT/2;

end architecture;