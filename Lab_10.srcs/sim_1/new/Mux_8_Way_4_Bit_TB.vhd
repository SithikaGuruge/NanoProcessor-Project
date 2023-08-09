----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 15:21:21
-- Design Name: 
-- Module Name: Mux_8_Way_4_Bit_TB - Behavioral
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

entity Mux_8_Way_4_Bit_TB is
--  Port ( );
end Mux_8_Way_4_Bit_TB;

architecture Behavioral of Mux_8_Way_4_Bit_TB is
component Mux_8_Way_4_Bit port(
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           En : in std_logic);
end component;
signal I0,I1,I2,I3,I4,I5,I6,I7,D : std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);
signal En : std_logic := '1';

begin
UUT : Mux_8_Way_4_Bit Port map(
           I0 => I0,
           I1 => I1,
           I2 => I2,
           I3 => I3,
           I4 => I4,
           I5 => I5,
           I6 => I6,
           I7 => I7,
           S => S,
           D => D,
           En => En
           );
process
begin
        I0 <= "1111";
        I1 <= "1110";
        I2 <= "1101";
        I3 <= "1100";
        I4 <= "1011";
        I5 <= "1010";
        I6 <= "1001";
        I7 <= "1000";
        
        S <= "000";
        wait for 100ns;
        
        S <= "001";
        wait for 100ns;
        
        S <= "010";
        wait for 100ns;
        
        S <= "011";
        wait for 100ns;
        
        S <= "100";
        wait for 100ns;
        
        S <= "101";
        wait for 100ns;
        
        S <= "110";
        wait for 100ns;
        
        S <= "111";
        wait;
        
        end process;
end Behavioral;
