library ieee;
use ieee.std_logic_1164.all;

entity FreqDivide is
    port (
        Clkin: in std_logic; -- Corregido: 'in' estaba en la posici�n incorrecta.
        ClkOut: buffer std_logic
    );
end entity FreqDivide;

architecture FreqDivideBehavior of FreqDivide is
begin
    FreqDivide: process(Clkin)
        variable Cnt: integer:=0;
        variable SetCount: integer;
    begin
        SetCount := 12000000;
        if (Clkin'EVENT and Clkin = '1') then
            if (Cnt = SetCount) then
                if ClkOut = '0' then
                    ClkOut <= '1';
                else
                    ClkOut <= '0';
                end if;
                Cnt := 0;
            else
                Cnt := Cnt + 1;
            end if;
        end if;
    end process;
end architecture FreqDivideBehavior;
