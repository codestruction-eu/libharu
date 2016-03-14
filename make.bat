rem setenv /Release /x86 /vista

cd zlib-1.2.8-build
cmake -G "NMake Makefiles" "..\zlib-1.2.8" -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=ON
nmake
copy zconf.h "..\zlib-1.2.8"
copy zlib.dll "..\lpng1621-build"
cd ..

cd lpng1621-build
cmake -G "NMake Makefiles" "..\lpng1621" -DCMAKE_BUILD_TYPE=Release -DPNG_STATIC=OFF -DCMAKE_COLOR_MAKEFILE=ON -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY="..\zlib-1.2.8-build\zlib.dll"
nmake
nmake test
copy pnglibconf.h "..\lpng1621"
cd ..

cd libharu-build
cmake -G "NMake Makefiles" "..\libharu-RELEASE_2_3_0" -DCMAKE_BUILD_TYPE=Release -DLIBHPDF_STATIC=OFF -DLIBHPDF_EXAMPLES=ON -DCMAKE_COLOR_MAKEFILE=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY="..\..\zlib-1.2.8-build\zlib.dll" -DPNG_PNG_INCLUDE_DIR="..\lpng1621" -DPNG_LIBRARY="..\..\lpng1621-build\libpng16.dll"
nmake
copy ..\zlib-1.2.8-build\zlib.dll src
copy ..\lpng1621-build\libpng16.dll src
cd src
..\demo\arc_demo.exe
..\demo\character_map.exe
..\demo\chfont_demo.exe
..\demo\encoding_list.exe
..\demo\encryption.exe
..\demo\ext_gstate_demo.exe
..\demo\font_demo.exe
..\demo\grid_sheet.exe
..\demo\image_demo.exe
..\demo\jpeg_demo.exe
..\demo\jpfont_demo.exe
..\demo\line_demo.exe
..\demo\link_annotation.exe
..\demo\make_rawimage.exe
..\demo\outline_demo.exe
..\demo\permission.exe
..\demo\png_demo.exe
..\demo\raw_image_demo.exe
..\demo\slide_show_demo.exe
..\demo\text_annotation.exe
..\demo\text_demo.exe
..\demo\text_demo2.exe
..\demo\ttfont_demo.exe
..\demo\ttfont_demo_jp.exe
cd ..\..
