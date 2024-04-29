library ieee;
use ieee.std_logic_1164.all;


entity TrafficLights is
port(VSin, ClkIn: in std_logic;
   MR, SR, MY, SY, MG, SG: out std_logic);
end entity TrafficLights;

architecture TrafficLightsBehavior of TrafficLights is
  
  component StateDecoder is
    port(G0, G1: in std_logic; 
      S1, S2, S3, S4: out std_logic);
  end component StateDecoder;

  component SequentialLogic is
    port(VS, TL, TS, Clk: in std_logic; 
      G0, G1: inout std_logic);
  end component SequentialLogic;
  
  component TimerCircuits is
    port(LongTrig, ShortTrig, Clk: In std_logic; 
    TS, TL: buffer std_logic);
  end component TimerCircuits;
  
  component FreqDivide is
    port(Clkin: in std_logic; 
    ClkOut: buffer std_logic);
  end component FreqDivide;

  signal Sig1, Sig2, Sig3, Sig4, Gray0, Gray1: std_logic;
  signal LongTime, ShortTime, TLin, TSin, Clock: std_logic;
  begin
    MR <= Sig3 or Sig4;
    SR <= Sig2 or Sig1;
    MY <= Sig2;
    SY <= Sig4;
    MG <= Sig1;
    SG <= Sig3;

    LongTime <= Sig1 or Sig3;
    ShortTime <= not(Sig1 or Sig3);
    

    SD: StateDecoder port map (G0 => Gray0, G1 => Gray1, S1 => Sig1, S2 => Sig2, S3 => Sig3, S4 => Sig4);

    SL: SequentialLogic port map (VS => VSin, TL => TLin, TS => TSin, Clk => CLKin, G0 => Gray0, G1 => Gray1);
    
    TC: TimerCircuits port map (LongTrig=>LongTime, ShortTrig=>ShortTime, Clk=>Clock, TS=>TSin, TL=>TLin);

    FD: FreqDivide port map (Clkin => CLKin, ClkOut => Clock);

end architecture TrafficLightsBehavior;
