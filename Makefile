CC ?= gcc
CFLAGS += -std=c99 -Wall -D_DEFAULT_SOURCE
LDFLAGS +=

TESTS_CFLAGS += $(CFLAGS) "-Isrc/"

ifeq ($(DEBUG),1)
	CFLAGS += -g -O0
endif

.PHONY: clean

ALL: init

SOURCE = \
	src/inittab.c \
	src/lexer.c \
	src/log.c \
	src/main.c \
	src/mainloop.c \
	src/mount.c \
	src/watchdog.c

OBJS = $(SOURCE:.c=.o)

*.o: *.c
	$(CC) $(CFLAGS) $< -o $@

init: $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

clean:
	rm -rf init $(OBJS) $(TESTS)

TESTS = parser_test

parser_test: src/lexer.o src/log.o tests/parser_test.c
	$(CC) $(TESTS_CFLAGS) $^ -o $@ $(LDFLAGS)

tests: $(TESTS)

.PHONY:
format-code:
	clang-format -i -style=file src/*.c src/*.h
