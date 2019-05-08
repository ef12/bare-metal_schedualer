################################################################################
# Automatically-generated file. Do not edit!
################################################################################

RM := rm -rf

# Every subdirectory with source files must be described here
SUBDIRS := \
. \
tests \
tests/test1\
tests/test2
# All of the sources participating in the build are defined here
#-include sources.mk
-include tests/test1/make_test1.mk
-include tests/test2/make_test2.mk
-include tests/make_main.mk
-include objects.mk

-include ../makefile.defs
# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: \
test1\
test2


# Tool invocations
test1: $(TEST1_OBJS) $(MAIN_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "Debug/test1" $(TEST1_OBJS) $(MAIN_OBJS) -L./Debug/$(TEST1_LOC)/cut -ltest1_cut $(L_CPPUTEST_LIBS) $(CPPUTEST_LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Tool invocations
test2: $(TEST2_OBJS) $(MAIN_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "Debug/test2" $(TEST2_OBJS) $(MAIN_OBJS) $(L_CPPUTEST_LIBS) $(CPPUTEST_LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	
# Other Targets
clean: clean_test1 clean_test2
	-$(RM) $(MAIN_C++_DEPS) $(MAIN_OBJS)
	-@echo ' '
	


.PHONY: \
all\
clean\
test1\
clean_test1\
test2\
clean_test2\
dependents
#
-include ../makefile.targets