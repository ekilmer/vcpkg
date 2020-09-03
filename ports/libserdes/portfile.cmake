vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    # fork of (current HEAD master) with cmake and latest avro support
    REF 517f4f79e613910f3aaebc56322b650273e2c6f9
    SHA512 4964c7bab5cf957dae6dac7e1697a8d706b9f028e213ce5d3351c57960699b0e31bcf6acaa451254cf5d0cf4a6ec61146b60136167820044d2e5517f4d5efbdb
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
