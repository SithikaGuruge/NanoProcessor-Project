----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 22:20:08
-- Design Name: 
-- Module Name: MUX_8_way_4_bit - Behavioral
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

entity MUX_8_way_4_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
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
end MUX_8_way_4_bit;

architecture Behavioral of MUX_8_way_4_bit is
Component Mux_8_1
port( S : in STD_LOGIC_VECTOR (2 downto 0);
          D : in STD_LOGIC_VECTOR (7 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC);
end component;

begin
Mux_0:Mux_8_1
port map(
S => S,
D(0) => I0(0),
D(1) => I1(0),
D(2) => I2(0),
D(3) => I3(0),
D(4) => I4(0),
D(5) => I5(0),
D(6) => I6(0),
D(7) => I7(0),
Y => D(0),
EN => En
);
Mux_1:Mux_8_1
port map(
S => S,
D(0) => I0(1),
D(1) => I1(1),
D(2) => I2(1),
D(3) => I3(1),
D(4) => I4(1),
D(5) => I5(1),
D(6) => I6(1),
D(7) => I7(1),
Y => D(1),
EN => En

);
Mux_2:Mux_8_1
port map(
S => S,
D(0) => I0(2),
D(1) => I1(2),
D(2) => I2(2),
D(3) => I3(2),
D(4) => I4(2),
D(5) => I5(2),
D(6) => I6(2),
D(7) => I7(2),
Y => D(2),
EN => En

);
Mux_3:Mux_8_1
port map(
S => S,
D(0) => I0(3),
D(1) => I1(3),
D(2) => I2(3),
D(3) => I3(3),
D(4) => I4(3),
D(5) => I5(3),
D(6) => I6(3),
D(7) => I7(3),
Y => D(3),
EN => En

);

end Behavioral;
