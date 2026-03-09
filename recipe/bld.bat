set "CMAKE_GENERATOR=NMake Makefiles"

mkdir build
cd build

set BUILD_TYPE="Release"

cmake .. -G "%CMAKE_GENERATOR%" ^
  -DBUILD_SHARED_LIBS=ON ^
  -DCMAKE_BUILD_TYPE="%BUILD_TYPE%" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DUTF8PROC_ENABLE_TESTING=ON
if errorlevel 1 exit \b 1

cmake --build . --config %BUILD_TYPE% --target install
if errorlevel 1 exit \b 1

ctest --output-on-failure
if errorlevel 1 exit \b 1