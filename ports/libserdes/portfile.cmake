vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO confluentinc/libserdes
    REF a50fed317403fdef64b95c061614a5148597f401 # v6.1.0-betaxxxxxx (current HEAD master)
    SHA512 d19e924a57f56a63f926f668704f903b4867c150add61f57a5657accbe8a60aad6d3632f7ed571d41049f3ab34d0e1e3228916c322a8678413f363ace2c9fd23
    HEAD_REF master
    PATCHES
          support-latest-avro.patch
)

set(LDFLAGS "-L${CURRENT_INSTALLED_DIR}/lib")
set(CFLAGS "-I${CURRENT_INSTALLED_DIR}/include")
set(CPPFLAGS "-I${CURRENT_INSTALLED_DIR}/include")

if (VCPKG_TARGET_IS_WINDOWS)
else() # Build in UNIX
    set(ENV{PKG_CONFIG_PATH} "${CURRENT_INSTALLED_DIR}/lib/pkgconfig")
  vcpkg_execute_required_process(
    COMMAND ./configure --prefix=${CURRENT_PACKAGES_DIR} "--CFLAGS=${CFLAGS}" "--CPPFLAGS=${CPPFLAGS}" "--LDFLAGS=${LDFLAGS}"
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME configure-${TARGET_TRIPLET}
  )

  vcpkg_execute_required_process(
    COMMAND make -j ${VCPKG_CONCURRENCY} libs
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME build-${TARGET_TRIPLET}
  )

  vcpkg_execute_required_process(
    COMMAND make install
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME install-${TARGET_TRIPLET}
  )
endif()

configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/libserdes/copyright COPYONLY)
