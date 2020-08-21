vcpkg_buildpath_length_warning(37)
vcpkg_fail_port_install(ON_TARGET "uwp")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO apache/avro
  REF release-1.10.0
  SHA512 f27afc82671a87c76b024a8f161f5353c25dd83c40683bce62fe5ac99e434a4d8a24265bf653b428c45747e6847a360fee0ce5489b04e4a3762a8364f0155782
  HEAD_REF master
  PATCHES
        snappy-cmake-fix.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/lang/c
    PREFER_NINJA
    OPTIONS
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(INSTALL ${SOURCE_PATH}/lang/c/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
