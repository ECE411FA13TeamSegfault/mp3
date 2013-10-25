--
-- VHDL Architecture ece411.OffsetDecode.untitled
--
-- Created:
--          by - chao16.ews (siebl-0218-06.ews.illinois.edu)
--          at - 05:16:53 09/27/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteOffsetDecode IS
   PORT( 
      Offset : IN     LC3B_C_OFFSET;
      clk    : IN     std_logic;
      ASel   : OUT    std_logic;
      BSel   : OUT    std_logic;
      CSel   : OUT    std_logic;
      DSel   : OUT    std_logic;
      ESel   : OUT    std_logic;
      FSel   : OUT    std_logic;
      GSel   : OUT    std_logic;
      HSel   : OUT    std_logic
   );

-- Declarations

END WriteOffsetDecode ;

--
ARCHITECTURE untitled OF WriteOffsetDecode IS
BEGIN
  PROCESS (Offset)
    variable y   : std_logic_vector(7 downto 0);
    variable sel : std_logic_vector(2 downto 0);
  BEGIN
    sel := Offset(3) & Offset(2) & Offset(1);
    case sel is
      when "000" =>
        y := "00000001";
      when "001" =>
        y := "00000010";
      when "010" =>
        y := "00000100";
      when "011" =>
        y := "00001000";
      when "100" =>
        y := "00010000";
      when "101" =>
        y := "00100000";
      when "110" =>
        y := "01000000";
      when "111" =>
        y := "10000000";
      when others =>
        y := (OTHERS => 'X');
    end case;
    ASel <= y(0) after delay_decode3;
    BSel <= y(1) after delay_decode3;
    CSel <= y(2) after delay_decode3;
    DSel <= y(3) after delay_decode3;
    ESel <= y(4) after delay_decode3;
    FSel <= y(5) after delay_decode3;
    GSel <= y(6) after delay_decode3;
    HSel <= y(7) after delay_decode3;
  END PROCESS;
END ARCHITECTURE untitled;

