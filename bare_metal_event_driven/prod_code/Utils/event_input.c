/*
 * event_input.c
 *
 *  Created on: 13 Apr 2019
 *      Author: efrank
 */

#include "event_input.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "module_1.h"
#include "module_2.h"

static char input[8];
static uint8_t some_data;

int event_input_scan(void)
{
    some_data = 0;

    printf("please enter your event choice:\r\n");
    printf("module 1 event 1: m1e1\r\n");
    printf("module 1 event 2: m1e2\r\n");
    printf("module 2 event 1: m2e1\r\n");
    printf("module 2 event 2: m2e2\r\n");
    printf("exit: x\r\n");

    if (scanf("%s", input) < 0)
    {
        return 0;
    }
    if(!strcmp(input, "\r\n"))
    {
        return 0;
    }
    else if (!strcmp(input, "m1e1"))
    {
        module_1_event_enqueue(module1_event1, some_data++);
    }
    else if (!strcmp(input, "m1e2"))
    {
        module_1_event_enqueue(module1_event2, some_data++);
    }
    else if (!strcmp(input, "m2e1"))
    {
        module_2_event_enqueue(module2_event1);
    }
    else if (!strcmp(input, "m2e2"))
    {
        module_2_event_enqueue(module2_event2);
    }
    else
    {
        return 0;
    }
    return 1;
}


