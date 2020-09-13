vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    # fork of (current HEAD master) with cmake and latest avro support
    REF 41e6a2b335df3d41c990337704d2f2c4a4a6957b
    SHA512 940ddcc123bef8324beee9793d0f90b673c257bde44a66b7fd9b5ca51cbecbb5c938ea85b22ba9b80867b3788e493f5720436605464f3f53919a19398089daee
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
