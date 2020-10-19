vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lifting-bits/remill
    REF v3.0.8
    SHA512 cdad67905b33ba52f76221206bb4705e1376e078725be2f4efc3f5b02894278b66d08783f8858d567fea4773cd2f2eb5770068f33e4d9119e43231b206e3eb01
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DCMAKE_DEBUG_POSTFIX=d
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
