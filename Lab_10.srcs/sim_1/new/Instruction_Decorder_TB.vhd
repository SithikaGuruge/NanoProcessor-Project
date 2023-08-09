----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 15:24:08
-- Design Name: 
-- Module Name: Instruction_Decorder_TB - Behavioral
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

entity Instruction_Decorder_TB is
--  Port ( );
end Instruction_Decorder_TB;

architecture Behavioral of Instruction_Decorder_TB is
component Instruction_Decoder
 Port ( data : in STD_LOGIC_VECTOR (11 downto 0);
          Reg_check_jump : in STD_LOGIC_VECTOR(3 downto 0);
          Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
          Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
          Load_sel : out STD_LOGIC;
          Immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
          Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
          Add_Sub_Sel : out STD_LOGIC_VECTOR(1 downto 0);
          Jump_Flag : out STD_LOGIC;
          Address_To_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;
Signal data : STD_LOGIC_VECTOR (11 downto 0);
Signal Reg_check_jump, Immediate_val : STD_LOGIC_VECTOR (3 downto 0);
Signal Address_To_Jump, Reg_En, Reg_Sel_A, Reg_Sel_B : STD_LOGIC_VECTOR (2 downto 0);
Signal Load_sel, Jump_Flag : STD_LOGIC;
signal Add_Sub_Sel : std_logic_vector(1 downto 0);

begin
uut:
Instruction_Decoder port map( 
data => data,
Reg_check_jump=> Reg_check_jump,
Immediate_val=>Immediate_val,
Address_To_Jump=> Address_To_Jump,
Reg_En=>Reg_En,
Reg_Sel_A=> Reg_Sel_A,
Reg_Sel_B=>Reg_Sel_B,
Add_Sub_Sel=>Add_Sub_Sel,
Load_sel => Load_sel,
Jump_Flag=>Jump_Flag);

process begin
    Reg_check_jump <= "0101";
    
    data <= "001011000000";
    wait for 100ns;
    
    data <= "010110000000";
    wait for 100ns;
    
    data <= "101110001010";
    wait for 100ns;
    
    Reg_check_jump <= "0000";
    
    data <= "110100000111";
    wait for 100ns;
    
    data <= "110000000111";
    wait for 100ns;
    
    
    wait;

end process;
 
end Behavioral;
