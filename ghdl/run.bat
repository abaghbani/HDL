"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -s counter.vhd
"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -s counter_tb.vhd
"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -a counter.vhd
"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -a counter_tb.vhd
"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -e counter_tb
"C:\Program Files (x86)\Eda\ghdl\bin\ghdl" -r counter_tb --vcd=counter.vcd --stop-time=500ns

"C:\Program Files (x86)\Eda\gtkwave\bin\gtkwave" counter.vcd
