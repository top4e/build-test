SDK_VERSION=4.3.1
FW_VERSION=37_00_XX3-B001
PLUGIN_VERSION=0.3.1.372114

COMPILER_PATH = C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\arm_gcc493\bin

CC = $(COMPILER_PATH)/arm-none-eabi-gcc
CPP = $(COMPILER_PATH)/arm-none-eabi-g++
LD = $(COMPILER_PATH)/arm-none-eabi-ld
CPPFLAGS += -Os -Wno-cast-qual -Wno-write-strings -fdiagnostics-show-option
LDFLAGS  = --defsym __ROM=0x40000000
LDFLAGS += --defsym __HEAP_PUB_SIZE=0x40000
LDFLAGS += --defsym __HEAPSIZE=0x1A00
LDFLAGS += --defsym HEAP_MIN=0xD000
LDFLAGS += --defsym __PAGE_SIZE=0x1000
LDFLAGS += -T "C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.plugin.me910g1_me310g1_ml865g1_37_00_XX3-B001_0.3.1.372114\lib\temp\linkGCC.ld"
LDFLAGS += --entry=_txm_module_thread_shell_entry -O0 -A Cortex-A7 --cref --oformat=elf32-littlearm

POST_LD = --library-path="C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\plugins\com.telit.appzonec.plugin.me910g1_me310g1_ml865g1_37_00_XX3-B001_0.3.1.372114\lib\temp" -nostdlib -nodefaultlibs  --start-group --library=:_telit_4G_ME310.ar --library=:appMng.ar --library=:ati.ar --library=:atp.ar --library=:backup.ar --library=:crypto.ar --library=:fota.ar --library=:fs.ar --library=:ftpc.ar --library=:fwautosim.ar --library=:gnss.ar --library=:gpio.ar --library=:hwTmr.ar --library=:i2c.ar --library=:info.ar --library=:ini.ar --library=:lwm2m.ar --library=:mqtt.ar --library=:mqttsn.ar --library=:net.ar --library=:ntp.ar --library=:pdp.ar --library=:power.ar --library=:rtc.ar --library=:rtos.ar --library=:secure_ms.ar --library=:sim.ar --library=:sms.ar --library=:socket.ar --library=:spi.ar --library=:ssl.ar --library=:sys.ar --library=:trace.ar --library=:uart.ar --library=:usb.ar --library=:wDog.ar   --end-group  -L "C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\arm_gcc493\lib\gcc\arm-none-eabi\4.9.3" -L "C:\buildtools\Telit\IoT_AppZone_IDE\eclipse\\plugins\com.telit.appzonec.toolchain.plugin.gccARMv6_493_4.9.3\arm_gcc493\arm-none-eabi\lib"   -lc -lm -lnosys -lgcc --gc-sections --no-keep-memory  -Map=m2mapz.map

PROJECT_DIR = .

OBJS = $(patsubst %.c,%.o,$(wildcard $(PROJECT_DIR)/src/*.c))

all: test


test: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) $(POST_LD) -o test.ax

clean:
	rm -f $(OBJS) test
