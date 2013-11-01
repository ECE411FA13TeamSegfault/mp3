--
-- VHDL Architecture ece411.ValidWindow.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 03:35:20 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ValidWindow IS
   PORT( 
      clk            : IN     std_logic;
      delayed        : IN     std_logic;
      ValidWindowout : OUT    std_logic
   );

-- Declarations

END ValidWindow ;

--
ARCHITECTURE untitled OF ValidWindow IS
BEGIN
  ValidWindowout <= ((not clk) and delayed) after delay_logic2;
END ARCHITECTURE untitled;

