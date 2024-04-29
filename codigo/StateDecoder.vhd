library ieee;
use ieee.std_logic_1164.all;

entity StateDecoder is
    port (
        G0, G1: in std_logic;
	S1, S2, S3, S4: out std_logic
	);
end entity StateDecoder;

architecture LogicOperation of StateDecoder is
begin
    S1 <= not G0 and not G1;
    S2 <= G0 and not G1;
    S3 <= G0 and G1;
    S4 <= not G0 and G1;
end architecture LogicOperation;

