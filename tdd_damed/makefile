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

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(TEST1_C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: \
test1\
test2

# Tool invocations
test1: $(TEST1_OBJS) $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "Debug/test1" $(TEST1_OBJS) $(OBJS) $(USER_OBJS) $(L_LIBS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Tool invocations
test2: $(TEST2_OBJS) $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "Debug/test2" $(TEST2_OBJS) $(OBJS) $(USER_OBJS) $(L_LIBS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	
# Other Targets
clean: clean_test1 clean_test2
	-$(RM) $(C++_DEPS)$(EXECUTABLES)$(OBJS)$(C_UPPER_DEPS)$(CXX_DEPS)$(CPP_DEPS)$(C_DEPS)
	-@echo ' '

clean_test1:
	-$(RM) $(TEST1_C++_DEPS) Debug/test1 Debug/tests/test1/test1.o
	-@echo ' '
	
clean_test2:
	-$(RM) $(TEST2_C++_DEPS) Debug/test2 Debug/tests/test2/test2.o
	-@echo ' '

.PHONY: \
all\
clean\
test1\
clean_test1\
test2\
clean_test2\
dependents

