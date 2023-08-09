----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2023 23:45:35
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Clk : in STD_LOGIC; 
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           S_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           S_out_7 : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in std_logic);
end Register_Bank;

architecture Behavioral of Register_Bank is
component Decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));

end component;
component Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in std_logic);

end component;

signal out_Dec : std_logic_vector(7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
            I => Reg_En ,
            EN => '1',
            Y => out_Dec);
            
    Reg_0 :Reg
        port map(
            reset => reset,
            D => D,
            En => out_Dec(0),
            Clk => Clk,
            Q => S_out_0);
Reg_1 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(1),
        Clk => Clk,
        Q => S_out_1);
Reg_2 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(2),
        Clk => Clk,
        Q => S_out_2);
Reg_3 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(3),
        Clk => Clk,
        Q => S_out_3);
Reg_4 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(4),
        Clk => Clk,
        Q => S_out_4);
Reg_5 :Reg
      port map(
        reset => reset,
        D => D,
        En => out_Dec(5),
        Clk => Clk,
        Q => S_out_5);
Reg_6 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(6),
        Clk => Clk,
        Q => S_out_6);
Reg_7 :Reg
     port map(
        reset => reset,
        D => D,
        En => out_Dec(7),
        Clk => Clk,
        Q => S_out_7);
    
end Behavioral;
