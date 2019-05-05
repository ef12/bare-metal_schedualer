################################################################################
# Automatically-generated file. Do not edit!
################################################################################

RM := rm -rf

C_UPPER_SRCS := 
CXX_SRCS := 
C++_SRCS := 
OBJ_SRCS := 
CC_SRCS := 
ASM_SRCS := 
CPP_SRCS := 
C_SRCS := 
S_UPPER_SRCS := 
O_SRCS := 
CC_DEPS := 
C++_DEPS := 
EXECUTABLES := 
OBJS := 
C_UPPER_DEPS := 
CXX_DEPS := 
CPP_DEPS := 
C_DEPS := 

# Every subdirectory with source files must be described here
SUBDIRS := \
. \
tests \
tests/test_test
# All of the sources participating in the build are defined here
#-include sources.mk
-include tests/test_test/make_tests.mk
-include tests/make_main.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
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
all: tdd_damed.exe

# Tool invocations
tdd_damed.exe: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Main Cygwin C++ Linker'
	g++ -o "tdd_damed.exe" $(OBJS) $(USER_OBJS) $(L_LIBS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(CC_DEPS)$(C++_DEPS)$(EXECUTABLES)$(OBJS)$(C_UPPER_DEPS)$(CXX_DEPS)$(CPP_DEPS)$(C_DEPS) tdd_damed.exe
	-@echo ' '

.PHONY: all clean dependents

