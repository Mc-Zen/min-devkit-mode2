# Copyright 2018 The Min-API Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

include("${CMAKE_CURRENT_LIST_DIR}/c74_set_target_xcode_warning_flags.cmake")


# This command creates a "min target" with all needed configuration to build a max external. 
# It creates a new project as well as a libary target both with the specified name. The target
# is automatically linked against the max-sdk-base and the min-api. 
# The list of sources which is passed will be added to the target. The OUTPUT_DIRECTORY specifies
# the location where the compiled library will be put. 
#
# Call example: 
# c74_add_min_target(mytarget SOURCES main.cpp asd.cpp OUTPUT_DIRECTORY ../externals)

function(c74_add_min_target target)
	set(oneValueArgs OUTPUT_DIRECTORY)
	set(multiValueArgs SOURCES)
	cmake_parse_arguments(PARSE_ARGV 0 PARAMS "${options}" "${oneValueArgs}" "${multiValueArgs}")
    
	if (PARAMS_OUTPUT_DIRECTORY)
		set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PARAMS_OUTPUT_DIRECTORY}")
		set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
		set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
	endif () 

	add_definitions(-DC74_MIN_API)
	
	get_property(MAX_SDK_BASE_DIR GLOBAL PROPERTY C74_MAX_SDK_BASE_DIR)


	add_max_target(${target} SOURCES ${PARAMS_SOURCES}) # no quotes!
	target_link_libraries(${target} PRIVATE min-api)
    
	# setting the module linker flags does not work for unknown reasons
	# so we do it manually. 
	if (APPLE)
		file (STRINGS "${MAX_SDK_BASE_DIR}/script/max-linker-flags.txt" C74_SYM_MAX_LINKER_FLAGS)
		#set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${C74_SYM_MAX_LINKER_FLAGS}")
		#get_target_property(LF ${target} LINK_FLAGS)
		#message(WARNING "Flags ${LF}")
		set_target_properties(${target} PROPERTIES APPEND LINK_FLAGS ${C74_SYM_MAX_LINKER_FLAGS})
		#get_target_property(LF ${target} LINK_FLAGS)
		#message(WARNING "Flags ${LF}")
    endif ()
    c74_set_target_xcode_warning_flags(${target})

endfunction()
