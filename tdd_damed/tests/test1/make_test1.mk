################################################################################
# Variables for all make
################################################################################
CUT_LOC := \
../bare_metal_event_driven/prod_code/Utils

TEST1_LOC := \
tests/test1

#CUT_INC_FLAGS := $(addprefix -I,$(CUT_INCLUDES)) $(addprefix -I,$(CUT_INC_DIRS))
# subtitution
#INC_DIRS := $(shell find $(SRC_DIRS) -type d)
# Define the dependency files
#CUT_DEPS := $(CUT_OBJS:.o=.d)

################################################################################
# Recepie for Code Under Test (CUT)
################################################################################
TEST1_CUT_SECS += \
$(CUT_LOC)/test_functions.c

TEST1_CUT_OBJS += \
./Debug/$(TEST1_LOC)/cut/test_functions.o
# make dependencies
TEST1_CUT_C_DEPS := \
./Debug/$(TEST1_LOC)/cut/test_functions.d

I_CUT_INCS += \
-I"Ctests\test1"\
-I"..\bare_metal_event_driven\prod_code\Utils"\
-I"tests\test2"\
-I"..\extern\cpputest_build\include"

./Debug/$(TEST1_LOC)/cut/%.o: $(CUT_LOC)/%.c $(CUT_LOC)/%.h
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C Compiler'
	gcc $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
	
# Create a library of the cut objects
./Debug/$(TEST1_LOC)/cut/libtest1_cut.a: $(TEST1_CUT_OBJS) #let's link library files into a static library
	@echo 'Building target: $@'
	ar rcs $@ $^


ifneq ($(MAKECMDGOALS),clean_test1)
ifneq ($(strip $(TEST1_CUT_DEPS)),)
-include $(TEST1_CUT_DEPS)
endif
endif

################################################################################
# Recepie for tester code
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
TEST1_C++_SRCS += \
./tests/test1/test1.cpp

TEST1_OBJS += \
./Debug/tests/test1/test1.o 

TEST1_C++_DEPS += \
./Debug/tests/test1/test1.d 

I_TEST1_INCS += $(addprefix -I,$(TEST1_LOC))
# Each subdirectory must supply rules for building sources it contributes
./Debug/tests/test1/%.o: ./tests/test1/%.cpp ./Debug/$(TEST1_LOC)/cut/libtest1_cut.a
	@mkdir -p $(dir $@)
	@echo 'Building file: $<'
	@echo 'Invoking: Cygwin C++ Compiler'
	g++ -I$(CPPUTEST_INCS) $(I_TEST1_INCS) $(I_CUT_INCS) -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ifneq ($(MAKECMDGOALS),clean_test1)
ifneq ($(strip $(TEST1_C++_DEPS)),)
-include $(TEST1_C++_DEPS)
endif
endif

################################################################################
# RCleaning all the test1 generated objects
################################################################################
clean_test1:
	-$(RM) $(TEST1_C++_DEPS) $(TEST1_OBJS) $(TEST1_CUT_C_DEPS) $(TEST1_CUT_OBJS) Debug/test1 ./Debug/$(TEST1_LOC)/cut/libtest1_cut.a
	-@echo ' '
	