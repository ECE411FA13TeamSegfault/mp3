-- VHDL Entity ece411.Buffer_Controller.interface
--
-- Created:
--          by - chao16.ews (gelib-057-18.ews.illinois.edu)
--          at - 07:46:06 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Buffer_Controller IS
   PORT( 
      InWriteBack : IN     std_logic;
      PMRESP_H    : IN     std_logic;
      RESET_L     : IN     std_logic;
      clk         : IN     std_logic;
      PMWRITE_L   : OUT    std_logic
   );

-- Declarations

END Buffer_Controller ;

--
-- VHDL Architecture ece411.Buffer_Controller.fsm
--
-- Created:
--          by - chao16.ews (gelib-057-18.ews.illinois.edu)
--          at - 07:46:06 12/06/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Buffer_Controller IS

   TYPE STATE_TYPE IS (
      Idle,
      WriteBack
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= Idle;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      InWriteBack,
      PMRESP_H,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN Idle => 
            IF (InWriteBack = '1') THEN 
               next_state <= WriteBack;
            ELSE
               next_state <= Idle;
            END IF;
         WHEN WriteBack => 
            IF (PMRESP_H = '1') THEN 
               next_state <= Idle;
            ELSE
               next_state <= WriteBack;
            END IF;
         WHEN OTHERS =>
            next_state <= Idle;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      PMWRITE_L <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN WriteBack => 
            PMWRITE_L <= '0';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
