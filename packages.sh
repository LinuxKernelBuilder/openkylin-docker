wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.4.tar.xz
tar -xvf linux-6.5.4.tar.xz
cd linux-6.5.4
cp -v /boot/config-$(uname -r) .config
scripts/config --disable DEBUG_INFO_X86
scripts/config --disable DEBUG_INFO_VMCORE
scripts/config --disable DEBUG_INFO_SPLIT
scripts/config --disable DEBUG_INFO_BTF_MODULES
scripts/config --disable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
scripts/config --disable DEBUG_INFO_PERF
scripts/config --disable DEBUG_INFO_BTF
scripts/config --disable DEBUG_INFO_DWARF4
scripts/config --disable DEBUG_INFO_REDUCED
scripts/config --set-str SYSTEM_TRUSTED_KEYS "" 
scripts/config --set-str SYSTEM_REVOCATION_KEYS "" 
scripts/config --undefine DEBUG_INFO 
scripts/config --undefine DEBUG_INFO_COMPRESSED 
scripts/config --undefine DEBUG_INFO_REDUCED 
scripts/config --undefine DEBUG_INFO_SPLIT 
scripts/config --undefine GDB_SCRIPTS 
scripts/config --set-val DEBUG_INFO_DWARF5 n 
scripts/config --set-val DEBUG_INFO_NONE y 
CPU_CORES=$(($(grep -c processor < /proc/cpuinfo)*2))
sudo make bindeb-pkg -j"$CPU_CORES"
cd ..
ls -al
mv ./*.deb root/
