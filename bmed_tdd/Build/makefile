################################################################################
# Top level makefile for TDD Environment
################################################################################
WORKSPACE_LOC := ./../..

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include tests/test2/subdir.mk
-include tests/test1/subdir.mk
-include tests/subdir.mk
-include objects.mk

# Every subdirectory with source files must be described here
SUBDIRS := \
tests \
tests/test1 \
tests/test2

# Add inputs and outputs from these tool invocations to the build variables 
LIBS_LOCS := \
-L"$(WORKSPACE_LOC)\extern\cpputest_build\lib"\
-L"cutLibs"

all: test1
# Tool invocations
test1: tests/test1/test1

# Build targets
tests/test1/test1: $(MAIN_OBJS) $(TEST1_OBJS) 
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++ $(LIBS_LOCS) -o tests/test1/test1 $(MAIN_OBJS) $(TEST1_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Clean Targets
clean: \
test1_clean\
main_clean

###
.PHONY: \
all\
clean\
main_clean\
test1_clean\
dependents
