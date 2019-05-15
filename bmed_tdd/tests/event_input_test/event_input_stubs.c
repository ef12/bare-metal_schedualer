/*
 * event_input_stubs.c
 *
 *  Created on: 15 May 2019
 *      Author: efrank
 */

#include <stdio.h>
#include <stdlib.h>

#include "module_1.h"
#include "module_2.h"

uint8_t module_1_event_enqueue(module1_event_t event, uint8_t data)
{
    return 0;
}

uint8_t module_2_event_enqueue(module2_event_t event)
{
    return 0;
}
