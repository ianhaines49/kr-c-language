# ---------- CONFIGURABLE VARIABLES ----------
CC      := clang                                   # or gcc
CFLAGS  := -Wall -Wextra -pedantic                # basic warnings
CFLAGS  += -fsanitize=address,undefined -g        # runtime checks + debug info
TARGET  := main                                    # final executable name

# Every .c file in src/ becomes an object in build/
SRC     := $(wildcard src/*.c)
OBJ     := $(patsubst src/%.c, build/%.o, $(SRC))

# ---------- DEFAULT TARGET ----------
# The first target is the default when you just run `make`
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

# Pattern rule: how to build a single .o from a .c
build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

# Make sure the build/ directory exists before compiling objects
build:
	mkdir -p $@

# ---------- CONVENIENCE TARGETS ----------
.PHONY: clean test

clean:              # run `make clean` to delete artifacts
	rm -rf build $(TARGET)

test: $(TARGET)     # `make test` will run your executable on sample input
	./$(TARGET) < tests/sample.in

# ---------- END ----------

