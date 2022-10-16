# Copyright 2018 The Min-DevKit Authors. All rights reserved.
# Use of this source code is governed by the MIT License found in the License.md file.

cmake_minimum_required(VERSION 3.0)

set(target min.buffer.index_tilde)
c74_add_project(${target} SOURCES ${target}.cpp)
c74_add_auto_unit_test(${target})