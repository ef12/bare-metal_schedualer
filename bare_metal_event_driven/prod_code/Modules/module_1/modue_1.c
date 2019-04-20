/*
 * modue_1.c
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */


#include <stdio.h>
#include <stdlib.h>

#include "module_1.h"
#include "module_2.h"

typedef enum
{
    INIT_STATE, READY_STATE
} states_t;

static states_t state = 0;

void module_1_task(events_types_t event)
{
    printf("\n********************************\r\n");
    printf("Module 1, ");
    switch (state)
    {
    case INIT_STATE:
    {
        printf("INIT_STATE, ");
        if (event == module_1_event_1)
        {
            state = READY_STATE;
            task_enqueue(module_2_task, module_2_event_1);
            printf("go to READY_STATE, ");
            printf("event_1\r\n");
        }
        else if (event == module_1_event_2)
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
        if (event == module_1_event_2)
        {
            state = INIT_STATE;
            printf("go to INIT_STATE, ");
            printf("event_2\r\n");
        }
        else if (event == module_1_event_2)
        {
            printf("event_2\r\n");
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
