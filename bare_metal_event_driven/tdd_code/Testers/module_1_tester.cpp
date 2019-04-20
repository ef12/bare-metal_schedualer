/*
 * test_hbc.cpp
 *
 *  Created on: 16 Mar 2019
 *      Author: efrank
 */

#include <iostream>
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport.h"

extern "C" {
#include "module_1.h"
}

TEST_GROUP(module_1)
{
	void setup()
	{

	}
	void teardown() {

	}
};

TEST(module_1,module_1c_init)
{

}
