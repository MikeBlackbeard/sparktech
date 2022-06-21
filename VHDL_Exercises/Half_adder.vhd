entity HALF_ADDER is
    port (A, B: in bit;
	  S, C: out bit);
end entity;

architecture HA of HALF_ADDER is
begin
    S <= A xor B;
    C <= A and B;
end HA;