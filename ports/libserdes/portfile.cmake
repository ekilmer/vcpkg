vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    # fork of (current HEAD master) with cmake and latest avro support
    REF 2e4737243b9ba464a77b7858821337d07c435b77
    SHA512 bcff63e1afdb9c770509e08a163373c562feddf936c2030ded848b35380a447bb6555395970ee40f53c70812f5485dd81603ff63657887a888e7c3c803615c40
    HEAD_REF dev
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/libserdes/copyright COPYONLY)
