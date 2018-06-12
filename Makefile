CC ?= gcc
CFLAGS += -std=c99
LDFLAGS +=

ifeq ($(DEBUG),1)
	CFLAGS += -g -O0
endif

.PHONY: clean

ALL: init

SOURCE = \
	src/main.c \
	src/parser.c

OBJS = $(SOURCE:.c=.o)

*.o: *.c
	$(CC) $(CFLAGS) $< -o $@

init: $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

clean:
	rm -rf init $(OBJS)
