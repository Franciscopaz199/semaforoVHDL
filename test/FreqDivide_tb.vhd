library ieee;
use ieee.std_logic_1164.all;

entity FreqDivide_tb is
end entity FreqDivide_tb;

architecture testbench of FreqDivide_tb is
    -- Declaracion del componente FreqDivide
    component FreqDivide
        port (
            Clkin: in std_logic;
            ClkOut: buffer std_logic
        );
    end component;

    -- Señales de entrada y salida
    signal Clkin_tb: std_logic := '1'; 
    signal ClkOut_tb: std_logic;        

    -- Periodo de reloj constante
    constant CLK_PERIOD: time := 20.83 ns;  

    -- 24 MHz clock (20.83 ns de periodo)
    -- por 1 000 000 000 ns / 24 000 000 ns = 41.6666666667 Hz
    -- 41.6666666667 Hz / 2 = 20.8333333333 Hz 
    -- entre dos porque solo cuenta los flancos positivos 

begin
    -- Instantiacion del componente FreqDivide
    UUT: FreqDivide port map (
        Clkin => Clkin_tb,
        ClkOut => ClkOut_tb
    );

    Clkin_tb <= not Clkin_tb after CLK_PERIOD;

end architecture testbench;
