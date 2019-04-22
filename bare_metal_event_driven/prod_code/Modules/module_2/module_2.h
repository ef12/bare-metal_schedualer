/*
 * module_2.h
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */

#ifndef PROD_CODE_MODULES_MODULE_2_MODULE_2_H_
#define PROD_CODE_MODULES_MODULE_2_MODULE_2_H_

#include "app_runner.h"

typedef enum
{
    module2_event1, module2_event2, module2_event3, num_of_module2_events
} module2_event_t;

void module_2_init(void);
uint8_t module_2_event_enqueue(module2_event_t event);
void module_2_task(void *params);

#endif /* PROD_CODE_MODULES_MODULE_2_MODULE_2_H_ */
