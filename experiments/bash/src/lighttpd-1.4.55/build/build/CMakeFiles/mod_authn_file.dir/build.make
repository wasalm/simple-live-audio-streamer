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
include build/CMakeFiles/mod_authn_file.dir/depend.make

# Include the progress variables for this target.
include build/CMakeFiles/mod_authn_file.dir/progress.make

# Include the compile flags for this target's objects.
include build/CMakeFiles/mod_authn_file.dir/flags.make

build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o: build/CMakeFiles/mod_authn_file.dir/flags.make
build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o: ../src/mod_authn_file.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/src/mod_authn_file.c

build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mod_authn_file.dir/mod_authn_file.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/src/mod_authn_file.c > CMakeFiles/mod_authn_file.dir/mod_authn_file.c.i

build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mod_authn_file.dir/mod_authn_file.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/src/mod_authn_file.c -o CMakeFiles/mod_authn_file.dir/mod_authn_file.c.s

# Object files for target mod_authn_file
mod_authn_file_OBJECTS = \
"CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o"

# External object files for target mod_authn_file
mod_authn_file_EXTERNAL_OBJECTS =

build/libmod_authn_file.a: build/CMakeFiles/mod_authn_file.dir/mod_authn_file.c.o
build/libmod_authn_file.a: build/CMakeFiles/mod_authn_file.dir/build.make
build/libmod_authn_file.a: build/CMakeFiles/mod_authn_file.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libmod_authn_file.a"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && $(CMAKE_COMMAND) -P CMakeFiles/mod_authn_file.dir/cmake_clean_target.cmake
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mod_authn_file.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
build/CMakeFiles/mod_authn_file.dir/build: build/libmod_authn_file.a

.PHONY : build/CMakeFiles/mod_authn_file.dir/build

build/CMakeFiles/mod_authn_file.dir/clean:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/build && $(CMAKE_COMMAND) -P CMakeFiles/mod_authn_file.dir/cmake_clean.cmake
.PHONY : build/CMakeFiles/mod_authn_file.dir/clean

build/CMakeFiles/mod_authn_file.dir/depend:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andries/Downloads/lighttpd-1.4.55 /Users/andries/Downloads/lighttpd-1.4.55/src /Users/andries/Downloads/lighttpd-1.4.55/build /Users/andries/Downloads/lighttpd-1.4.55/build/build /Users/andries/Downloads/lighttpd-1.4.55/build/build/CMakeFiles/mod_authn_file.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : build/CMakeFiles/mod_authn_file.dir/depend

