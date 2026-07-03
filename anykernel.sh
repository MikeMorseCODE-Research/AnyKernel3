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
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=0;

. tools/ak3-core.sh;
split_boot;
flash_boot;
