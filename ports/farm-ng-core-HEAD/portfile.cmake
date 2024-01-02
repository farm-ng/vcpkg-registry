set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO farm-ng/farm-ng-core
    HEAD_REF cmake-spelunking
)

# TODO: Should be able to clean this up
set(VCPKG_C_FLAGS "${VCPKG_C_FLAGS}")
set(VCPKG_CXX_FLAGS "-fconcepts ${VCPKG_CXX_FLAGS}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        "-DBUILD_SOPHUS_TESTS=Off" 
        "-DFARM_NG_PROVIDER_DEV_PACKAGES=Sophus"
        "-DCMAKE_CXX_STANDARD=17" # TODO: Should be able to remove
        "-DCMAKE_CXX_EXTENSIONS=On" # TODO: Should be able to remove
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "farm-ng-core")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

# TODO: Re-enable
# configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)