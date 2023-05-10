V:=@
.ONESHELL:
.SHELLFLAGS=-ec
.PHONY: all clean check check2

CC=gcc
CFLAGS=-g -fno-short-enums -O2 -Os -fdata-sections -ffunction-sections -Wall -fno-exceptions 
CFLAGS+= -ggdb -Wall
DEPS= 
DEBUG=1
TARGET	= main
BLD_TMPDIR:= .
HEADERS 	= $(wildcard *.h)
SRC 		= $(wildcard *.c)
OBJS 		= $(SRC:.c=.o)

dis-obj			= $(TARGET).dis
size-obj		= $(TARGET).size 
bin-obj			= $(TARGET).bin
bin-map         = $(TARGET).map
target_all      = $(TARGET)

ifeq ($(OS), Windows_NT)
   $(info "Platform = Windows_NT")
else 
  ifeq ($(shell uname), Darwin)
	$(info "Platform = Darwin")
    target_all += $(dis-obj) $(size-obj) $(bin-obj) $(bin-map)  
  else
   $(info "Platform = Unix/Linux")
    target_all += $(dis-obj) $(size-obj) $(bin-obj) $(bin-map)  
  endif 
endif 

all:$(target_all) 

%.o:%.c
	$(CC) $(CFLAGS) -o $@ -c $< 

$(TARGET) : $(OBJS)
	$(CC) -g -o $@ -Wl,-Map,$(TARGET).map  $^

$(dis-obj):$(TARGET)
	objdump -D -S -l $< > $@

$(size-obj):$(TARGET)
	size --format=berkeley $< > $@

$(bin-obj):$(TARGET)
	objcopy -v -S -g -O binary $< $@   
   
clean:
	rm -rf *.o *.map *.dis *.size $(TARGET).bin $(target_all)


run:
	./$(TARGET)

check:
	valgrind --leak-check=yes --xtree-leak=yes ./$(TARGET)
	@echo "valgrind check done"

check2:
	drmemory -- ./$(TARGET)
	@echo "drmemory check done"

x=10
y=12
#VAR_NAME='0'
compare:
	@if [ $x -eq $y ]; then \
      echo "EQUAL"; \
     else \
     echo "Not EQUAL"; \
     fi
	@echo "compare done"