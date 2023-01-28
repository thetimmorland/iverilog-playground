TEST_BENCHES := $(wildcard *_tb.v)
DUMP_FILES := $(TEST_BENCHES:%.v=%.fst)

all: $(DUMP_FILES)

%.fst: %.vvp
	@echo -- Simulating $^
	vvp $^ -fst

%_tb.vvp: %_tb.v
	@echo -- Building $^
	iverilog -y. -o $@ $^
