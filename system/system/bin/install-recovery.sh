#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:34649388:aeac37dce6c0b5b51b020b3a5c9c9161da7ab82f; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22345000:8f00e4197812e5e1020f875c3c04ebce098e1a34 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:34649388:aeac37dce6c0b5b51b020b3a5c9c9161da7ab82f && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
