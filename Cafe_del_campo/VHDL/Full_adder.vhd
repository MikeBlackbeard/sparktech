entity FULL_ADDER is
    port (Ai, Bi, Ci : in bit;
	  So, Co : out bit);
    
end entity;

architecture ONE_BIT_FULL_ADDER of FULL_ADDER is
    component HALF_ADDER is
    port (A, B : in bit;
	  S, C : out bit);
    end component;

    signal sum_1, sum_2, ca_1, ca_2: bit;

    begin
    
    HF_1: HALF_ADDER port map (Ai, Bi, sum_1, ca_1);

    HF_2: HALF_ADDER port map (sum_1, Ci, So, ca_2);

    Co <= ca_1 or ca_2; 
    
        
end ONE_BIT_FULL_ADDER;