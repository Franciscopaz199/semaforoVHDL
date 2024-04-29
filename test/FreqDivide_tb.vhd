library ieee;
use ieee.std_logic_1164.all;

entity FreqDivide_tb is
end entity FreqDivide_tb;

architecture testbench of FreqDivide_tb is
    -- Component declaration
    component FreqDivide
        port (
            Clkin: in std_logic;
            ClkOut: buffer std_logic
        );
    end component;

    -- Signals
    signal Clkin_tb: std_logic := '1';  -- Clock input signal
    signal ClkOut_tb: std_logic;         -- Clock output signal

    -- Clock period definitions
    constant CLK_PERIOD: time := 20 ns;  -- 48 MHz clock (20.83 ns period)

begin
    -- Instantiate the FreqDivide module
    UUT: FreqDivide port map (
        Clkin => Clkin_tb,
        ClkOut => ClkOut_tb
    );

    Clkin_tb <= not Clkin_tb after 20.83 ns;

end architecture testbench;
