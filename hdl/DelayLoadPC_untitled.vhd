--
-- VHDL Architecture ece411.DelayLoadPC.untitled
--
-- Created:
--          by - li151.ews (siebl-0220-16.ews.illinois.edu)
--          at - 17:19:36 10/28/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayLoadPC IS
   PORT( 
      LoadPC  : IN     std_logic;
      clk     : IN     std_logic;
      LoadPC2 : OUT    std_logic
   );

-- Declarations

END DelayLoadPC ;

--
ARCHITECTURE untitled OF DelayLoadPC IS
BEGIN
  LoadPC2 <= LoadPC'delayed(30ns);
END ARCHITECTURE untitled;

