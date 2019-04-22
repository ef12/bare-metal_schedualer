/*
 * module_1.h
 *
 *  Created on: 12 Apr 2019
 *      Author: efrank
 */

#ifndef PROD_CODE_MODULES_MODULE_1_MODULE_1_H_
#define PROD_CODE_MODULES_MODULE_1_MODULE_1_H_

#include "app_runner.h"

typedef enum
{
    module1_event1, module1_event2, module1_event3, num_of_module1_events
} module1_event_t;

void module_1_init(void);
uint8_t module_1_event_enqueue(module1_event_t event, uint8_t data);
void module_1_task(void *params);


#endif /* PROD_CODE_MODULES_MODULE_1_MODULE_1_H_ */
