################################################################################
# Variables for make
################################################################################
WORKSPACE_LOC := ./../..
# The location of the project with the code under test 
PROD_CODE_LOC := $(WORKSPACE_LOC)/bare_metal_event_driven/prod_code
# The location of the TTD project with all the tests
TDD_PROJ_LOC := ./..
# The location of the outpout object files form the testing code
EVENT_INPUT_TEST_BUILD_LOC := tests/event_input_test
# The location of the testing code
EVENT_INPUT_TEST_CODE_LOC := ../$(EVENT_INPUT_TEST_BUILD_LOC)
# The location of the cut
CUT_EVENT_INPUT_LOC := $(PROD_CODE_LOC)/Utils
# The location of the outpout object files form the cut
CUT_EVENT_INPUT_BUILD_LOC := $(EVENT_INPUT_TEST_BUILD_LOC)/cut
# The location of the outpout object files form the testing code
EVENT_INPUT_TEST_BUILD_LOC := tests/event_input_test
# The location of the testing code
EVENT_INPUT_TEST_CODE_LOC := ../$(EVENT_INPUT_TEST_BUILD_LOC)


################################################################################
# Recepie for Code Under Test (CUT)
################################################################################
# The source codes to build
EVENT_INPUT_TEST_CUT_SRCS += \
$(PROD_CODE_LOC)/Utils/event_input.c\
#$(PROD_CODE_LOC)/Modules/module_1/module_1.c\
#$(PROD_CODE_LOC)/Modules/module_1/module_1.c
# The build output object files
EVENT_INPUT_TEST_CUT_OBJS += \
$(CUT_EVENT_INPUT_BUILD_LOC)/event_input.o
# The dependency file
EVENT_INPUT_TEST_CUT_C_DEPS += \
$(CUT_EVENT_INPUT_BUILD_LOC)/event_input.d
# all the include files for the cut
I_CUT_INCS += \
-I$(PROD_CODE_LOC)/Utils\
-I$(PROD_CODE_LOC)/App\
-I$(PROD_CODE_LOC)/Modules/module_1\
-I$(PROD_CODE_LOC)/Modules/module_2\

# build the object files
$(CUT_EVENT_INPUT_BUILD_LOC)/%.o: $(CUT_EVENT_INPUT_LOC)/%.c
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
# Create a library of the cut objects
cutLibs/libevent_input_cut.a: $(EVENT_INPUT_TEST_CUT_OBJS) #let's link library files into a static library
	@mkdir -p $(dir $@)
	@echo 'Building target: $@'
	ar rcs $@ $^

################################################################################
# Recepie for testing code
################################################################################
# Add inputs and outputs from these tool invocations to the build variables 
EVENT_INPUT_TEST_CPP_SRCS := \
../tests/event_input_test/event_input_test.cpp\
../tests/event_input_test/event_input_stubs.cpp
EVENT_INPUT_TEST_OBJS := \
tests/event_input_test/event_input_test.o\
tests/event_input_test/event_input_stubs.o

EVENT_INPUT_TEST_CPP_DEPS := \
tests/event_input_test/event_input_test.d\
tests/event_input_test/event_input_stubs.d

CPP_INCS := \
-I$(WORKSPACE_LOC)/extern/cpputest_build/include\
-I$(PROD_CODE_LOC)/Utils\
-Itests/event_input_test

# Each subdirectory must supply rules for building sources it contributes
$(EVENT_INPUT_TEST_BUILD_LOC)/%.o: $(EVENT_INPUT_TEST_CODE_LOC)/%.cpp cutLibs/libevent_input_cut.a
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(CPP_INCS) $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

$(EVENT_INPUT_TEST_BUILD_LOC)/%.o: $(EVENT_INPUT_TEST_CODE_LOC)/%.c cutLibs/libevent_input_cut.a
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc $(CPP_INCS) $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
	
# clean rule for main makefile
event_input_test_clean:
	-$(RM) $(EVENT_INPUT_TEST_OBJS) $(EVENT_INPUT_TEST_CPP_DEPS) $(EVENT_INPUT_TEST_CUT_OBJS) $(EVENT_INPUT_TEST_CUT_C_DEPS) cutLibs/libevent_input_cut.a $(EVENT_INPUT_TEST_BUILD_LOC)/event_input_test
	-@echo ' '

# use dependencies for clean	
ifneq ($(strip $(EVENT_INPUT_TEST_CPP_DEPS)),)
-include $(EVENT_INPUT_TEST_CPP_DEPS)
endif
ifneq ($(strip $(EVENT_INPUT_TEST_CUT_C_DEPS)),)
-include $(EVENT_INPUT_TEST_CUT_C_DEPS)
endif