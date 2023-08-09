----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 13:12:03
-- Design Name: 
-- Module Name: Register_Bank_TB - Behavioral
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

entity Register_Bank_TB is
--  Port ( );
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is
component Register_Bank port(
           reset : in std_logic;
           Clk : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           S_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

Signal S_out_0,S_out_1,S_out_2,S_out_3,S_out_4,S_out_5,S_out_6,S_out_7,D : std_logic_vector(3 downto 0);
signal Reg_En : std_logic_vector(2 downto 0);
signal Clk,reset : std_logic;

begin
uut: Register_Bank port map(
reset => reset,
Reg_En => Reg_En,
Clk => Clk,
S_out_0 => S_out_0,
S_out_1 => S_out_1,
S_out_2 => S_out_2,
S_out_3 => S_out_3,
S_out_4 => S_out_4,
S_out_5 => S_out_5,
S_out_6 => S_out_6,
S_out_7 => S_out_7,
D => D
);
process begin
    
    Clk <= '0';
    wait for 5ns;
    
    Clk <= '1';
    wait for 5ns;
    
end process;

process begin
    reset <= '0';
    Reg_En <= "000";
    D <= "1000";
    wait for 100 ns;
        
    Reg_En <= "001";
    D <= "1010";
    wait for 100 ns;
    
    Reg_En <= "010";
    D <= "0110";    
    wait for 100 ns;
    
    Reg_En <= "011";
    D <= "1111";    
    wait for 100 ns;
        
    Reg_En <= "100";
    D <= "0011";    
    wait for 100 ns;
        
    Reg_En <= "101";
    D <= "1100";    
    wait for 100 ns;
    
    Reg_En <= "110";
    D <= "0100";    
    wait for 100 ns;
    
    
    Reg_En <= "111";
    D <= "0111";    
    wait for 100 ns;  
    
    Reg_En <= "011";
    D <= "0000";    
    wait for 100 ns;
    reset <= '1';
    wait;
    
end process;  
    
end Behavioral;
