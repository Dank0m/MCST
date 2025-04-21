SHELL = powershell
SHELLFLAGS = -NoProfile -Command

# Автоматически найти все .v-файлы, если не указано вручную
verilog_files ?= $$(Get-ChildItem -Recurse -Filter *.v | ForEach-Object { $$_.FullName })

# Проверка, что файлы существуют
ifeq ($(verilog_files),)
$(error No Verilog files found! Specify manually: make run verilog_files="file1.v file2.v")
endif

.PHONY: run clean
run:
	iverilog.exe $(verilog_files)
	vvp.exe .\a.out
	gtkwave.exe .\dump.vcd

clean:
	Remove-Item -Force a.out, dump.vcd -ErrorAction SilentlyContinue