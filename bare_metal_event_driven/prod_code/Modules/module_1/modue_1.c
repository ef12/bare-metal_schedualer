/*
 * modue_1.c
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */

#include <stdio.h>
#include <stdlib.h>

#include "fifo.h"
#include "module_1.h"
#include "module_2.h"

#define EVENT_MODULE1_QUEUE_SIZE    8

typedef struct
{
    module1_event_t event_type;
    uint8_t data;
} event_t;

typedef enum
{
    INIT_STATE, READY_STATE
} states_t;

/*
 * Private variables
 */
// use macro to declare fifo variables types and functions prototypes
INSTAL_FIFO_TYPES(module1_event_queue, event_t)
static module1_event_queue_s module1_event_queue;
static event_t module1_event_queue_buff[TASK_QUEUE_SIZE];
static event_t pv_event;
static states_t state = INIT_STATE;

/*
 * Function prototypes
 */
// Use macro to install the code for the fifo here
INSTAL_FIFO_CODE(module1_event_queue, event_t)

void module_1_init(void)
{
    module1_event_queue_init(&module1_event_queue, module1_event_queue_buff, EVENT_MODULE1_QUEUE_SIZE);
}

uint8_t module_1_event_enqueue(module1_event_t event, uint8_t data)
{
    pv_event.event_type = event;
    pv_event.data = data;
    module1_event_queue_in(&module1_event_queue, &pv_event);
    task_enqueue(module_1_task, no_event);
    return 0;
}

void module_1_task(void *params)
{
    static event_t event;

    if (!module1_event_queue_out(&module1_event_queue, &event))
    {
        printf("\n module 2 no event \r\n");
        return;
    }
    printf("\n********************************\r\n");
    printf("Module 1, ");
    switch (state)
    {
    case INIT_STATE:
    {
        printf("INIT_STATE, ");
        if (event.event_type == module1_event1)
        {
            state = READY_STATE;
            module_2_event_enqueue(module2_event1);
            printf("go to READY_STATE, ");
            printf("event_1, ");
            printf("%d\r\n", event.data);
        }
        else if (event.event_type == module1_event2)
        {
            printf("event_2, ");
            printf("%d\r\n", event.data);
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
        if (event.event_type == module1_event2)
        {
            state = INIT_STATE;
            printf("go to INIT_STATE, ");
            printf("event_2, ");
            printf("%d\r\n", event.data);
        }
        else if (event.event_type == module1_event2)
        {
            printf("event_2, ");
            printf("%d\r\n", event.data);
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
