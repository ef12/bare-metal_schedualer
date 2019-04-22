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

#include "fifo.h"
#include "app_runner.h"
#include "event_input.h"
#include "module_1.h"
#include "module_2.h"

#define EVER        ;;

/*
 * Private variables
 */
// use macro to declare fifo variables types and functions prototypes
INSTAL_FIFO_TYPES(task_queue, task_t)
static task_queue_s task_queue;
static task_t task_queue_buff[TASK_QUEUE_SIZE];
static task_t pv_task;
/*
 * Function prototypes
 */
// Use macro to install the code for the fifo here
INSTAL_FIFO_CODE(task_queue, task_t)

void app_run(void)
{
    task_queue_init(&task_queue, task_queue_buff, TASK_QUEUE_SIZE);
    module_1_init();
    module_2_init();

    for (EVER)
    {
    	// Here the user can simulate an event by typing some input
        if(!event_input_scan())
        {
        	// No valid input was entered. This is the signal to break and exit program
            break;
        }
        //TODO: fifo in and out shall be in critical section
        while (task_queue_out(&task_queue, &pv_task))
        {
            pv_task.task_func(pv_task.params);
        }
    }
}


int task_enqueue(task_func_t task_func, void *params)
{
    task_t task;
    // protect null pointer
    if(task_func == 0)
    {
        // error
        return 1;
    }

    task.task_func = task_func;
    task.params = params;
    //TODO: fifo in and out shall be in critical section
    task_queue_in(&task_queue, &task);
    return 0;
}
