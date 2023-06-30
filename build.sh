# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/ProjectBlaze/manifest.git -b 13 -g default,-mips,-darwin,-notdefault
git clone https://github.com/DESTROYER3264/local_manifest --depth 1 -b cr .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device liber --lunch blaze_liber-userdebug
./barom.sh -b -j 8 -n ProjectBlaze -u "gof sf fio" --timer 95m -- brunch liber

# end
