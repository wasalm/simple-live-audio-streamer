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
include tests/CMakeFiles/scgi-responder.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/scgi-responder.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/scgi-responder.dir/flags.make

tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.o: tests/CMakeFiles/scgi-responder.dir/flags.make
tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.o: ../tests/scgi-responder.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.o"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/scgi-responder.dir/scgi-responder.c.o   -c /Users/andries/Downloads/lighttpd-1.4.55/tests/scgi-responder.c

tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/scgi-responder.dir/scgi-responder.c.i"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andries/Downloads/lighttpd-1.4.55/tests/scgi-responder.c > CMakeFiles/scgi-responder.dir/scgi-responder.c.i

tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/scgi-responder.dir/scgi-responder.c.s"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andries/Downloads/lighttpd-1.4.55/tests/scgi-responder.c -o CMakeFiles/scgi-responder.dir/scgi-responder.c.s

# Object files for target scgi-responder
scgi__responder_OBJECTS = \
"CMakeFiles/scgi-responder.dir/scgi-responder.c.o"

# External object files for target scgi-responder
scgi__responder_EXTERNAL_OBJECTS =

tests/scgi-responder: tests/CMakeFiles/scgi-responder.dir/scgi-responder.c.o
tests/scgi-responder: tests/CMakeFiles/scgi-responder.dir/build.make
tests/scgi-responder: tests/CMakeFiles/scgi-responder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andries/Downloads/lighttpd-1.4.55/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable scgi-responder"
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scgi-responder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/scgi-responder.dir/build: tests/scgi-responder

.PHONY : tests/CMakeFiles/scgi-responder.dir/build

tests/CMakeFiles/scgi-responder.dir/clean:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/scgi-responder.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/scgi-responder.dir/clean

tests/CMakeFiles/scgi-responder.dir/depend:
	cd /Users/andries/Downloads/lighttpd-1.4.55/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andries/Downloads/lighttpd-1.4.55 /Users/andries/Downloads/lighttpd-1.4.55/tests /Users/andries/Downloads/lighttpd-1.4.55/build /Users/andries/Downloads/lighttpd-1.4.55/build/tests /Users/andries/Downloads/lighttpd-1.4.55/build/tests/CMakeFiles/scgi-responder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/scgi-responder.dir/depend
