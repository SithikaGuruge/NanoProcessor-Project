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

entity AdderSubtracter is
    Port ( A : in STD_LOGIC_Vector(3 downto 0);
           B : in STD_LOGIC_vector(3 downto 0);
           C_in : in STD_LOGIC_vector(1 downto 0);
           S : out STD_LOGIC_vector(3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out std_logic;
           C_out_plus : out std_logic);
end AdderSubtracter;

architecture Behavioral of AdderSubtracter is

component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component; 
 
 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C , output, C_tmp : std_logic; 
signal B_out,S0 : std_logic_vector(3 downto 0);
begin
B_out(0) <= (C_in(0) and (not C_in(1))) xor B(0);
B_out(1) <= (C_in(0) and (not C_in(1))) xor B(1);
B_out(2) <= (C_in(0) and (not C_in(1))) xor B(2);
B_out(3) <= (C_in(0) and (not C_in(1))) xor B(3);

C_tmp <= (C_in(0) and (not C_in(1)));

 FA_0 : FA 
    port map ( 
        A => A(0), 
        B => B_out(0), 
        C_in => C_tmp, 
        S => S0(0), 
        C_Out => FA0_C); 
 FA_1 : FA 
    port map ( 
        A => A(1), 
        B => B_out(1), 
        C_in => FA0_C, 
        S => S0(1), 
        C_Out => FA1_C);
 FA_2 : FA 
     port map ( 
         A => A(2), 
         B => B_out(2), 
         C_in => FA1_C, 
         S => S0(2), 
         C_Out => FA2_C); 
 FA_3 : FA 
     port map ( 
         A => A(3), 
         B => B_out(3), 
         C_in => FA2_C, 
         S => S0(3), 
         C_Out => output); 
         

C_Out <= C_tmp AND (output xor FA2_C) ;
C_out_plus<= output and not(C_tmp);
Zero <= (NOT(C_in(1) OR C_in(0))) AND (not(S0(0) or S0(1) or S0(2) or S0(3)));
S<= S0;

end Behavioral;
