library ieee;
use ieee.std_logic_1164.all;

entity TimerCircuits is
	port(LongTrig, ShortTrig, Clk:in std_logic;
		TS, TL: buffer std_logic);
end entity TimerCircuits;

architecture TimerBehavior of TimerCircuits is

component OneShot is
	port(Enable, Clk: in std_logic;
		Duration :in integer range 0 to 25;
		QOut :buffer std_logic);
end component OneShot;

signal SetCountLong, SetCountShort: integer range 0 to 25;
begin
	
	SetCountLong <=25;
	SetCountShort <=4;

	TLong: OneShot 
		port map(
				Enable=>LongTrig, 
				Clk=>Clk, 
				Duration=>SetCountLong, 
				QOut=>TL);

	TShort: OneShot 
		port map(
			Enable=>ShortTrig, 
			Clk=>Clk, 
			Duration=>SetCountShort, 
			QOut=>TS);
end architecture TimerBehavior;