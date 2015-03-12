--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package fixed_generic_pkg is
generic (
-- Redondeo: fixed_round o fixed_truncate
FIXED_ROUND_STYLE : fixed_round_style_type := FIXED_ROUND;
-- Overflow: fixed_saturate o fixed_wrap
FIXED_OVERFLOW_STYLE : fixed_overflow_style_type := FIXED_SATURATE;
- Bits extra para las operaciones de división
FIXED_GUARD_BITS : natural := 3;
-- no_warning: Si true entonces se desactivan los avisos
NO_WARNING : boolean := false
);
end fixed_generic_pkg;

package body fixed_generic_pkg is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end fixed_generic_pkg;
