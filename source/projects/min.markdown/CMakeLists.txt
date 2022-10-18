# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

if (WIN32)
	add_definitions(
		-D_CRT_SECURE_NO_WARNINGS
	)
endif ()

set(target min.markdown)
c74_add_project(${target} 
	SOURCES 
		${target}.cpp
		"hoedown/src/autolink.c"
		"hoedown/src/buffer.c"
		"hoedown/src/document.c"
		"hoedown/src/escape.c"
		"hoedown/src/html.c"
		"hoedown/src/html_blocks.c"
		"hoedown/src/html_smartypants.c"
		"hoedown/src/stack.c"
		"hoedown/src/version.c"
)

target_include_directories(${target} PUBLIC "hoedown/src")


c74_add_auto_unit_test(${target})
