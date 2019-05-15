################################################################################
# Top level makefile for TDD Environment
################################################################################
WORKSPACE_LOC := ./../..

RM := rm -rf

# All of the sources participating in the build are defined here
-include tests/event_input_test/subdir.mk
-include tests/test1/subdir.mk
-include tests/subdir.mk

# Every subdirectory with source files must be described here
SUBDIRS := \
tests \
tests/test1 \
tests/event_input_test

# CppUTest libreries
CPPUTES_LIBS := -lCppUTest -lCppUTestExt
# Add inputs and outputs from these tool invocations to the build variables 
LIBS_LOCS := \
-L$(WORKSPACE_LOC)/extern/cpputest_build/lib\
-LcutLibs

all: test1 event_input_test
# Tool invocations
test1: tests/test1/test1
event_input_test: tests/event_input_test/event_input_test
# Build targets
tests/test1/test1: $(MAIN_OBJS) $(TEST1_OBJS) 
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++ $(LIBS_LOCS) -o tests/test1/test1 $(MAIN_OBJS) $(TEST1_OBJS) $(CPPUTES_LIBS) -ltest1_cut
	@echo 'Finished building target: $@'
	@echo ' '

tests/event_input_test/event_input_test: $(MAIN_OBJS) $(EVENT_INPUT_TEST_OBJS) 
	@echo 'Building target: $@'
	@echo 'Invoking: Cygwin C++ Linker'
	g++ $(LIBS_LOCS) -o tests/event_input_test/event_input_test $(MAIN_OBJS) $(EVENT_INPUT_TEST_OBJS) $(CPPUTES_LIBS) -levent_input_cut
	@echo 'Finished building target: $@'
	@echo ' '
	
# Clean Targets
clean: main_clean\
test1_clean\
event_input_test_clean

###
.PHONY: \
all\
clean\
main_clean\
test1_clean\
event_input_test_clean\
dependents
