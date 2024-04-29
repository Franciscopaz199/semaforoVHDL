library ieee;
use ieee.std_logic_1164.all;

entity TimerCircuits_TB is
end entity TimerCircuits_TB;

architecture testbench of TimerCircuits_TB is

    -- Señales de entrada y salida
    signal LongTrig, ShortTrig, Clk: std_logic := '0';
    signal TS, TL: std_logic;
    signal stop_simulation : boolean := false;  -- Señal para detener la simulación

    component TimerCircuits is
        port(
            LongTrig, ShortTrig, Clk: in std_logic;
            TS, TL: buffer std_logic
        );
    end component TimerCircuits;

    constant CLK_FREQ: natural := 1;  -- 1 Hz
    constant CLK_PERIOD: time := 1 sec / CLK_FREQ;

begin

    UUT: TimerCircuits
        port map(
            LongTrig => LongTrig,
            ShortTrig => ShortTrig,
            Clk => Clk,
            TS => TS,
            TL => TL
        );

    -- Clock Process
    Clk_Process: process
    begin
        while not stop_simulation loop
            Clk <= '1';
            wait for 0.5 sec;  -- Mitad del período para un ciclo de reloj de 1 Hz
            Clk <= '0';
            wait for 0.5 sec;  -- Mitad del período para un ciclo de reloj de 1 Hz
        end loop;
    end process Clk_Process;

    -- Stimulus Process
    Stimulus_Process: process
    begin
        LongTrig <= '0';
        ShortTrig <= '1';
        wait for 3 sec;  -- Espera inicial de 500 ms
        LongTrig <= '1';  -- Trigger Long Timer
        ShortTrig <= '0';
        wait for 24 sec;  -- Duración del pulso LongTrig
        LongTrig <= '0';
        ShortTrig <= '1';
        wait for 3 sec;  -- Espera entre pulsos
        LongTrig <= '1';
        ShortTrig <= '0';
        wait for 24 sec;
        stop_simulation <= true; -- Señal para detener la simulación
        wait;
    end process Stimulus_Process;

end architecture testbench;
