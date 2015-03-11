----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:36 03/10/2015 
-- Design Name: 
-- Module Name:    divisor - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor is
    Port ( op_a : in  STD_LOGIC_VECTOR (6 downto 0);
           op_b : in  STD_LOGIC_VECTOR (6 downto 0);
           res : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in  STD_LOGIC);
end divisor;

architecture Behavioral of divisor is
component divisor_impl
	port (
	clk: in std_logic;
	rfd: out std_logic;
	dividend: in std_logic_vector(6 downto 0);
	divisor: in std_logic_vector(6 downto 0);
	quotient: out std_logic_vector(6 downto 0);
	fractional: out std_logic_vector(7 downto 0));
end component;

	signal quotient : std_logic_vector(6 downto 0);
	signal fractional : std_logic_vector(7 downto 0);
begin
divisor_implementation: divisor_impl
		port map (
			clk => clk,
			rfd => open,
			dividend => op_a,
			divisor => op_b,
			quotient => quotient,
			fractional => fractional);
		res <= '0' & quotient & fractional;
end Behavioral;

