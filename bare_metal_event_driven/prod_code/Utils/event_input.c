/*
 * event_input.c
 *
 *  Created on: 13 Apr 2019
 *      Author: efrank
 */

#include "event_input.h"

#include <stdio.h>
#include <stdlib.h>

#include "module_1.h"
#include "module_2.h"

static char input[8];


int event_input_scan(void)
{
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
        task_enqueue(module_1_task, module_1_event_1);
    }
    else if (!strcmp(input, "m1e2"))
    {
        task_enqueue(module_1_task, module_1_event_2);
    }
    else if (!strcmp(input, "m2e1"))
    {
        task_enqueue(module_2_task, module_2_event_1);
    }
    else if (!strcmp(input, "m2e2"))
    {
        task_enqueue(module_2_task, module_2_event_2);
    }
    else
    {
        return 0;
    }
    return 1;
}


