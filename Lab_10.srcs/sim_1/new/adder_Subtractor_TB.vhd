----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 15:23:19
-- Design Name: 
-- Module Name: adder_Subtractor_TB - Behavioral
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

entity adder_Subtractor_TB is
--  Port ( );
end adder_Subtractor_TB;

architecture Behavioral of adder_Subtractor_TB is
component AdderSubtracter
Port ( A : in STD_LOGIC_Vector(3 downto 0);
           B : in STD_LOGIC_vector(3 downto 0);
           C_in : in STD_LOGIC_vector(1 downto 0);
           S : out STD_LOGIC_vector(3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out std_logic;
           C_out_plus : out std_logic);
end component;
signal A,B,S: std_logic_vector(3 downto 0);
signal Zero,C_out,C_out_plus : std_logic;
signal C_in : std_logic_vector(1 downto 0);


begin
uut: AdderSubtracter port map(
A=>A,
B=>B,
C_in=>C_in,
S => S,
Zero => Zero,
C_out => C_out,
C_out_plus => C_out_plus);
process
begin


C_in<="00";
A<= "0010";
B<= "0001";
wait for 10ns;

C_in<="00";
A<= "0010";
B<= "0010";
wait for 10ns;

C_in<="01";
A<= "1000";
B<= "0001";
wait for 10ns;

C_in<="01";
A<= "0001";
B<= "0001";

wait for 1ns;

C_in<="00";
A<= "1111";
B<= "0011";
wait;

end process;
end Behavioral;
