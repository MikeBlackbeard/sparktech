entity FULL_ADDER_OK_TEST is
    
end entity;

architecture TB of FULL_ADDER_OK_TEST is
    component FULL_ADDER
    port (Ai, Bi, Ci : in bit;
	  So, Co : out bit);
    end component;
    signal Ai, Bi, Ci, So, Co: bit;
    begin
        UUT: FULL_ADDER port map (Ai=>Ai, Bi=>Bi, Ci=>Ci, So=>So, Co=>Co);

Ai <= '0', '0' after 100 ns, '0' after 200 ns, '0' after 300 ns, '1' after 400 ns, '1' after 500 ns, '1' after 600 ns, '1' after 700 ns;
Bi <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns, '0' after 400 ns, '0' after 500 ns, '1' after 600 ns, '1' after 700 ns;
Ci <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns, '1' after 700 ns;

end TB;