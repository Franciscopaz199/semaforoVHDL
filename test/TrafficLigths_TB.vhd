library ieee;
use ieee.std_logic_1164.all;

entity TrafficLigths_TB is
end entity TrafficLigths_TB;

architecture testbench of TrafficLigths_TB is
  -- Component declaration for the DUT (Design Under Test)
  component TrafficLigths
    port(
      VSin, ClkIn: in std_logic; 
      MR, SR, MY, SY, MG, SG: out std_logic
    );
  end component TrafficLigths;

  -- Signals for test bench
  signal Clk_tb: std_logic := '0';
  signal VSin_tb: std_logic := '0';
  signal MR_tb, SR_tb, MY_tb, SY_tb, MG_tb, SG_tb: std_logic;

  -- Constant declarations
  constant CLOCK_PERIOD: time := 20.83 ns;
  constant SIMULATION_TIME: time := 200 sec;
  signal stop_simulation : boolean := false;  -- Señal para detener la simulación

begin

  -- Instantiate the DUT
  UUT: TrafficLigths port map (
    VSin => VSin_tb,
    ClkIn => Clk_tb,
    SR => SR_tb,
    MY => MY_tb,
    SY => SY_tb,
    MG => MG_tb,
    SG => SG_tb
  );


  -- Clock process with 24 MHz frequency
  Clock_process : process
  begin
      Clk_tb <= '0';
      wait for CLOCK_PERIOD ;  -- Half period for initial clock edge
      while now < SIMULATION_TIME loop 
          Clk_tb <= not Clk_tb;
          wait for CLOCK_PERIOD;  -- Half period
      end loop;
      wait;
  end process Clock_process;

  -- Manual input process for traffic light
  Manual_Input_Process: process
  begin
    -- Espera 25 segundos
    wait for 25 sec;
    -- Luego, establece VSin_tb en '1'
    VSin_tb <= '1';

    wait for 25 sec;
    VSin_tb <= '0';
    stop_simulation <= true;
  end process Manual_Input_Process;

end architecture testbench;
