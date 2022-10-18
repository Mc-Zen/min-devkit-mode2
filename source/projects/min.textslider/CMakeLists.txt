# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

set(MSVC_COMPILER_NAME "MSVC")
if (${CMAKE_CXX_COMPILER_ID} STREQUAL ${MSVC_COMPILER_NAME})
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 0 4 MSVC_VERSION_SHORT)
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 0 2 MSVC_VERSION_MAJOR)
	string (SUBSTRING ${CMAKE_CXX_COMPILER_VERSION} 3 1 MSVC_VERSION_MINOR)

	if (${MSVC_VERSION_MAJOR} VERSION_LESS 19 OR ${MSVC_VERSION_MAJOR} MATCHES 19 AND ${MSVC_VERSION_MINOR} VERSION_LESS 1)
   		# message(STATUS "Visual Studio ${MSVC_VERSION_SHORT} detected. Visual Studio 17 (19.1) or greater is required for UI objects.")
 		message(STATUS "Visual Studio 17 or greater is required for UI objects.")
  		message(STATUS "SKIPPING!")
  		return ()
	endif ()
endif ()

set(target min.textslider)
c74_add_project(${target} SOURCES ${target}.cpp)
c74_add_auto_unit_test(${target})
