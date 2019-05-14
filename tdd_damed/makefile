################################################################################
# Automatically-generated file. Do not edit!
################################################################################

RM := rm -rf

CPPUTEST_INCS := \
../extern/cpputest_build/include

L_CPPUTEST_LIBS := \
-L../extern/cpputest_build/lib

CPPUTEST_LIBS := \
-lCppUTest -lCppUTestExt

C++_SRCS :=
MAIN_OBJS :=
MAIN_C++_DEPS :=
CUT_LOC :=
TEST1_LOC :=
TEST1_CUT_SECS :=
TEST1_CUT_OBJS :=
TEST1_CUT_C_DEPS :=
I_CUT_INCS :=
TEST1_C++_SRCS :=
TEST1_OBJS :=
TEST1_C++_DEPS :=
I_TEST1_INCS :=

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

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: \
test1\
test2

# Tool invocations
Debug/test1.exe: $(TEST1_OBJS) $(MAIN_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -I$(CPPUTEST_INCS) -L"..\extern\cpputest_build\lib" -L"Debug/$(TEST1_LOC)/cut" -o "$@" $(TEST1_OBJS) $(MAIN_OBJS) -ltest1_cut $(CPPUTEST_LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

test1: Debug/test1.exe
# Tool invocations
Debug/test2.exe: $(TEST2_OBJS) $(MAIN_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "$@" -I$(CPPUTEST_INCS) $(TEST2_OBJS) $(MAIN_OBJS) $(L_CPPUTEST_LIBS) $(CPPUTEST_LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

test2: Debug/test2.exe
	
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