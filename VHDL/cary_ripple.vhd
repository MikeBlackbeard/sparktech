entity RIPPLE is
    port (A1, B1, A2, B2, A3, B3, A4, B4, Ci: in bit;
	  S1, S2, S3, S4, Co : out bit);
    
end entity;

architecture ONE_BIT_FULL_ADDER of RIPPLE is
    component FULL_ADDER is
    port (Ai, Bi, Ci : in bit;
	  So, Co : out bit);
    end component;

    signal carry1, carry2, carry3, carryout : bit;

    begin
    
    SUM1: FULL_ADDER port map (A1, B1, Ci, S1, carry1);

    SUM2: FULL_ADDER port map (A2, B2, carry1, S2, carry2);

    SUM3: FULL_ADDER port map (A3, B3, carry2, S3, carry3);

    SUM4: FULL_ADDER port map (A4, B4, carry3, S4, Co);
    
        
end ONE_BIT_FULL_ADDER;