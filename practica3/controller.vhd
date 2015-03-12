----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:14 03/12/2015 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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
--
--Signal type a1t
--            WordLength: 8
--        FractionLength: 6
--Signal type a2t
--            WordLength: 8
--        FractionLength: 8
--Signal type au12t
--            WordLength: 17
--        FractionLength: 6
--Signal type au1t
--            WordLength: 25
--        FractionLength: 6
--Signal type au2t
--            WordLength: 14
--        FractionLength: 6
--Signal type b0t
--            WordLength: 14
--        FractionLength: 7
--Signal type b1t
--            WordLength: 17
--        FractionLength: 8
--Signal type b2t
--            WordLength: 15
--        FractionLength: 8
--Signal type be012t
--            WordLength: 20
--        FractionLength: 10
--Signal type be01t
--            WordLength: 15
--        FractionLength: 5
--Signal type be0t
--            WordLength: 14
--        FractionLength: 5
--Signal type be1t 
--            WordLength: 16
--        FractionLength: 5
--Signal type be2t
--            WordLength: 13
--        FractionLength: 4
--Signal type ekt 
--            WordLength: 12
--        FractionLength: 10
--Signal type ukt
--            WordLength: 18
--        FractionLength: 9
--Signal type ykt
--            WordLength: 12
--        FractionLength: 9

library IEEE;
library ieee_proposed;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;

entity controller is
    Port ( yk : in  STD_LOGIC_VECTOR (11 downto 0);
           uk : out  STD_LOGIC_VECTOR (17 downto 0);
			  clk : in std_logic);
end controller;

architecture Behavioral of controller is
type ykt is type sfixed(2 downto -9);
begin


end Behavioral;

