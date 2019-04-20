/*
 * modue_2.c
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */

#include <stdio.h>
#include <stdlib.h>

#include "module_2.h"
#include "module_1.h"

typedef enum
{
    INIT_STATE, READY_STATE
} states_t;

static states_t state = 0;

void module_2_task(events_types_t event)
{
    printf("\n********************************\r\n");
    printf("Module 2, ");
    switch (state)
    {
    case INIT_STATE:
    {
        printf("INIT_STATE, ");
        if (event == module_2_event_1)
        {
            state = READY_STATE;
            printf("go to READY_STATE, ");
            printf("event_1\r\n");
        }
        else if (event == module_2_event_2)
        {
            printf("event_2\r\n");
        }
        else
        {
            printf("no event\r\n");
        }
        break;
    }
    case READY_STATE:
    {
        printf("READY_STATE, ");
        if (event == module_2_event_2)
        {
            state = INIT_STATE;
            task_enqueue(module_1_task, module_1_event_2);
            printf("go to INIT_STATE, ");
            printf("event_2\r\n");
        }
        else if (event == module_2_event_1)
        {
            printf("event_1\r\n");
        }
        else
        {
            printf("no event\r\n");
        }
        break;
    }
    }
    printf("********************************\r\n\n");
}
