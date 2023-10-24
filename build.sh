#  sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs -g default,-mips,-darwin,-notdefault
#git clone https://github.com/DESTROYER-32/local_manifest --depth 1 -b rising .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
curl -Lo barom.sh https://raw.githubusercontent.com/alanndz/barom/main/barom.sh
chmod +x barom.sh
./barom.sh -t ${TG_CHAT_ID} ${TG_TOKEN}
./barom.sh --ccache-dir "${WORKDIR}/ccache" --ccache-size 20G
./barom.sh --device dubai --lunch lineage_dubai-userdebug
./barom.sh -b -j4 -j 4 -n lineageOS -u "gof sf fio" --timer 95m -- brunch lineage_dubai-userdebug

# end
