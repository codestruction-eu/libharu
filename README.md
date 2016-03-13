libharu nuget wrapper

install:
- windows sdk
- compiler update sp1
- cmake


download https://codeload.github.com/libharu/libharu/zip/RELEASE_2_3_0 (or https://github.com/libharu/libharu/archive/RELEASE_2_3_0.zip) into C:\Users\temp\Desktop\libharu\libharu
mkdir C:\Users\temp\Desktop\libharu\libharu-build

download zlib128.zip from http://www.zlib.net (http://zlib.net/zlib128.zip) and unzip
or http://zlib.net/zlib128-dll.zip ?
# download and unzip zlib123.zip source and zlib123dll.zip binaries from http://www.winimage.com/zLibDll
download and unzip libpng source code lpng1621 from http://www.libpng.org/pub/png/libpng.html
mkdir C:\Users\temp\Desktop\libharu\lpng1621-build
# download and unzip libpng Developer files libpng-1.2.37-lib.zip from http://gnuwin32.sourceforge.net/packages/libpng.htm

open windows sdk command prompt
cd C:\Users\temp\Desktop\libharu\lpng1621-build
cmake -G "NMake Makefiles" ..\lpng1621 -DCMAKE_BUILD_TYPE=Release -DPNG_SHARED=OFF -DCMAKE_COLOR_MAKEFILE=ON -DZLIB_INCLUDE_DIR=C:\Users\temp\Desktop\libharu\zlib128-dll\include -DZLIB_LIBRARY=C:\Users\temp\Desktop\libharu\zlib128-dll\lib\zdll.lib
nmake

cd C:\Users\temp\Desktop\libharu\libharu-build
cmake -G "NMake Makefiles" ..\libharu -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_COLOR_MAKEFILE=ON -DLIBHPDF_EXAMPLES=ON -DZLIB_INCLUDE_DIR=C:\Users\temp\Desktop\libharu\zlib128-dll\include -DZLIB_LIBRARY=C:\Users\temp\Desktop\libharu\zlib128-dll\lib\zdll.lib -DPNG_LIBRARY=C:\Users\temp\Desktop\libharu\lpng1621-build\libpng16.lib -DPNG_PNG_INCLUDE_DIR=C:\Users\temp\Desktop\libharu\lpng1621
nmake
