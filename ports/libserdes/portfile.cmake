vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    # fork of (current HEAD master) with cmake and latest avro support
    REF f257574b256cbbdd12a2a6d7862379ebc2193b83
    SHA512 253ea72d7efb43cce0bc8a462933716c01149b26ab9f9e7ecfef5be5c1aaf81eb7e61586bf10faf6fdffb9b78fee2a7a67949a2a4a8881186da26a31c61279c4
    HEAD_REF dev
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/libserdes/copyright COPYONLY)
