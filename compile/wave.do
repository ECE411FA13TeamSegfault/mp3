onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/aStage_IF/clk
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/aStage_IF/IF_PCout
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(7) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(6) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(5) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(4) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(3) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(2) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(1) -radix hexadecimal} {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(0) -radix hexadecimal}} -expand -subitemconfig {/mp2_cpu/theDatapath/aStage_ID/U_0/RAM(7) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(6) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(5) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(4) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(3) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(2) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(1) {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM(0) {-height 16 -radix hexadecimal}} /mp2_cpu/theDatapath/aStage_ID/U_0/RAM
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/theDatapath/CONTROL.ex -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.mem -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.wb -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.name -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.LoadPC -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.PCMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.DRMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.StoreMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.ADDR1Muxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.ADDR2Muxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.ALUMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.ALUop -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.MARMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.MDRMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.Read_H -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.Write_H -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.GenCCMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.LoadNZP -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.RFMux2sel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.RFMuxsel -radix hexadecimal} {/mp2_cpu/theDatapath/CONTROL.RegWrite -radix hexadecimal}} -subitemconfig {/mp2_cpu/theDatapath/CONTROL.ex {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.mem {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.wb {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.name {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.LoadPC {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.PCMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.DRMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.StoreMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.ADDR1Muxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.ADDR2Muxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.ALUMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.ALUop {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.MARMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.MDRMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.Read_H {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.Write_H {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.GenCCMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.LoadNZP {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.RFMux2sel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.RFMuxsel {-height 16 -radix hexadecimal} /mp2_cpu/theDatapath/CONTROL.RegWrite {-height 16 -radix hexadecimal}} /mp2_cpu/theDatapath/CONTROL
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/aStage_IF/IF_IRout
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_DATAIN
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_MRESP_H
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_ADDRESS
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_DATAOUT
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_MREAD_L
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_MWRITEH_L
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/D_MWRITEL_L
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/I_ADDRESS
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/I_DATAIN
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/I_MRESP_H
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/I_MREAD_L
add wave -noupdate /mp2_cpu/DRAM/ICache/PMREAD_L
add wave -noupdate /mp2_cpu/DRAM/PDRAM/I_PMREAD_L
add wave -noupdate /mp2_cpu/DRAM/PDRAM/I_PMRESP_H
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/Start_H
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/preLoadPC2
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/Load
add wave -noupdate -radix hexadecimal /mp2_cpu/theDatapath/LoadPC
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_DP/F3
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_DP/F5
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_DP/AccessMem
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_DP/F1
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_DP/InWaitHit
add wave -noupdate /mp2_cpu/DRAM/ICache/Miss
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/DCache/Cache_Control/current_state
add wave -noupdate -radix hexadecimal /mp2_cpu/DRAM/ICache/Cache_Control/current_state
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(7) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(6) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(5) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(4) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(3) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(2) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(1) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(0) -radix hexadecimal}} -expand -subitemconfig {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(7) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(6) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(5) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(4) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(3) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(2) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(1) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data(0) {-height 16 -radix hexadecimal}} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray0/Data
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(7) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(6) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(5) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(4) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(3) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(2) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(1) -radix hexadecimal} {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(0) -radix hexadecimal}} -expand -subitemconfig {/mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(7) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(6) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(5) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(4) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(3) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(2) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(1) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data(0) {-height 16 -radix hexadecimal}} /mp2_cpu/DRAM/DCache/Cache_DP/DataArray1/Data
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(7) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(6) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(5) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(4) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(3) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(2) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(1) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(0) -radix hexadecimal}} -expand -subitemconfig {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(7) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(6) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(5) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(4) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(3) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(2) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(1) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data(0) {-height 16 -radix hexadecimal}} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray0/Data
add wave -noupdate -radix hexadecimal -childformat {{/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(7) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(6) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(5) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(4) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(3) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(2) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(1) -radix hexadecimal} {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(0) -radix hexadecimal}} -expand -subitemconfig {/mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(7) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(6) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(5) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(4) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(3) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(2) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(1) {-height 16 -radix hexadecimal} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data(0) {-height 16 -radix hexadecimal}} /mp2_cpu/DRAM/ICache/Cache_DP/DataArray1/Data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {163 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 334
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1440 ns}
