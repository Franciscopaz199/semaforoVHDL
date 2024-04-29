library ieee;
use ieee.std_logic_1164.all;


entity OneShot is
    port (Enable, Clk: in std_logic;
         Duration: in integer range 0 to 25;
         QOut: buffer std_logic);
end entity OneShot;


architecture OneShotBehavior of OneShot is
begin
    Counter: process (Enable, Clk, Duration)
        variable Flag : boolean := true;
        variable Cnt : integer range 0 to 25;
        variable SetCount : integer range 0 to 25;
    begin
        SetCount := Duration;
        if (Clk'EVENT and Clk = '1') then
            if Enable = '0' then
                Flag := true;
            end if;
            if Enable = '1' and Flag then
                Cnt := 1;
                Flag := False;
            end if;
            if cnt = SetCount then
                Qout <= '0';
                Cnt := 0;
                Flag := false;
            else
                if Cnt > 0 then
                    Cnt := Cnt + 1;
                    Qout <= '1';
                end if;
            end if;
        end if;
    end process;
end architecture OneShotBehavior;