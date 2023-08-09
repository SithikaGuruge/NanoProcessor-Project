----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 16:14:27
-- Design Name: 
-- Module Name: NanoProcessor_TB - Behavioral
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

entity NanoProcessor_TB is
--  Port ( );
end NanoProcessor_TB;

architecture Behavioral of NanoProcessor_TB is

component NanoProcessor port(
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg7_out : out STD_LOGIC_VECTOR(3 downto 0);
           Anode : out STD_LOGIC_VECTOR(3 downto 0));
end component;

SIGNAL Clk,Reset,Zero,Overflow  : std_logic := '0';
SIGNAL Reg7_Seg: std_logic_vector(6 downto 0);
signal Reg7_out : STD_LOGIC_VECTOR(3 downto 0);

begin

UUT : NanoProcessor port map(
           Clk => Clk,
           Reset => Reset,
           Reg7_Seg => Reg7_Seg,
           Zero => Zero,
           Overflow => Overflow,
           Reg7_out => Reg7_out
);

process
begin

    Clk <= '0';
    wait for 5ns;
    
    Clk <= '1';
    wait for 5ns;

end process;

process
begin
    Reset <= '0';
    wait for 100ns;
    Reset <= '0';
    wait for 100ns;
    
    
    wait;

end process;


end Behavioral;
