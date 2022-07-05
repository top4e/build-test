SDK_VERSION=4.3.1
FW_VERSION=37_00_XX3-B001
PLUGIN_VERSION=0.3.1.372114

COMPILER_PATH = C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\arm_gcc493\bin

CC = $(COMPILER_PATH)/arm-none-eabi-gcc
CPP = $(COMPILER_PATH)/arm-none-eabi-g++

CPPFLAGS += -Os -Wno-cast-qual -Wno-write-strings -fdiagnostics-show-option

PROJECT_DIR = .

OBJS = $(patsubst %.c,%.o,$(wildcard $(PROJECT_DIR)/src/*.c))

all: test


test: $(OBJS)
	$(CC) $(OBJS) -o test

clean:
	rm -f $(OBJS) test
