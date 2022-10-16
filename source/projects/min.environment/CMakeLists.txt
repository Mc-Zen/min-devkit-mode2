# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

set(target min.environment)

if (APPLE)
	c74_add_project(${target} SOURCES min.environment.mac.cpp)


    find_library(CARBON_LIBRARY "Carbon")
    target_link_libraries(${target} PUBLIC ${CARBON_LIBRARY})

	find_library(IOKIT_LIBRARY "IOKit")
	target_link_libraries(${target} PUBLIC ${IOKIT_LIBRARY})
else ()
	c74_add_project(${target} SOURCES min.environment.windows.cpp)


	set(IPHLPAPI_LIBRARY IPHLPAPI.lib)
	target_link_libraries(${target} PUBLIC ${IPHLPAPI_LIBRARY})
endif ()

c74_add_auto_unit_test(${target})

