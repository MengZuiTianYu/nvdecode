# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wangxy/test_code/nvdecode

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wangxy/test_code/nvdecode/build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o: ../src/nvdecoder/RtspProcess.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wangxy/test_code/nvdecode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o -c /home/wangxy/test_code/nvdecode/src/nvdecoder/RtspProcess.cpp

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangxy/test_code/nvdecode/src/nvdecoder/RtspProcess.cpp > CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.i

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangxy/test_code/nvdecode/src/nvdecoder/RtspProcess.cpp -o CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.s

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.requires

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.provides: CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.provides

CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.provides.build: CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o


CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o: ../src/nvdecoder/NvDecoder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/wangxy/test_code/nvdecode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o -c /home/wangxy/test_code/nvdecode/src/nvdecoder/NvDecoder.cpp

CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wangxy/test_code/nvdecode/src/nvdecoder/NvDecoder.cpp > CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.i

CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wangxy/test_code/nvdecode/src/nvdecoder/NvDecoder.cpp -o CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.s

CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.requires:

.PHONY : CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.requires

CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.provides: CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.requires
	$(MAKE) -f CMakeFiles/main.dir/build.make CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.provides.build
.PHONY : CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.provides

CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.provides.build: CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o


# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o" \
"CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o
main: CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o
main: CMakeFiles/main.dir/build.make
main: /usr/local/cuda-10.1/lib64/libcudart.so
main: /usr/local/cuda-10.1/lib64/libcudnn.so
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/wangxy/test_code/nvdecode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/requires: CMakeFiles/main.dir/src/nvdecoder/RtspProcess.cpp.o.requires
CMakeFiles/main.dir/requires: CMakeFiles/main.dir/src/nvdecoder/NvDecoder.cpp.o.requires

.PHONY : CMakeFiles/main.dir/requires

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/wangxy/test_code/nvdecode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wangxy/test_code/nvdecode /home/wangxy/test_code/nvdecode /home/wangxy/test_code/nvdecode/build /home/wangxy/test_code/nvdecode/build /home/wangxy/test_code/nvdecode/build/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

