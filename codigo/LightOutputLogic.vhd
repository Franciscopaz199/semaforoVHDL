entity LightOutputLogic is
    port (
        L1, L2, L3, L4: in bit;
        MR, MY, MG, SR, SY, SG: out bit
    );
end entity LightOutputLogic;

architecture LogicOperation of LightOutputLogic is
begin
    MR <= L3 or L4;
    MY <= L2;
    MG <= L1;
    SR <= L1 or L2;
    SY <= L4;
    SG <= L3;
end architecture LogicOperation;

