#ifndef UTILS_FIFO_H_
#define UTILS_FIFO_H_
/*
 * Macros to simulate c++ like template for creating a private fifo
 * Interface:
 * void name##_init(name##_s* self, T* values, int capacity);
 * int name##_is_empty(name##_s* self);
 * int name##_is_full(name##_s* self);
 * int name##_in(name##_s* self, T* value);
 * int name##_out(name##_s* self, T* value);
 * int name##_capacity(name##_s* self);
 */
#include "string.h"
#define INSTAL_FIFO_TYPES(name, T)\
typedef struct \
{\
    int count;\
    int index;\
    int outdex;\
    int capacity;\
    T* values;\
} name##_s;\
void name##_init(name##_s* self, void* values, int capacity);\
int name##_is_empty(name##_s* self);\
int name##_is_full(name##_s* self);\
int name##_in(name##_s* self, void* value);\
int name##_out(name##_s* self, void* value);\
int name##_capacity(name##_s* self);

#define INSTAL_FIFO_CODE(name, T)\
void name##_init(name##_s* self, void* values, int capacity)\
{\
    self->count = 0;\
    self->outdex = 0;\
	self->index = 0;\
    self->capacity = capacity;\
    memset( values, 0, capacity * sizeof(T) );\
    self->values = (T*)values;\
}\
int name##_is_empty(name##_s* self)\
{\
    return self->count == 0;\
}\
int name##_is_full(name##_s* self)\
{\
    return self->count == self->capacity;\
}\
int name##_in(name##_s* self, void* value)\
{\
    if (self->count >= self->capacity)\
        return 0;\
    self->count++;\
    self->values[self->index++] = *(T*)value;\
    if (self->index >= self->capacity)\
        self->index = 0;\
    return 1;\
}\
int name##_out(name##_s* self, void* value)\
{\
    if (self->count <= 0)\
        return 0;\
    *((T*)value) = self->values[self->outdex++];\
    self->count--;\
    if (self->outdex >= self->capacity)\
        self->outdex = 0;\
    return 1;\
}\
int name##_capacity(name##_s* self)\
{\
    return self->capacity;\
}


#endif /* APP_UTILITIES_FIFO_FIFO_H_ */
