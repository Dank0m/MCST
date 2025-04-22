# Автоматически найти все .v-файлы, если не указано вручную
verilog_files ?= $(shell find . -name "*.v")

# Проверка, что файлы существуют
ifeq ($(verilog_files),)
$(error No Verilog files found! Specify manually: make run verilog_files="file1.v file2.v")
endif

.PHONY: run clean
run:
	iverilog $(verilog_files) -o a.out
	vvp a.out
	gtkwave dump.vcd

clean:
	rm -f a.out dump.vcd
