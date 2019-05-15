/*
 * test1.cpp
 *
 *  Created on: 30 Apr 2019
 *      Author: efrank
 */
#include <iostream>
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

#include "event_input_test.h"

extern "C"
{
#include "event_input.h"
}

TEST_GROUP(event_input)
{
    void setup()
    {

    }
    void teardown
        ()
        {

        }
};

TEST(event_input, event_input_init)
{
    CHECK_EQUAL(0,event_input_scan());
}

