# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

set(target min.note.make)
c74_add_project(${target} SOURCES ${target}.cpp)
c74_add_auto_unit_test(${target})
