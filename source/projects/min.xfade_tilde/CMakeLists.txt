# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

set(target min.xfade_tilde)
c74_add_project(${target} 
	SOURCES 
		${target}.cpp
		../shared/signal_routing_objects.h
		../shared/signal_routing_objects.cpp
)
c74_add_auto_unit_test(${target})
