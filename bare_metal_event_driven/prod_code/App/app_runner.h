/*
 * app_runner.h
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */

#ifndef PROD_CODE_APP_APP_RUNNER_H_
#define PROD_CODE_APP_APP_RUNNER_H_

#include "fifo.h"

#define TASK_QUEUE_SIZE         8
//
//typedef enum
//{
//    module_1_event_1, module_1_event_2, module_1_event_3, num_of_module_1_event
//} module_1_event_t;
//
//typedef enum
//{
//    module_2_event_1, module_2_event_2, module_2_event_3, num_of_module_2_event
//} module_2_event_t;

typedef enum
{
    no_event,
    module_1_event_1,
    module_1_event_2,
    module_1_event_3,
    module_2_event_1,
    module_2_event_2,
    module_2_event_3
} events_types_t;

typedef void (*task_func_t)(events_types_t event);

typedef struct
{
    task_func_t task_func;
    events_types_t event;
} task_t;

void task_enqueue(task_func_t task_func, events_types_t event);

#endif /* PROD_CODE_APP_APP_RUNNER_H_ */
