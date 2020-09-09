vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO apache/avro
    REF release-1.10.0
    SHA512 f27afc82671a87c76b024a8f161f5353c25dd83c40683bce62fe5ac99e434a4d8a24265bf653b428c45747e6847a360fee0ce5489b04e4a3762a8364f0155782
    HEAD_REF master
    PATCHES
        install.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    INVERTED_FEATURES
    snappy     CMAKE_DISABLE_FIND_PACKAGE_Snappy
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/lang/c++
    PREFER_NINJA
    DISABLE_PARALLEL_CONFIGURE
    OPTIONS
        -DBUILD_TESTING=OFF
        ${FEATURE_OPTIONS}
    OPTIONS_DEBUG
        -DAVRO_ADD_PROTECTOR_FLAGS=1
)

vcpkg_install_cmake(ADD_BIN_TO_PATH)

# Tool to generate avro serialization files
set(tool avrogencpp)
set(suffix ${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/bin/${tool}${suffix}")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()
if(EXISTS "${CURRENT_PACKAGES_DIR}/bin/${tool}${suffix}")
    file(COPY "${CURRENT_PACKAGES_DIR}/bin/${tool}${suffix}"
         DESTINATION "${CURRENT_PACKAGES_DIR}/tools/${PORT}")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin")
endif()

vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/${PORT})

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(INSTALL ${SOURCE_PATH}/lang/c++/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
