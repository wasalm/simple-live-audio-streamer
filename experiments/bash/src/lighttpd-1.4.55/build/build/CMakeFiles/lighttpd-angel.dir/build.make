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
CMAKE_SOURCE_DIR = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build"

# Include any dependencies generated for this target.
include build/CMakeFiles/lighttpd-angel.dir/depend.make

# Include the progress variables for this target.
include build/CMakeFiles/lighttpd-angel.dir/progress.make

# Include the compile flags for this target's objects.
include build/CMakeFiles/lighttpd-angel.dir/flags.make

build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o: build/CMakeFiles/lighttpd-angel.dir/flags.make
build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o: ../src/lighttpd-angel.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/lighttpd-angel.c"

build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/lighttpd-angel.c" > CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.i

build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/lighttpd-angel.c" -o CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.s

# Object files for target lighttpd-angel
lighttpd__angel_OBJECTS = \
"CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o"

# External object files for target lighttpd-angel
lighttpd__angel_EXTERNAL_OBJECTS =

build/lighttpd-angel: build/CMakeFiles/lighttpd-angel.dir/lighttpd-angel.c.o
build/lighttpd-angel: build/CMakeFiles/lighttpd-angel.dir/build.make
build/lighttpd-angel: build/CMakeFiles/lighttpd-angel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lighttpd-angel"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lighttpd-angel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
build/CMakeFiles/lighttpd-angel.dir/build: build/lighttpd-angel

.PHONY : build/CMakeFiles/lighttpd-angel.dir/build

build/CMakeFiles/lighttpd-angel.dir/clean:
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && $(CMAKE_COMMAND) -P CMakeFiles/lighttpd-angel.dir/cmake_clean.cmake
.PHONY : build/CMakeFiles/lighttpd-angel.dir/clean

build/CMakeFiles/lighttpd-angel.dir/depend:
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build/CMakeFiles/lighttpd-angel.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : build/CMakeFiles/lighttpd-angel.dir/depend

