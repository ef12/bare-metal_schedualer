#
#CC = gcc
#CXX = g++
#TARGET = module_1_tester
#
#ODIR= tdd_code/obj
#CPPUTEST_HOME = ../extern/cpputest_build
#
#CPPFLAGS += -I$(CPPUTEST_HOME)/include -I$(SRC_DIR) -Wall -g -Wno-unused-function
#LIBS += -L./$(ODIR) -lmodule_1 -L$(CPPUTEST_HOME)/lib -lCppUTest -lCppUTestExt 
#
#CUT_INC := \
#prod_code/Modules/module_1/module_1.h
#
#CUT_OBJ := \
#$(prod_code/Modules/module_1/module_1.c:%=$(ODIR)/%.o)
#
#TESTER_OBJ := \
#tdd_code/main.o\
#tdd_code/module_1_tester/module_1_tester.o
#
#$(ODIR)/%.o: %.c $(CUT_INC)
#	$(CC) -c -o $@ $< $(CFLAGS)
#
#$(ODIR)/%.o: %.cpp $(CUT_INC)
#	$(CC) -c -o $@ $< $(CFLAGS)
#		
#$(TARGET): $(TESTER_OBJ) $(ODIR)/libmodule_1.a 
#	$(CXX) -o $@ $(CPPFLAGS) -I$(CUT_INC) $^ $(LIBS)
#	rm -f $(TESTER_OBJ)
#
#$(ODIR)/libmodule_1.a: $(CUT_OBJ)
#	ar rcs $@  $^ 
#	
#all: $(TARGET)
#
#.PHONY: clean
#
#clean:
#	rm -f ../*.o $(ODIR)/*.o $(ODIR)/*.a $(TARGET) *~ core $(INCDIR)/*~ 
#
###============================================================================
### END
###============================================================================



#============================================================================
# Name        : Makefile
# Author      : Ehud Frank
# Version     : 00.00.00
# Copyright   : Your copyright notice
# Description : Makefile to build the Aurix_tdd project  
#============================================================================
#============================================================================
# GENERAL
#============================================================================

#define the result executable file name per operating system
ifeq ($(OS),Windows_NT)
	OS_EXT = .exe
else
	OS_EXT = .out
endif
MKDIR_P ?= mkdir -p

# Target name
TARGET ?= prod_code
TARGET_EXEC ?= $(TARGET)$(OS_EXT)

# Repository directory
REPO_DIR ?= .
# Production code project directory location
PROD_PROJ_LOC ?= $(REPO_DIR)/prod_code
# Remoove the auto generated #include FreeRTOS.h in Cpu.h from CUT
#$(shell sed -i 's/#include "FreeRTOS.h"/ /g' $(PROD_PROJ_LOC)/Generated_Code/Cpu.h)
#$(shell sed -i 's/#include "osif.h"/ /g' $(PROD_PROJ_LOC)/Generated_Code/Cpu.h)

# Dirctory for the generated files in the build
BUILD_DIR ?= tdd_code/obj
TESTER_DIR ?= $(BUILD_DIR)
# C compiler flags
CFLAGS = -Wall -O1 #need to be O1 for INLINE functions to work

#============================================================================
# CODE UNDER TEST (CUT)
#============================================================================
CUT_LIB_NAME = prod_code
FULL_CUT_LIB_NAME = lib$(CUT_LIB_NAME).a
CUT_LIBS = -l$(CUT_LIB_NAME)
CUT_BUILD_ ?= $(TESTER_DIR)
CUT_BUILD_DIR ?= $(CUT_BUILD_)
CUT_LIB_DIR ?= $(CUT_BUILD_DIR)
# Source and header files for the cut
# Includes all the directories bellow definition
CUT_SRC_DIRS ?= \
$(PROD_PROJ_LOC)/App\
$(PROD_PROJ_LOC)/Modules\
$(PROD_PROJ_LOC)/Utils

# Header files location for the cut. 
# Required by tdd to interface to cut functions 
# Will NOT includes all the directories bellow definition (only all the files)
CUT_INCLUDES ?= \
$(PROD_PROJ_LOC)/App\
$(PROD_PROJ_LOC)/Modules\
$(PROD_PROJ_LOC)/Utils

# Find all the source files in the above locations
CUT_SRCS := $(shell find $(CUT_SRC_DIRS) -name *.cpp -or -name *.c ! -iname FreeRTOS.c -or -name *.s)
# Define the object files
CUT_OBJS := $(CUT_SRCS:%=$(CUT_BUILD_DIR)/%.o) 
# Define the dependency files
CUT_DEPS := $(CUT_OBJS:.o=.d)
# To find all directories in a location
CUT_INC_DIRS := $(shell find $(CUT_SRC_DIRS) -type d)
# Define the headers to include in the flag -I #
CUT_INC_FLAGS := $(addprefix -I,$(CUT_INCLUDES)) $(addprefix -I,$(CUT_INC_DIRS))


# Includes flags. -MMD -MP are used to generate a .d file next to the .o file
CUT_CPPFLAGS ?= $(CUT_INC_FLAGS) -DTDD #-MMD -MP 
# CUT LIBRARY CREATION
#============================================================================
# Define the location of the cut libreries
CUT_LIB_LOC ?= tdd_code/obj
# Define the cut library inclution flags
CUT_LIB ?= -l$(CUT_LIB_NAME)

#============================================================================

#============================================================================
# TESTER
#============================================================================
ifeq ($(OS),Windows_NT)
	CPPUTEST_INCLUDE = ../extern/cpputest_build/include
else
	CPPUTEST_INCLUDE = /usr/local/Cellar/cpputest/3.8/include
endif
# Source and header files for the tdd
# Includes all the directories bellow definition
SRC_DIRS ?= \
$(CPPUTEST_INCLUDE)\
tdd_code
# Find all the source files in the above locations
SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
# Define the object files
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
# Define the dependency files 
DEPS := $(OBJS:.o=.d)
# To find all directories in a location
INC_DIRS := $(shell find $(SRC_DIRS) -type d)
# Define the headers to include in the flag -I
INC_FLAGS := $(addprefix -I,$(INC_DIRS)) \
#-IProduction
# Includes flags. -MMD -MP are used to generate a .d file next to the .o file
CPPFLAGS ?= $(INC_FLAGS) -Wall -g3 #-MMD -MP removed to reenable debuggin.

#============================================================================
# CPPUTEST LIBRARIES
#============================================================================
# Define the location of the cpputest libreries
ifeq ($(OS),Windows_NT)
	CPPUTEST_LOC := ../extern/cpputest_build/lib
else
	CPPUTEST_LOC := /usr/local/Cellar/cpputest/3.8/lib
endif
# Define the cpputest libraries inclution flags
CPPUTEST_LIBS = -lCppUTest -lCppUTestExt

#============================================================================
# BUILDING
#============================================================================
# Get all the libraries locations that will be included in the build
LDFLAGS = -L$(CPPUTEST_LOC) -L$(CUT_LIB_LOC)
# Get all the libraries inclution flags that will be included in the build
LIBS ?= $(CPPUTEST_LIBS) $(CUT_LIB)
# Build the project
$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS) $(CUT_LIB_DIR)/$(FULL_CUT_LIB_NAME)
	$(CXX) $(LDFLAGS) -o $@  $^ $(CPPFLAGS) $(CUT_CPPFLAGS) $(LIBS)

# assembly
$(BUILD_DIR)/%.s.o: %.s
	$(MKDIR_P) $(dir $@)
	$(AS) $(ASFLAGS) -c $< -o $@

# c source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CUT_CPPFLAGS) -DTDD $(CFLAGS) -c $< -o $@

# c source
$(TESTER_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CUT_CPPFLAGS) -DTDD $(CFLAGS) -c $< -o $@

# c source
$(CUT_BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CUT_CPPFLAGS) $(CFLAGS) -c $< -o $@
	
# c++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CUT_CPPFLAGS) $(CXXFLAGS) -c $< -o $@

# c++ source tester
$(TESTER_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CUT_CPPFLAGS) $(CXXFLAGS) -c $< -o $@

# Create a library of the cut objects
$(CUT_LIB_DIR)/$(FULL_CUT_LIB_NAME): $(CUT_OBJS) #let's link library files into a static library
	ar rcs $@ $^

#============================================================================
# START
#============================================================================
# build the target rule
all: $(BUILD_DIR)/$(TARGET_EXEC)

# clean rules	
.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)

# Dependencies inclution
-include $(DEPS)
-include $(CUT_DEPS)

#============================================================================
# END
#============================================================================