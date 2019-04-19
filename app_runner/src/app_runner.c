/*
 ============================================================================
 Name        : app_runner.c
 Author      : Ehud
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

#include "app_runner.h"
#include "module_1.h"
#include "event_input.h"

#define EVER        ;;

INSTAL_FIFO_TYPES(task_queue, task_t);
static task_queue_s task_queue;
static task_t task_queue_buff[TASK_QUEUE_SIZE];
static task_t pv_task;

INSTAL_FIFO_CODE(task_queue, task_t);
void task_enqueue(task_func_t task_func, events_types_t event)
{
    // critical section
    task_t task;
    task.task_func = task_func;
    task.event = event;
    task_queue_in(&task_queue, &task);
}

int main(void)
{
    task_queue_init(&task_queue, task_queue_buff, TASK_QUEUE_SIZE);

    for (EVER)
    {
        if(!event_input_scan())
        {
            break;
        }

        while (task_queue_out(&task_queue, &pv_task))
        {
            // need to be in critical section
            pv_task.task_func(pv_task.event);
        }

    }

    return EXIT_SUCCESS;
}

