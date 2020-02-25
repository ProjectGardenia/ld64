INCLUDES = -Isrc/ -Isrc/abstraction -Isrc/ld -Isrc/ld/code-sign-blobs -Isrc/ld/parsers -Isrc/ld/parsers/libunwind -Isrc/ld/passes -I$$HOME/Gardenia/include
CXXFLAGS = -std=c++11 -stdlib=libc++ 

all:
	make src_other
	make src_ld_code-sign-blobs
	make src_ld_parsers
	make src_ld

src_other:
	clang $(CXXFLAGS) $(SYSROOT) src/other/dyldinfo.cpp -c -o dyldinfo.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/machochecker.cpp -c -o machochecker.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/objcimageinfo.cpp -c -o objcimageinfo.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/ObjectDump.cpp -c -o ObjectDump.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/PruneTrie.cpp -c -o PruneTrie.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/rebase.cpp -c -o rebase.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/other/unwinddump.cpp -c -o unwinddump.o $(INCLUDES)

src_ld_code-sign-blobs:
	clang $(CXXFLAGS) $(SYSROOT) src/ld/code-sign-blobs/blob.cpp -c -o blob.o $(INCLUDES)

src_ld_parsers:
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/archive_file.cpp -c -o archive_file.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/lto_file.cpp -c -o lto_file.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/macho_dylib_file.cpp -c -o macho_dylib_file.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/macho_relocatable_file.cpp -c -o macho_relocatable_file.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/opaque_section_file.cpp -c -o opaque_section_file.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/parsers/textstub_dylib_file.cpp -c -o textstub_dylib_file.o $(INCLUDES)

src_ld:
	clang src/ld/debugline.c -c -o debugline.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/InputFiles.cpp -c -o InputFiles.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/ld.cpp -c -o ld.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/Options.cpp -c -o Options.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/OutputFile.cpp -c -o OutputFile.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/Resolver.cpp -c -o Resolver.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/Snapshot.cpp -c -o Snapshot.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/SymbolTable.cpp -c -o SymbolTable.o $(INCLUDES)