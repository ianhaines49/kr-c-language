# ==== CONFIG ====
CC := clang
CFLAGS := -Wall -Wextra -pedantic -fsanitize=address,undefined -g

SRC := $(wildcard src/*.c)
OBJ := $(SRC:.c=.o)
TARGET := main

# ==== BUILD RULES ====
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# ==== CLEAN ====
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean

