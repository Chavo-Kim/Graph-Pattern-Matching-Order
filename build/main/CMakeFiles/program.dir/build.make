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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build

# Include any dependencies generated for this target.
include main/CMakeFiles/program.dir/depend.make

# Include the progress variables for this target.
include main/CMakeFiles/program.dir/progress.make

# Include the compile flags for this target's objects.
include main/CMakeFiles/program.dir/flags.make

main/CMakeFiles/program.dir/main.cc.o: main/CMakeFiles/program.dir/flags.make
main/CMakeFiles/program.dir/main.cc.o: ../main/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object main/CMakeFiles/program.dir/main.cc.o"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/program.dir/main.cc.o -c /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/main/main.cc

main/CMakeFiles/program.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/program.dir/main.cc.i"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/main/main.cc > CMakeFiles/program.dir/main.cc.i

main/CMakeFiles/program.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/program.dir/main.cc.s"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/main/main.cc -o CMakeFiles/program.dir/main.cc.s

main/CMakeFiles/program.dir/__/src/backtrack.cc.o: main/CMakeFiles/program.dir/flags.make
main/CMakeFiles/program.dir/__/src/backtrack.cc.o: ../src/backtrack.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object main/CMakeFiles/program.dir/__/src/backtrack.cc.o"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/program.dir/__/src/backtrack.cc.o -c /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/backtrack.cc

main/CMakeFiles/program.dir/__/src/backtrack.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/program.dir/__/src/backtrack.cc.i"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/backtrack.cc > CMakeFiles/program.dir/__/src/backtrack.cc.i

main/CMakeFiles/program.dir/__/src/backtrack.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/program.dir/__/src/backtrack.cc.s"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/backtrack.cc -o CMakeFiles/program.dir/__/src/backtrack.cc.s

main/CMakeFiles/program.dir/__/src/candidate_set.cc.o: main/CMakeFiles/program.dir/flags.make
main/CMakeFiles/program.dir/__/src/candidate_set.cc.o: ../src/candidate_set.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object main/CMakeFiles/program.dir/__/src/candidate_set.cc.o"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/program.dir/__/src/candidate_set.cc.o -c /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/candidate_set.cc

main/CMakeFiles/program.dir/__/src/candidate_set.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/program.dir/__/src/candidate_set.cc.i"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/candidate_set.cc > CMakeFiles/program.dir/__/src/candidate_set.cc.i

main/CMakeFiles/program.dir/__/src/candidate_set.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/program.dir/__/src/candidate_set.cc.s"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/candidate_set.cc -o CMakeFiles/program.dir/__/src/candidate_set.cc.s

main/CMakeFiles/program.dir/__/src/graph.cc.o: main/CMakeFiles/program.dir/flags.make
main/CMakeFiles/program.dir/__/src/graph.cc.o: ../src/graph.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object main/CMakeFiles/program.dir/__/src/graph.cc.o"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/program.dir/__/src/graph.cc.o -c /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/graph.cc

main/CMakeFiles/program.dir/__/src/graph.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/program.dir/__/src/graph.cc.i"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/graph.cc > CMakeFiles/program.dir/__/src/graph.cc.i

main/CMakeFiles/program.dir/__/src/graph.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/program.dir/__/src/graph.cc.s"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/src/graph.cc -o CMakeFiles/program.dir/__/src/graph.cc.s

# Object files for target program
program_OBJECTS = \
"CMakeFiles/program.dir/main.cc.o" \
"CMakeFiles/program.dir/__/src/backtrack.cc.o" \
"CMakeFiles/program.dir/__/src/candidate_set.cc.o" \
"CMakeFiles/program.dir/__/src/graph.cc.o"

# External object files for target program
program_EXTERNAL_OBJECTS =

main/program: main/CMakeFiles/program.dir/main.cc.o
main/program: main/CMakeFiles/program.dir/__/src/backtrack.cc.o
main/program: main/CMakeFiles/program.dir/__/src/candidate_set.cc.o
main/program: main/CMakeFiles/program.dir/__/src/graph.cc.o
main/program: main/CMakeFiles/program.dir/build.make
main/program: main/CMakeFiles/program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable program"
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
main/CMakeFiles/program.dir/build: main/program

.PHONY : main/CMakeFiles/program.dir/build

main/CMakeFiles/program.dir/clean:
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main && $(CMAKE_COMMAND) -P CMakeFiles/program.dir/cmake_clean.cmake
.PHONY : main/CMakeFiles/program.dir/clean

main/CMakeFiles/program.dir/depend:
	cd /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/main /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main /mnt/c/Users/smsychjy/Desktop/학교/2021-1/알고리즘/Graph-Pattern-Matching-Order/build/main/CMakeFiles/program.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : main/CMakeFiles/program.dir/depend

