################################################################################
# Top level makefile for TDD Environment
################################################################################
WORKSPACE_LOC := ./../..

RM := rm -rf

# All of the sources participating in the build are defined here
-include tests/test2/subdir.mk
-include tests/test1/subdir.mk
-include tests/subdir.mk

# Every subdirectory with source files must be described here
SUBDIRS := \
tests \
tests/test1 \
tests/test2

# CppUTest libreries
CPPUTES_LIBS := -lCppUTest -lCppUTestExt
# Add inputs and outputs from these tool invocations to the build variables 
LIBS_LOCS := \
-L$(WORKSPACE_LOC)/extern/cpputest_build/lib\
-LcutLibs

all: test1 test2
# Tool invocations
test1: tests/test1/test1
test2: tests/test2/test2
# Build targets
tests/test1/test1: $(MAIN_OBJS) $(TEST1_OBJS) 
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++ $(LIBS_LOCS) -o tests/test1/test1 $(MAIN_OBJS) $(TEST1_OBJS) $(CPPUTES_LIBS) -ltest1_cut
	@echo 'Finished building target: $@'
	@echo ' '

tests/test2/test2: $(MAIN_OBJS) $(TEST2_OBJS) 
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++ $(LIBS_LOCS) -o tests/test2/test2 $(MAIN_OBJS) $(TEST2_OBJS) $(CPPUTES_LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	
# Clean Targets
clean: main_clean\
test1_clean\
test2_clean

###
.PHONY: \
all\
clean\
main_clean\
test1_clean\
test2_clean\
dependents
