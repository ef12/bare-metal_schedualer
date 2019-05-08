/*
 * test1.cpp
 *
 *  Created on: 30 Apr 2019
 *      Author: efrank
 */
#include <iostream>
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

extern "C"
{


}

TEST_GROUP(module_2)
{
    void setup()
    {

    }
    void teardown() {

    }
};

TEST(module_2,module_2_init)
{
    //CHECK_EQUAL(0,task_enqueue(module_1_task, 0));
}


