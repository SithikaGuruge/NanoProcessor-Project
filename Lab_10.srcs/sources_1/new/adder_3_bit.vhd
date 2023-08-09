----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 00:27:52
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity adder_3_bit is
    Port ( A : in STD_LOGIC_Vector(2 downto 0);
           S : out STD_LOGIC_vector(2 downto 0));
end adder_3_bit;

architecture Behavioral of adder_3_bit is

component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component; 
 
 SIGNAL  FA0_C,  FA1_C, FA2_C : std_logic; 

begin

 FA_0 : FA 
    port map ( 
        A => A(0), 
        B => '1', 
        C_in => '0', 
        S => S(0), 
        C_Out => FA0_C); 
 FA_1 : FA 
    port map ( 
        A => A(1), 
        B => '0', 
        C_in => FA0_C, 
        S => S(1), 
        C_Out => FA1_C);
 FA_2 : FA 
     port map ( 
         A => A(2), 
         B => '0', 
         C_in => FA1_C, 
         S => S(2), 
         C_Out => FA2_C);  
         


end Behavioral;
