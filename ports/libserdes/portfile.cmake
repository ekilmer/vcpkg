vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ekilmer/libserdes
    REF v5.5.1
    SHA512 d240f5c4c19d8d13bf7c52f1a776a0f64f2f40b0d0f5d9fdc6f476f82c391cdc224607577c375d532a1f600c5897e5ea9624d7cca0ea8d518c3f54e8444d3654
    HEAD_REF master
)

if (VCPKG_TARGET_IS_WINDOWS)
else() # Build in UNIX
  vcpkg_execute_required_process(
    COMMAND ./configure --prefix=${CURRENT_PACKAGES_DIR} --enable-static
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME configure-${TARGET_TRIPLET}
  )

  vcpkg_execute_required_process(
    COMMAND make -j ${VCPKG_CONCURRENCY} install
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME install-${TARGET_TRIPLET}
  )
endif()

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/libserdes/copyright COPYONLY)
