vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    # fork of (current HEAD master) with cmake and latest avro support
    REF 77cde4f80ed6119df73ec3d2ab035e09a1eb1a10
    SHA512 fef1971740383a3ba2c77acb8fa9054981a789777e07fcb24a8a570d21baf038e8176105b286691c7e46e86dab6c29681df02acf0c447ba791678e8e847d5b1a
    HEAD_REF dev
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(
    CONFIG_PATH lib/cmake/Serdes
    TARGET_PATH share/Serdes
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/libserdes/copyright COPYONLY)
