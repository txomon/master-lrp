----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:38:20 03/11/2015 
-- Design Name: 
-- Module Name:    raiz - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity raiz is
    Port ( clk : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (15 downto 0);
           res : out  STD_LOGIC_VECTOR (15 downto 0));
end raiz;

architecture Behavioral of raiz is
COMPONENT raiz_cuadrada
  PORT (
    x_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    x_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC
  );
END COMPONENT;
begin

rc_impl : raiz_cuadrada
  PORT MAP (
    x_in => op,
    x_out => res,
    clk => clk
  );
end Behavioral;

