library ieee;
use ieee.std_logic_1164.all;

entity TriggerLogic is
    port (
        T1, T2, T3, T4: in bit;
        LongTrig, ShortTrig: out bit
    );
end entity TriggerLogic;

architecture LogicOperation of TriggerLogic is
begin
    LongTrig <= T1 or T3;
    ShortTrig <= T2 or T4;
end architecture LogicOperation;

