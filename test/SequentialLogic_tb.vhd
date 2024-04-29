library ieee;
use ieee.std_logic_1164.all;

entity SequentialLogic_tb is
end entity SequentialLogic_tb;

architecture testbench of SequentialLogic_tb is
    -- Constantes para la simulación
    constant CLK_PERIOD: time := 10 ms;  -- Clock period (100 Hz)
    constant SIM_TIME: time := 25 sec;   -- Simulation time

    -- Componente a probar (UUT: Unit Under Test)
    component SequentialLogic is
        port (
            VS, TL, TS, Clk: in std_logic;
            G0, G1: inout std_logic
        );
    end component SequentialLogic;

    -- Señales de entrada y salida del componente
    signal VS_tb, TL_tb, TS_tb, Clk_tb: std_logic := '0';
    signal G0_tb, G1_tb: std_logic := '0';

begin
   -- Instanciación del componente  de la lógica secuencial
    UUT: SequentialLogic port map (
        VS => VS_tb,
        TL => TL_tb,
        TS => TS_tb,
        Clk => Clk_tb,
        G0 => G0_tb,
        G1 => G1_tb
    );

    -- Proceso del reloj (100 Hz)
    Clock_process : process
    begin
        Clk_tb <= '0';
        wait for 5 ms; 
        while now < 500 sec loop 
            Clk_tb <= not Clk_tb;
            wait for 5 ms;
        end loop;
        wait;
    end process Clock_process;

    -- Proceso de estímulos
    Stimulus_process: process
    begin

       -- Estado inicial y cambios manuales durante los primeros 25 segundos
       -- TL activo y VS inactivo
       -- estado esperado: Q1 Q0 = 00
       VS_tb <= '0';
       TL_tb <= '1';
       TS_tb <= '0';
       wait for 25 sec;

        -- Siguiente estado, se activa VS y se desactiva TL
        -- estado esperado: Q1 Q0 = 01
       VS_tb <= '1';
       TL_tb <= '0';       
       TS_tb <= '1';
       wait for 4 sec;

       -- Estado siguiente,se activa vs y se desactiva TS 
       -- estado esperado: Q1 Q0 = 11
       VS_tb <= '1';
       TL_tb <= '1';       
       TS_tb <= '0';
       wait for 25 sec;   
       
       -- Estado siguiente, se activa TL y se desactiva VS
       -- significa que no hay coches en la calle secundaria
         -- estado esperado: Q1 Q0 = 10
       VS_tb <= '0';
       TL_tb <= '0';       
       TS_tb <= '1';
       wait for 4 sec;
       
       -- Estado siguiente, se activa TL y se desactiva TS
       -- estado esperado: Q1 Q0 = 00
        -- Se activa TL y se desactiva TS
        -- vuelta al estado inicial
       VS_tb <= '0';
       TL_tb <= '1';       
       TS_tb <= '0';
       wait for 25 sec;

       VS_tb <= '1';
       TL_tb <= '0';       
       TS_tb <= '1';
       wait for 4 sec;

       -- Present State: Q1 Q0 = 01, Input Conditions: TLVs
       VS_tb <= '1';
       TL_tb <= '1';       
       TS_tb <= '0';
       wait for 25 sec;   
       
       -- Present State: Q1 Q0 = 01, Input Conditions: TS
       VS_tb <= '0';
       TL_tb <= '1';       
       TS_tb <= '1';
       wait for 4 sec;
       
       -- Present State: Q1 Q0 = 11, Input Conditions: TL Vs
       VS_tb <= '0';
       TL_tb <= '1';       
       TS_tb <= '0';
       wait for 25 sec;
        

        -- Final de los estímulos
        wait;
    end process Stimulus_process;

end architecture testbench;
