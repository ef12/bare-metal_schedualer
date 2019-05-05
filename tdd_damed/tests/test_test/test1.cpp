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
    //CHECK_EQUAL(0,task_enqueue(module_1_task, 0));
}


