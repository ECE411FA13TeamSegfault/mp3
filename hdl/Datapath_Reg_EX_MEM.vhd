--
-- VHDL Architecture ece411.Datapath.Reg_EX_MEM
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 19:01:41 10/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ADDR1Muxsel : IN     std_logic;
      ADDR2Muxsel : IN     LC3b_4mux_sel;
      ALUMuxsel   : IN     LC3b_4mux_sel;
      ALUop       : IN     LC3b_aluop;
      DATAIN      : IN     LC3b_word;
      DRMuxsel    : IN     std_logic;
      GenCCMuxsel : IN     std_logic;
      LoadIR      : IN     std_logic;
      LoadMAR     : IN     std_logic;
      LoadMDR     : IN     std_logic;
      LoadNZP     : IN     std_logic;
      LoadPC      : IN     std_logic;
      MARMuxsel   : IN     LC3b_4mux_sel;
      MDRMuxsel   : IN     LC3b_4mux_sel;
      PCMuxSel    : IN     LC3b_4mux_sel;
      RESET_L     : IN     std_logic;
      RFMux2sel   : IN     LC3b_4mux_sel;
      RFMuxsel    : IN     LC3b_4mux_sel;
      RegWrite    : IN     std_logic;
      StoreMuxsel : IN     std_logic;
      clk         : IN     std_logic;
      CheckN      : OUT    std_logic;
      CheckP      : OUT    std_logic;
      CheckZ      : OUT    std_logic;
      DATAOUT     : OUT    LC3b_word;
      n           : OUT    std_logic;
      p           : OUT    std_logic;
      z           : OUT    std_logic
   );

-- Declarations

END Datapath ;

--
ARCHITECTURE Reg_EX_MEM OF Datapath IS
BEGIN
END ARCHITECTURE Reg_EX_MEM;

