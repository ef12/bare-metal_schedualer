################################################################################
# Variables for make
################################################################################
WORKSPACE_LOC := ./../..
# The location of the project with the code under test 
PROD_CODE_LOC := $(WORKSPACE_LOC)/bare_metal_event_driven/prod_code
# The location of the TTD project with all the tests
TDD_PROJ_LOC := ./..
# The location of the outpout object files form the testing code
TEST1_BUILD_LOC := ./tests/test1
# The location of the testing code
TEST1_CODE_LOC := ../$(TEST1_BUILD_LOC)
# The location of the cut
CUT_LOC := $(PROD_CODE_LOC)/Utils
# The location of the outpout object files form the cut
CUT_BUILD_LOC := $(TEST1_BUILD_LOC)/cut

################################################################################
# Recepie for Code Under Test (CUT)
################################################################################
# The source codes to build
TEST1_CUT_SRCS += \
$(PROD_CODE_LOC)/Utils/test_functions.c
# The build output object files
TEST1_CUT_OBJS += \
$(CUT_BUILD_LOC)/test_functions.o
# The dependency file
TEST1_CUT_C_DEPS += \
$(CUT_BUILD_LOC)/test_functions.d
# all the include files for the cut
I_CUT_INCS += \
-I$(PROD_CODE_LOC)/Utils
# build the object files
$(CUT_BUILD_LOC)/%.o: $(CUT_LOC)/%.c
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
# Create a library of the cut objects
cutLibs/libtest1_cut.a: $(TEST1_CUT_OBJS) #let's link library files into a static library
	@mkdir -p $(dir $@)
	@echo 'Building target: $@'
	ar rcs $@ $^


################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# The source codes to build 
TEST1_CPP_SRCS += $(TEST1_CODE_LOC)/test1.cpp
# The build output object files
TEST1_OBJS += $(TEST1_BUILD_LOC)/test1.o
# The dependency files
TEST1_CPP_DEPS += $(TEST1_BUILD_LOC)/test1.d
# all the include files for the main
CPP_INCS := \
-I$(WORKSPACE_LOC)/extern/cpputest_build/include\
-I$(PROD_CODE_LOC)/Utils\
-Itests/test1

# Each subdirectory must supply rules for building sources it contributes
$(TEST1_BUILD_LOC)/%.o: $(TEST1_CODE_LOC)/%.cpp cutLibs/libtest1_cut.a
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ $(CPP_INCS) -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

# clean rule for main makefile
test1_clean:
	-$(RM) $(TEST1_OBJS) $(TEST1_CPP_DEPS) $(TEST1_CUT_OBJS) $(TEST1_CUT_C_DEPS) cutLibs/libtest1_cut.a $(TEST1_BUILD_LOC)/test1
	-@echo ' '

# use dependencies for clean	
ifneq ($(strip $(TEST1_CPP_DEPS)),)
-include $(TEST1_CPP_DEPS)
endif
ifneq ($(strip $(TEST1_CUT_C_DEPS)),)
-include $(TEST1_CUT_C_DEPS)
endif
