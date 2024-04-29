library ieee;
use ieee.std_logic_1164.all;

entity dff is
    port (
        D, Clk : in std_logic;
        Q : out std_logic
    );
end entity dff;

architecture LogicOperation of dff is
begin
    process
    begin
        wait until rising_edge (Clk);
        if D = '1' then
            Q <= '1';
        else
            Q <= '0';
        end if;   
    end process;
end architecture LogicOperation;
