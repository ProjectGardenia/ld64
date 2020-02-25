INCLUDES = -Isrc/ -Isrc/abstraction -Isrc/ld -Isrc/ld/code-sign-blobs -Isrc/ld/parsers -Isrc/ld/parsers/libunwind -Isrc/ld/passes -I$$HOME/Gardenia/include
CXXFLAGS = -std=c++11 -stdlib=libc++ 

all:
	make src_ld_code-sign-blobs
	make src_ld_parsers
	make src_ld
	make src_ld_passes_stubs
	make src_ld_passes

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

src_ld_passes_stubs:
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/stubs/stubs.cpp -c -o stubs.o $(INCLUDES)

src_ld_passes:
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/branch_island.cpp -c -o branch_island.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/got.cpp -c -o got.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/huge.cpp -c -o huge.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/order.cpp -c -o order.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/objc.cpp -c -o objc.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/dylibs.cpp -c -o dylibs.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/tlvp.cpp -c -o tlvp.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/branch_shim.cpp -c -o branch_shim.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/bitcode_bundle.cpp -c -o bitcode_bundle.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/dtrace_dof.cpp -c -o dtrace_dof.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/compact_unwind.cpp -c -o compact_unwind.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/code_dedup.cpp -c -o code_dedup.o $(INCLUDES)
	clang $(CXXFLAGS) $(SYSROOT) src/ld/passes/thread_starts.cpp -c -o thread_starts.o $(INCLUDES)

ld_link:
	gcc $(CXXFLAGS) *.o -o ld -ltapi -lstdc++ -L$$HOME/Gardenia/lib