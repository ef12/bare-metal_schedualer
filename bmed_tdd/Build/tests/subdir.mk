################################################################################
# Automatically-generated file. Do not edit!
################################################################################
WORKSPACE_LOC := ./../..
# the location of the TDD project reletive to Build directory
PROJECT_LOC := ./..
# The source codes to build 
MAIN_CPP_SRCS += $(PROJECT_LOC)/tests/main.cpp 
# The build output object files
MAIN_OBJS += ./tests/main.o
# The dependency files
MAIN_CPP_DEPS += ./tests/main.d 
# all the include files for the main
CPP_INC := \
-I"$(WORKSPACE_LOC)\extern\cpputest_build\include"\
-I"tests"

# Each subdirectory must supply rules for building sources it contributes
tests/%.o: ../tests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(CPP_INC) -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
	
# clean rule for main makefile
main_clean:
	-$(RM) $(MAIN_OBJS)$(MAIN_CPP_DEPS)
	-@echo ' '
	
# use dependencies for clean	
ifneq ($(strip $(MAIN_CPP_DEPS)),)
-include $(MAIN_CPP_DEPS)
endif