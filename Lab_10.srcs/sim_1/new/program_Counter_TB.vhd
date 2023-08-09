----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 14:22:02
-- Design Name: 
-- Module Name: program_Counter_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_Counter_TB is
--  Port ( );
end program_Counter_TB;

architecture Behavioral of program_Counter_TB is
component program_Counter
     Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
          Q : out STD_LOGIC_VECTOR (2 downto 0);
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC);
          
end component;

SIGNAL D,Q : std_logic_vector (2 downto 0);
SIGNAL Clk,Reset : std_logic;

begin

UUT : program_Counter port map(
    D => D,
    Q => Q,
    Clk => Clk,
    Reset => Reset
    );
   
   
process
begin
Clk <= '0';
wait for 50ns;

Clk <= '1';
wait for 50ns;


end process;
    
    
process
begin

reset <= '0';

D <= "101";
wait for 200ns;

D <= "010";
wait for 200ns;

reset <= '1';
wait;

end process;

end Behavioral;
