# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/VoltageOS/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16
git clone --depth=1 https://github.com/PunisherxD/device_motorola_liber -b VoltageOS device/motorola/liber
git clone --depth=1 https://github.com/menorziin/vendor_motorola_liber -b lineage-20 vendor/motorola/liber
git clone --depth=1 https://github.com/menorziin/kernel_motorola_liber -b lineage-20 kernel/motorola/liber
git clone --depth=1 https://github.com/sm6150-liber/android_packages_apps_MotoActions -b lineage-20.0 packages/apps/MotoActions

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device liber --lunch liber-userdebug
./barom.sh -b -j 8 -u gof --timer 95m -- m dudu

# end
