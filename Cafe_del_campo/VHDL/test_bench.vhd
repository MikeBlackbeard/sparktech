entity HALF_ADDER_TEST_BENCH is
    
end entity;

architecture TB of HALF_ADDER_TEST_BENCH is
    component HALF_ADDER
    port (A, B : in bit;
	  S, C : out bit);
    end component;
    signal A, B, S, C: bit;
    begin
        UUT: HALF_ADDER port map (A=>A, B=>B, S=>S, C=>C);

A <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns;
B <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;

end TB;