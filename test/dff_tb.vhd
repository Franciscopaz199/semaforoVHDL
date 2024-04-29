library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end entity dff_tb;

architecture tb_arch of dff_tb is
    -- Declaración de señales
    signal D_tb, Clk_tb, Q_tb : std_logic := '0';

    -- Instancia del componente bajo prueba
    component dff
        port (
            D, Clk : in std_logic;
            Q : out std_logic
        );
    end component;

begin
     -- Conexión de señales a la instancia
     UUT : dff
     port map (
         D => D_tb,
         Clk => Clk_tb,
         Q => Q_tb
     );

    -- proceso para la senal del reloj
    Clock_process : process
    begin
        Clk_tb <= '0';
        wait for 2.5 ns;  
        while now < 10000 ns loop 
            Clk_tb <= not Clk_tb;
            wait for 5 ns;
        end loop;
        wait;
    end process Clock_process;

    -- Proceso para asignar valores manuales a D
    Stimulus_process : process
    begin
        D_tb <= '0';
        wait for 15 ns;  
        
        -- Cambios manuales en D_tb
        D_tb <= '0';
        wait for 20 ns;
        D_tb <= '1';
        wait for 20 ns;
        D_tb <= '0';
        wait for 20 ns;
        D_tb <= '1';
        wait for 20 ns;
        D_tb <= '0'; 
        wait;
    end process Stimulus_process;

end architecture tb_arch;
