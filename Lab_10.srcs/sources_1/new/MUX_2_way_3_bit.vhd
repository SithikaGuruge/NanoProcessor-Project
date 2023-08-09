----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 14:39:16
-- Design Name: 
-- Module Name: MUX_2_way_3_bit - Behavioral
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

entity MUX_2_way_3_bit is
 Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
          I1 : in STD_LOGIC_VECTOR (2 downto 0);
          D  : out STD_LOGIC_VECTOR (2 downto 0);
          S  : in STD_LOGIC);
end MUX_2_way_3_bit;

architecture Behavioral of MUX_2_way_3_bit is
Signal Z1,Z2,Z3,Z4,Z5,Z6 : STD_LOGIC;

begin

Z1 <= (I0(0) AND not S);
Z2 <= (I1(0) AND S);
Z3 <= (I0(1) AND not S);
Z4 <= (I1(1) AND S);
Z5 <= (I0(2) AND not S);
Z6 <= (I1(2) AND S);

D(0) <= Z1 OR Z2;
D(1) <= Z3 OR Z4;
D(2) <= Z5 OR Z6;



end Behavioral;
