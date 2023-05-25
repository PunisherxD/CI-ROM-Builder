#  sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/VoltageOS/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
git clone https://github.com/DESTROYER3264/local_manifest --depth 1 -b vos .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device liber --lunch liber-userdebug
./barom.sh -b -j 8 -u "gof sf" --timer 95m -- m dudu

# end
