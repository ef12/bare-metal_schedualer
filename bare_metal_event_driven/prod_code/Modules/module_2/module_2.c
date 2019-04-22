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
#include "fifo.h"

#define EVENT_MODULE2_QUEUE_SIZE    8

typedef struct
{
    module2_event_t event_type;
} event_t;

typedef enum
{
    INIT_STATE, READY_STATE
} states_t;

/*
 * Private variables
 */
// use macro to declare fifo variables types and functions prototypes
INSTAL_FIFO_TYPES(module2_event_queue, event_t)
static module2_event_queue_s module2_event_queue;
static event_t module2_event_queue_buff[TASK_QUEUE_SIZE];
static event_t pv_event;
static states_t state = INIT_STATE;

/*
 * Function prototypes
 */
// Use macro to install the code for the fifo here
INSTAL_FIFO_CODE(module2_event_queue, event_t)

void module_2_init(void)
{
    module2_event_queue_init(&module2_event_queue, module2_event_queue_buff,
            EVENT_MODULE2_QUEUE_SIZE);
}

uint8_t module_2_event_enqueue(module2_event_t event)
{
    pv_event.event_type = event;
    module2_event_queue_in(&module2_event_queue, &pv_event);
    task_enqueue(module_2_task, no_event);
    return 0;
}

void module_2_task(void *params)
{
    static uint8_t num_of_entries = 0;
    static event_t event;

    if (!module2_event_queue_out(&module2_event_queue, &event))
    {
        printf("\n module 2 no event \r\n");
        return;
    }
        num_of_entries++;
    printf("\n********************************\r\n");
    printf("Module 2, ");
    switch (state)
    {
    case INIT_STATE:
    {
        printf("INIT_STATE, ");
        if (event.event_type == module2_event1)
        {
            state = READY_STATE;
            printf("go to READY_STATE, ");
            printf("event_1\r\n");
        }
        else if (event.event_type == module2_event2)
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
        if (event.event_type == module2_event2)
        {
            state = INIT_STATE;
            module_1_event_enqueue(module2_event2, num_of_entries);
            printf("go to INIT_STATE, ");
            printf("event_2\r\n");
        }
        else if (event.event_type == module2_event1)
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
