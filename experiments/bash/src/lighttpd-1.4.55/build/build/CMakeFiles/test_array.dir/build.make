# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andries/Downloads/lighttpd-1.4.55

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andries/Downloads/lighttpd-1.4.55/build

# Include any dependencies generated for this target.
include build/CMakeFiles/test_array.dir/depend.make

# Include the progress variables for this target.
include build/CMakeFiles/test_array.dir/progress.make

# Include the compile flags for this target's objects.
include build/CMakeFiles/test_array.dir/flags.make

build/CMakeFiles/test_array.dir/t/test_array.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/t/test_array.c.o: ../src/t/test_array.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object build/CMakeFiles/test_array.dir/t/test_array.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/t/test_array.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/t/test_array.c

build/CMakeFiles/test_array.dir/t/test_array.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/t/test_array.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/t/test_array.c > CMakeFiles/test_array.dir/t/test_array.c.i

build/CMakeFiles/test_array.dir/t/test_array.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/t/test_array.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/t/test_array.c -o CMakeFiles/test_array.dir/t/test_array.c.s

build/CMakeFiles/test_array.dir/array.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/array.c.o: ../src/array.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object build/CMakeFiles/test_array.dir/array.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/array.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/array.c

build/CMakeFiles/test_array.dir/array.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/array.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/array.c > CMakeFiles/test_array.dir/array.c.i

build/CMakeFiles/test_array.dir/array.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/array.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/array.c -o CMakeFiles/test_array.dir/array.c.s

build/CMakeFiles/test_array.dir/data_array.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/data_array.c.o: ../src/data_array.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object build/CMakeFiles/test_array.dir/data_array.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/data_array.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/data_array.c

build/CMakeFiles/test_array.dir/data_array.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/data_array.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/data_array.c > CMakeFiles/test_array.dir/data_array.c.i

build/CMakeFiles/test_array.dir/data_array.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/data_array.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/data_array.c -o CMakeFiles/test_array.dir/data_array.c.s

build/CMakeFiles/test_array.dir/data_integer.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/data_integer.c.o: ../src/data_integer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object build/CMakeFiles/test_array.dir/data_integer.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/data_integer.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/data_integer.c

build/CMakeFiles/test_array.dir/data_integer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/data_integer.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/data_integer.c > CMakeFiles/test_array.dir/data_integer.c.i

build/CMakeFiles/test_array.dir/data_integer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/data_integer.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/data_integer.c -o CMakeFiles/test_array.dir/data_integer.c.s

build/CMakeFiles/test_array.dir/data_string.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/data_string.c.o: ../src/data_string.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object build/CMakeFiles/test_array.dir/data_string.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/data_string.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/data_string.c

build/CMakeFiles/test_array.dir/data_string.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/data_string.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/data_string.c > CMakeFiles/test_array.dir/data_string.c.i

build/CMakeFiles/test_array.dir/data_string.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/data_string.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/data_string.c -o CMakeFiles/test_array.dir/data_string.c.s

build/CMakeFiles/test_array.dir/buffer.c.o: build/CMakeFiles/test_array.dir/flags.make
build/CMakeFiles/test_array.dir/buffer.c.o: ../src/buffer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object build/CMakeFiles/test_array.dir/buffer.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_array.dir/buffer.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/buffer.c

build/CMakeFiles/test_array.dir/buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_array.dir/buffer.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/buffer.c > CMakeFiles/test_array.dir/buffer.c.i

build/CMakeFiles/test_array.dir/buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_array.dir/buffer.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/buffer.c -o CMakeFiles/test_array.dir/buffer.c.s

# Object files for target test_array
test_array_OBJECTS = \
"CMakeFiles/test_array.dir/t/test_array.c.o" \
"CMakeFiles/test_array.dir/array.c.o" \
"CMakeFiles/test_array.dir/data_array.c.o" \
"CMakeFiles/test_array.dir/data_integer.c.o" \
"CMakeFiles/test_array.dir/data_string.c.o" \
"CMakeFiles/test_array.dir/buffer.c.o"

# External object files for target test_array
test_array_EXTERNAL_OBJECTS =

build/test_array: build/CMakeFiles/test_array.dir/t/test_array.c.o
build/test_array: build/CMakeFiles/test_array.dir/array.c.o
build/test_array: build/CMakeFiles/test_array.dir/data_array.c.o
build/test_array: build/CMakeFiles/test_array.dir/data_integer.c.o
build/test_array: build/CMakeFiles/test_array.dir/data_string.c.o
build/test_array: build/CMakeFiles/test_array.dir/buffer.c.o
build/test_array: build/CMakeFiles/test_array.dir/build.make
build/test_array: build/CMakeFiles/test_array.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C executable test_array"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_array.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
build/CMakeFiles/test_array.dir/build: build/test_array

.PHONY : build/CMakeFiles/test_array.dir/build

build/CMakeFiles/test_array.dir/clean:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && $(CMAKE_COMMAND) -P CMakeFiles/test_array.dir/cmake_clean.cmake
.PHONY : build/CMakeFiles/test_array.dir/clean

build/CMakeFiles/test_array.dir/depend:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andries/Downloads/lighttpd-1.4.55 /Users/andries/Downloads/lighttpd-1.4.55/src /Users/andries/Downloads/lighttpd-1.4.55/build /Users/andries/Downloads/lighttpd-1.4.55/build/build /Users/andries/Downloads/lighttpd-1.4.55/build/build/CMakeFiles/test_array.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : build/CMakeFiles/test_array.dir/depend
