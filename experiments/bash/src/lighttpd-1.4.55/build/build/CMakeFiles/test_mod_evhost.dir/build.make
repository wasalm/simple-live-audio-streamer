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
include build/CMakeFiles/test_mod_evhost.dir/depend.make

# Include the progress variables for this target.
include build/CMakeFiles/test_mod_evhost.dir/progress.make

# Include the compile flags for this target's objects.
include build/CMakeFiles/test_mod_evhost.dir/flags.make

build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o: ../src/t/test_mod_evhost.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/t/test_mod_evhost.c"

build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/t/test_mod_evhost.c" > CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.i

build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/t/test_mod_evhost.c" -o CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.s

build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o: ../src/configfile-glue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/configfile-glue.c"

build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/configfile-glue.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/configfile-glue.c" > CMakeFiles/test_mod_evhost.dir/configfile-glue.c.i

build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/configfile-glue.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/configfile-glue.c" -o CMakeFiles/test_mod_evhost.dir/configfile-glue.c.s

build/CMakeFiles/test_mod_evhost.dir/buffer.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/buffer.c.o: ../src/buffer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object build/CMakeFiles/test_mod_evhost.dir/buffer.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/buffer.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/buffer.c"

build/CMakeFiles/test_mod_evhost.dir/buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/buffer.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/buffer.c" > CMakeFiles/test_mod_evhost.dir/buffer.c.i

build/CMakeFiles/test_mod_evhost.dir/buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/buffer.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/buffer.c" -o CMakeFiles/test_mod_evhost.dir/buffer.c.s

build/CMakeFiles/test_mod_evhost.dir/array.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/array.c.o: ../src/array.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object build/CMakeFiles/test_mod_evhost.dir/array.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/array.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/array.c"

build/CMakeFiles/test_mod_evhost.dir/array.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/array.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/array.c" > CMakeFiles/test_mod_evhost.dir/array.c.i

build/CMakeFiles/test_mod_evhost.dir/array.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/array.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/array.c" -o CMakeFiles/test_mod_evhost.dir/array.c.s

build/CMakeFiles/test_mod_evhost.dir/data_config.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/data_config.c.o: ../src/data_config.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object build/CMakeFiles/test_mod_evhost.dir/data_config.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/data_config.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_config.c"

build/CMakeFiles/test_mod_evhost.dir/data_config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/data_config.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_config.c" > CMakeFiles/test_mod_evhost.dir/data_config.c.i

build/CMakeFiles/test_mod_evhost.dir/data_config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/data_config.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_config.c" -o CMakeFiles/test_mod_evhost.dir/data_config.c.s

build/CMakeFiles/test_mod_evhost.dir/data_integer.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/data_integer.c.o: ../src/data_integer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object build/CMakeFiles/test_mod_evhost.dir/data_integer.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/data_integer.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_integer.c"

build/CMakeFiles/test_mod_evhost.dir/data_integer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/data_integer.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_integer.c" > CMakeFiles/test_mod_evhost.dir/data_integer.c.i

build/CMakeFiles/test_mod_evhost.dir/data_integer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/data_integer.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_integer.c" -o CMakeFiles/test_mod_evhost.dir/data_integer.c.s

build/CMakeFiles/test_mod_evhost.dir/data_string.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/data_string.c.o: ../src/data_string.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object build/CMakeFiles/test_mod_evhost.dir/data_string.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/data_string.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_string.c"

build/CMakeFiles/test_mod_evhost.dir/data_string.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/data_string.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_string.c" > CMakeFiles/test_mod_evhost.dir/data_string.c.i

build/CMakeFiles/test_mod_evhost.dir/data_string.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/data_string.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/data_string.c" -o CMakeFiles/test_mod_evhost.dir/data_string.c.s

build/CMakeFiles/test_mod_evhost.dir/http_header.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/http_header.c.o: ../src/http_header.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building C object build/CMakeFiles/test_mod_evhost.dir/http_header.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/http_header.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_header.c"

build/CMakeFiles/test_mod_evhost.dir/http_header.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/http_header.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_header.c" > CMakeFiles/test_mod_evhost.dir/http_header.c.i

build/CMakeFiles/test_mod_evhost.dir/http_header.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/http_header.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_header.c" -o CMakeFiles/test_mod_evhost.dir/http_header.c.s

build/CMakeFiles/test_mod_evhost.dir/http_kv.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/http_kv.c.o: ../src/http_kv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building C object build/CMakeFiles/test_mod_evhost.dir/http_kv.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/http_kv.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_kv.c"

build/CMakeFiles/test_mod_evhost.dir/http_kv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/http_kv.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_kv.c" > CMakeFiles/test_mod_evhost.dir/http_kv.c.i

build/CMakeFiles/test_mod_evhost.dir/http_kv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/http_kv.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/http_kv.c" -o CMakeFiles/test_mod_evhost.dir/http_kv.c.s

build/CMakeFiles/test_mod_evhost.dir/vector.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/vector.c.o: ../src/vector.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Building C object build/CMakeFiles/test_mod_evhost.dir/vector.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/vector.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/vector.c"

build/CMakeFiles/test_mod_evhost.dir/vector.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/vector.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/vector.c" > CMakeFiles/test_mod_evhost.dir/vector.c.i

build/CMakeFiles/test_mod_evhost.dir/vector.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/vector.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/vector.c" -o CMakeFiles/test_mod_evhost.dir/vector.c.s

build/CMakeFiles/test_mod_evhost.dir/log.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/log.c.o: ../src/log.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_11) "Building C object build/CMakeFiles/test_mod_evhost.dir/log.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/log.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/log.c"

build/CMakeFiles/test_mod_evhost.dir/log.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/log.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/log.c" > CMakeFiles/test_mod_evhost.dir/log.c.i

build/CMakeFiles/test_mod_evhost.dir/log.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/log.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/log.c" -o CMakeFiles/test_mod_evhost.dir/log.c.s

build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.o: build/CMakeFiles/test_mod_evhost.dir/flags.make
build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.o: ../src/sock_addr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_12) "Building C object build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.o"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_mod_evhost.dir/sock_addr.c.o   -c "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/sock_addr.c"

build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_mod_evhost.dir/sock_addr.c.i"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/sock_addr.c" > CMakeFiles/test_mod_evhost.dir/sock_addr.c.i

build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_mod_evhost.dir/sock_addr.c.s"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src/sock_addr.c" -o CMakeFiles/test_mod_evhost.dir/sock_addr.c.s

# Object files for target test_mod_evhost
test_mod_evhost_OBJECTS = \
"CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o" \
"CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o" \
"CMakeFiles/test_mod_evhost.dir/buffer.c.o" \
"CMakeFiles/test_mod_evhost.dir/array.c.o" \
"CMakeFiles/test_mod_evhost.dir/data_config.c.o" \
"CMakeFiles/test_mod_evhost.dir/data_integer.c.o" \
"CMakeFiles/test_mod_evhost.dir/data_string.c.o" \
"CMakeFiles/test_mod_evhost.dir/http_header.c.o" \
"CMakeFiles/test_mod_evhost.dir/http_kv.c.o" \
"CMakeFiles/test_mod_evhost.dir/vector.c.o" \
"CMakeFiles/test_mod_evhost.dir/log.c.o" \
"CMakeFiles/test_mod_evhost.dir/sock_addr.c.o"

# External object files for target test_mod_evhost
test_mod_evhost_EXTERNAL_OBJECTS =

build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/t/test_mod_evhost.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/configfile-glue.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/buffer.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/array.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/data_config.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/data_integer.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/data_string.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/http_header.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/http_kv.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/vector.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/log.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/sock_addr.c.o
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/build.make
build/test_mod_evhost: build/CMakeFiles/test_mod_evhost.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_13) "Linking C executable test_mod_evhost"
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_mod_evhost.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
build/CMakeFiles/test_mod_evhost.dir/build: build/test_mod_evhost

.PHONY : build/CMakeFiles/test_mod_evhost.dir/build

build/CMakeFiles/test_mod_evhost.dir/clean:
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" && $(CMAKE_COMMAND) -P CMakeFiles/test_mod_evhost.dir/cmake_clean.cmake
.PHONY : build/CMakeFiles/test_mod_evhost.dir/clean

build/CMakeFiles/test_mod_evhost.dir/depend:
	cd "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/src" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build" "/Users/andries/Development/Git/Grace London/simple-live-audio-streamer/experiments/bash/src/lighttpd-1.4.55/build/build/CMakeFiles/test_mod_evhost.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : build/CMakeFiles/test_mod_evhost.dir/depend

