rem setenv /Release /x86 /vista

cd zlib-1.2.8-build
cmake -G "NMake Makefiles" "..\zlib-1.2.8" -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=ON
nmake
copy zconf.h "..\zlib-1.2.8"
cd ..

cd lpng1621-build
copy ..\zlib-1.2.8-build\zlibstatic.lib .
cmake -G "NMake Makefiles" "..\lpng1621" -DCMAKE_BUILD_TYPE=Release -DPNG_STATIC=ON -DPNG_SHARED=ON -DCMAKE_COLOR_MAKEFILE=ON -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY=".\zlibstatic.lib"
nmake
nmake test
copy pnglibconf.h "..\lpng1621"
cd ..

cd libharu-build
cmake -G "NMake Makefiles" "..\libharu" -DCMAKE_BUILD_TYPE=Release -DLIBHPDF_STATIC=ON -DLIBHPDF_SHARED=ON -DLIBHPDF_EXAMPLES=ON -DCMAKE_COLOR_MAKEFILE=ON -DCMAKE_VERBOSE_MAKEFILE=OFF -DZLIB_INCLUDE_DIR="..\zlib-1.2.8" -DZLIB_LIBRARY="..\..\zlib-1.2.8-build\zlibstatic.lib" -DPNG_PNG_INCLUDE_DIR="..\lpng1621" -DPNG_LIBRARY="..\..\lpng1621-build\libpng16_static.lib"
nmake
copy src\libhpdf.dll ..
copy src\libhpdfs.lib ..

cd demo
copy ..\src\libhpdf.dll .
mkdir images
xcopy ..\..\libharu\demo\images images /S /E
mkdir mbtext
xcopy ..\..\libharu\demo\mbtext mbtext /S /E
mkdir pngsuite
xcopy ..\..\libharu\demo\pngsuite pngsuite /S /E
mkdir rawimage
xcopy ..\..\libharu\demo\rawimage rawimage /S /E
mkdir ttfont
xcopy ..\..\libharu\demo\ttfont ttfont /S /E
mkdir type1
xcopy ..\..\libharu\demo\type1 type1 /S /E
arc_demo
character_map
chfont_demo
encoding_list
encryption
ext_gstate_demo
font_demo
grid_sheet
image_demo
jpeg_demo
jpfont_demo
line_demo
link_annotation
make_rawimage
outline_demo
permission
png_demo
raw_image_demo
slide_show_demo
text_annotation
text_demo
text_demo2
ttfont_demo
ttfont_demo_jp
cd ..\..
