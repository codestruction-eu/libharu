cd zlib-1.2.8-build
cmake -G "NMake Makefiles" "..\zlib-1.2.8" -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=ON
nmake
copy zconf.h "..\zlib-1.2.8"
cd ..

cd lpng1621-build
cmake -G "NMake Makefiles" "..\lpng1621" -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=ON -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY="..\zlib-1.2.8-build\zlib.lib"
nmake
copy pnglibconf.h "..\lpng1621"
cd ..

cd libharu-build
cmake -G "NMake Makefiles" "..\libharu-RELEASE_2_3_0" -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DLIBHPDF_EXAMPLES=ON -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY="..\..\zlib-1.2.8-build\zlib.lib" -DPNG_PNG_INCLUDE_DIR="..\lpng1621" -DPNG_LIBRARY="..\..\lpng1621-build\libpng16_static.lib"
nmake
cd ..
