# AnyKernel3 config for Nothing 3a Pro (asteroids / SM7635)
properties() { '
kernel.string=KernelSU-Next + SuSFS Kernel for Nothing 3a Pro
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
do.ramdisk=0
device.name1=asteroids
device.name2=Asteroids
device.name3=AsteroidsProEEA
device.name4=Nothing3aPro
device.name5=A059P
supported.versions=
supported.patchlevels=
'; }
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=0;

# update-binary runs `ash anykernel.sh` as a standalone script — it does
# NOT auto-invoke the boot patch based on the properties block alone.
# NOTE: dump_boot/write_boot are NOT used here — both unconditionally
# call unpack_ramdisk/repack_ramdisk, which hard-abort with "No ramdisk
# found to unpack" on this device, since boot's RAMDISK_SZ is genuinely 0.
# split_boot + flash_boot is the correct minimal idiom for a kernel-only
# replace with no ramdisk/dtb changes.
. tools/ak3-core.sh;
split_boot;
flash_boot;
