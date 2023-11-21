# Makefile

# ディレクトリ
SRCDIR = ./src
BINDIR = ./bin

# ファイル
TESTBENCH = nand_tb
DESIGN = nand

# コンパイラ
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave

# ソースファイル
TESTBENCH_SRC = $(SRCDIR)/tests/$(TESTBENCH).v
DESIGN_SRC = $(SRCDIR)/$(DESIGN).v

# ターゲット
TARGET = $(BINDIR)/a.out
WAVEFORM_FILE = wave.vcd

# デフォルトターゲット
.PHONY: all
all: simulate #view_waveform

# シミュレーションと波形の表示
.PHONY: simulate #view_waveform
simulate: $(TARGET)
	$(VVP) $(TARGET)

view_waveform: $(WAVEFORM_FILE)
	$(GTKWAVE) $(WAVEFORM_FILE)

# テストベンチのコンパイル
$(TARGET): $(TESTBENCH_SRC) $(DESIGN_SRC) #| $(BINDIR)
	$(IVERILOG) -o $(TARGET) $(TESTBENCH_SRC) $(DESIGN_SRC)

# TODO
# バイナリディレクトリを作成
$(BINDIR):
	mkdir $(BINDIR)

# クリーンアップ
.PHONY: clean
clean:
	rm -rf $(BINDIR)/*.out $(WAVEFORM_FILE)
