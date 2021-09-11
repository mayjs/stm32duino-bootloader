#!/bin/sh

OPENOCD="$(which openocd)"
OPENOCD_SCRIPTS="$(dirname $OPENOCD)/../share/openocd/scripts"
BLBIN="./bootloader_only_binaries/generic_boot20_pa1_fastboot.bin"

echo "OpenOCD scripts:" $OPENOCD_SCRIPTS

#openocd -f $OPENOCD_SCRIPTS/interface/stlink.cfg -f $OPENOCD_SCRIPTS/target/stm32f1x.cfg -c "init" -c "reset halt" -c "stm32f1x unlock 0" -c "reset halt" -c "exit"
openocd -c "set CPUTAPID 0x2ba01477" -f $OPENOCD_SCRIPTS/interface/stlink.cfg -f $OPENOCD_SCRIPTS/target/stm32f1x.cfg -c "program $BLBIN verify exit 0x08000000"
#openocd -f $OPENOCD_SCRIPTS/interface/stlink.cfg -f $OPENOCD_SCRIPTS/target/stm32f1x.cfg -c "flash read_bank 0 flash-bank0.bin"
#openocd -f $OPENOCD_SCRIPTS/interface/stlink.cfg -f ./flash/stm32.cfg -c "program $BLBIN verify exit 0x08000000"
