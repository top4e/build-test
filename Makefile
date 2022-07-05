SDK_VERSION=4.3.1
FW_VERSION=37_00_XX3-B001
PLUGIN_VERSION=0.3.1.372114

COMPILER_PATH = C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\arm_gcc493\bin

CC = $(COMPILER_PATH)/arm-none-eabi-gcc
CPP = $(COMPILER_PATH)/arm-none-eabi-g++
LD = 
CPPFLAGS += -Os -Wno-cast-qual -Wno-write-strings -fdiagnostics-show-option
LDFLAGS  = --defsym __ROM=0x40000000
LDFLAGS += --defsym __HEAP_PUB_SIZE=0x40000
LDFLAGS += --defsym __HEAPSIZE=0x1A00
LDFLAGS += --defsym HEAP_MIN=0xD000
LDFLAGS += --defsym __PAGE_SIZE=0x1000
LDFLAGS += -T "C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\lib/temp/linkGCC.ld"
LDFLAGS += --entry=_txm_module_thread_shell_entry -O0 -A Cortex-A7 --cref --oformat=elf32-littlearm

PROJECT_DIR = .

OBJS = $(patsubst %.c,%.o,$(wildcard $(PROJECT_DIR)/src/*.c))

all: test


test: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -lc -lm -lnosys -lgcc --gc-sections --no-keep-memory  -Map=test.ma -o test.ax

clean:
	rm -f $(OBJS) test
