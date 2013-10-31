--
-- VHDL Architecture ece411.delay_unit2.untitled
--
-- Created:
--          by - chng2.ews (linux-a1.ews.illinois.edu)
--          at - 01:16:00 10/31/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY delay_unit2 IS
   PORT( 
      test : IN     STD_LOGIC;
      Load : OUT    std_logic
   );

-- Declarations

END delay_unit2 ;

--
ARCHITECTURE untitled OF delay_unit2 IS
BEGIN
  ----------------------
  delayreg : PROCESS (test)
  ----------------------
  variable temp : std_logic;
  BEGIN
    temp := not test;
    
    Load <= temp after 10 ns;
  END PROCESS delayreg;
END ARCHITECTURE untitled;

