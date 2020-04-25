#please try C:/Program Files (x86)/CodeBlocks/MinGW/bin
#pleae  try C:/mingw-w64/mingw64/bin
#CC:=C:/cygwin/bin/gcc
CC:=C:/mingw-w64/mingw64/bin/gcc
#CC:=C:/Strawberry/c/bin/gcc
#CC:="C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-gcc.exe"
#READ_ELF:=C:/cygwin/bin/readelf
READ_ELF:=C:/mingw-w64/mingw64/bin/readelf
#READ_ELF:=C:/Strawberry/c/bin/readelf

#READ_ELF:="C:/Program Files (x86)/GNU Tools ARM Embedded/7 2017-q4-major/bin/arm-none-eabi-readelf.exe"

empty :=
space := $(empty) $(empty)
machine-y = ppc
machine-$(CONFIG_PPC64) += 64
machine-$(CONFIG_CPU_LITTLE_ENDIAN) += le
UTS_MACHINE := $(subst $(space),,$(machine-y))
UTS_MACHINE_SPACE := $(machine-y)
$(info UTS_MACHINE_SPACE=$(UTS_MACHINE_SPACE))
$(info UTS_MACHINE=$(UTS_MACHINE))

src:=main.c 
obj_wrong:=$(subst .c, .o,$(src))
obj	     :=$(subst .c,.o,$(src)) 

$(info src:=$(src))
$(info obj_wrong:=$(obj_wrong)) 
$(info obj:=$(obj))


all: main_sections main_normal

main_sections:
	$(CC) -ffunction-sections -fdata-sections -c $(src)
	$(CC) -Wl,--gc-sections -o $@ $(obj) 
    #$(READ_ELF) -a $@ | grep fun_  >$@.elf.fun
	
main_normal:
	$(CC) -c $(src)
	$(CC) -o $@ $(obj) 
	#$(READ_ELF) -a $@ | grep fun_  >$@.elf.fun

clean:
	rm -rf *.o main_sections main_normal *.elf.fun 
	
.PHONY=all clean 