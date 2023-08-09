----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 14:14:12
-- Design Name: 
-- Module Name: ROM_TB - Behavioral
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

entity ROM_TB is
--  Port ( );
end ROM_TB;

architecture Behavioral of ROM_TB is
component ROM
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;
signal address : std_logic_vector(2 downto 0);
SIGNAL data : STD_LOGIC_VECTOR (11 downto 0);

begin
uut: ROM port map(
address=>address,
data =>data);

process
begin

address <= "000";
wait for 100ns;

address <= "001";
wait for 100ns;

address <= "010";
wait for 100ns;

address <= "011";
wait for 100ns;

address <= "100";
wait for 100ns;

address <= "101";
wait for 100ns;

address <= "110";
wait for 100ns;

address <= "111";
wait;

end process;

end Behavioral;
