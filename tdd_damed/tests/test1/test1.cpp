/*
 * test1.cpp
 *
 *  Created on: 30 Apr 2019
 *      Author: efrank
 */
#include <iostream>
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

#include "test1.h"

extern "C"
{
    #include "test_functions.h"
}

TEST_GROUP(module_1)
{
    void setup()
    {

    }
    void teardown() {

    }
};

TEST(module_1,module_1_init)
{
    CHECK_EQUAL(2,test1_add_num(1, 1));
}


