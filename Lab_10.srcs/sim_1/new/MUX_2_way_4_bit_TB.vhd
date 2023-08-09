----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 14:30:26
-- Design Name: 
-- Module Name: MUX_2_way_4_bit_TB - Behavioral
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

entity MUX_2_way_4_bit_TB is
--  Port ( );
end MUX_2_way_4_bit_TB;

architecture Behavioral of MUX_2_way_4_bit_TB is


component MUX_2_way_4_bit Port(
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL I0,I1,D : std_logic_vector(3 downto 0);
SIGNAL S : std_logic;

begin

UUT : MUX_2_way_4_bit Port map(
           I0 => I0,
           I1 => I1,
           S => S,
           D => D
           );
           
process
begin

I0 <= "1101";
I1 <= "0111";

S <= '0';
wait for 200ns;
S <= '1';
wait;


end process;


end Behavioral;
