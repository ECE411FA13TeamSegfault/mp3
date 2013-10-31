onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath/clk
add wave -noupdate /datapath/Load
add wave -noupdate /datapath/aStage_IF/IF_PCout
add wave -noupdate /datapath/aStage_IF/IF_PCPlus2out
add wave -noupdate /datapath/aREG_IF_ID/IF_IR
add wave -noupdate /datapath/aREG_IF_ID/I_MRESP_H
add wave -noupdate /datapath/aStage_IF/PCMuxout
add wave -noupdate /datapath/aREG_IF_ID/I_DATAIN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4193 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {4060 ns} {5060 ns}
