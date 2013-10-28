--
-- VHDL Architecture ece411.pulse45.untitled
--
-- Created:
--          by - li151.ews (linux-a3.ews.illinois.edu)
--          at - 21:48:44 10/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY pulse45 IS
   PORT( 
      delayed : OUT    std_logic;
      clk  : IN     std_logic
   );

-- Declarations

END pulse45 ;

--
ARCHITECTURE untitled OF pulse45 IS
BEGIN
  delayer : process(clk)
  begin
    delayed <= clk'delayed(45ns);
  end process;
END ARCHITECTURE untitled;

