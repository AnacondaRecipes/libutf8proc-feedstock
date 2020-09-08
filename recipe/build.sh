#!/bin/bash

export CMAKE_GENERATOR="Unix Makefiles"

mkdir build
cd build

export BUILD_TYPE="Release"

cmake ${CMAKE_ARGS} .. -G "${CMAKE_GENERATOR}" \
  -DBUILD_SHARED_LIBS=ON \
  -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}"

cmake --build . --config "${BUILD_TYPE}" --target install
