vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO AprilRobotics/apriltag
    REF "${VERSION}"
    SHA512 0  # This is a temporary value. We will modify this value in the next section.
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "apriltag")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")