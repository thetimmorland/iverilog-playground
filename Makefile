SRC := $(wildcard *.v)
TEST_BENCHES := $(wildcard *_tb.v)
DUMP_FILES := $(TEST_BENCHES:%.v=%.fst)

all: $(DUMP_FILES)

%.fst: %.vvp $(SRC)
	@echo -- Simulating $<
	vvp $< -fst

%_tb.vvp: %_tb.v $(SRC)
	@echo -- Building $<
	iverilog -y. -o $@ $<
