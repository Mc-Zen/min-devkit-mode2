# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

set(target min.project)
c74_add_project(${target} SOURCES ${target}.cpp)
c74_add_auto_unit_test(${target})


if (APPLE)
    find_library(CARBON_LIBRARY "Carbon")
    target_link_libraries(${target} PUBLIC ${CARBON_LIBRARY})
#    target_link_libraries(${target} "-framework ${CARBON_LIBRARY}")
endif ()
