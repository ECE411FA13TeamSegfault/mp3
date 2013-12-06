--
-- VHDL Architecture ece411.delay_unit3.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 00:23:07 11/01/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delay_unit3 IS
   PORT( 
      test      : IN     STD_LOGIC;
      preLoadPC : OUT    STD_LOGIC
   );

-- Declarations

END delay_unit3 ;

--
ARCHITECTURE untitled OF delay_unit3 IS
BEGIN
  ----------------------
  delayreg : PROCESS (test)
  ----------------------
  variable temp : std_logic;
  BEGIN
    temp := not test;
    
    preLoadPC <= temp after 10 ns;
  END PROCESS delayreg;
END ARCHITECTURE untitled;

