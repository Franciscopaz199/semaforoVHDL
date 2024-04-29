library ieee;
use ieee.std_logic_1164.all;

entity SequentialLogic is
	port(VS, TL, TS, Clk: in std_logic; 
		G0, G1: inout std_logic);
end entity SequentialLogic;

architecture SequenceBehavior of SequentialLogic is

component dff is
port (D, Clk: in std_logic; 
	      Q: out std_logic);
end component dff;

signal D0, D1: std_logic;
begin
D1 <= (G0 and not TS) or (G1 and TS);

D0 <= (not G1 and not TL and VS) or (not G1 and G0)
	or (G0 and TL and VS);

DFF0: dff 
	port map(D=> D0, 
		Clk => Clk, 
		Q => G0);

DFF1: dff 
	port map(D=> D1, 
		Clk => Clk, 
		Q => G1);

end architecture SequenceBehavior;