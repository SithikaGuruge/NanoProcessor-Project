----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 09:36:58
-- Design Name: 
-- Module Name: program_Counter - Behavioral
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

entity program_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC:='0';
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_vector(2 downto 0):="000");
end program_Counter;

architecture Behavioral of program_Counter is
begin
    process(Clk) begin
    if(rising_edge(Clk)) then
        if Reset = '1' then
            Q <= "000";        
        else
            Q <= D;
        end if;
     end if;
 end process;

end Behavioral;
