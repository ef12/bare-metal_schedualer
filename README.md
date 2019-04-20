# bare-metal_schedualer
A repo for a bare metal scheduler development
It include tdd facility

There are 2 main folders in the project:
1. prod_code- include the production code
2. tdd_code- includes the unit tests to be able to test drive develope the production code

We can build the project with the eclipse "automatically generated makefiles" or the makefile:
1. For production code we use the debud and release build 
configuration with eclipse 
"automatically generated makefiles" by going to project properties,
   than "C\C++ Build" and tick the box of "Generate Makefiles Automatically"
2. For TDD we use the TDD build configuration with the makefile by going 
to project properties,
   than "C\C++ Build" and un-tick the box of "Generate Makefiles Automatically".
   Make sure that the "Build Directory" is ${workspace_loc:/bare_metal_event_driven}

* Usage
Build and run the project for prod_code.
Than run the executable (from a console)
The program will display the possible event inputs
start by typing m1e1 and see how the event is handled by module_1 task
The state machine in module_1 queue the event m2e1 of module_2 and goes to READY state.
module 2 process the m2e1 event and got to READY state as well.
Type m2e2 to make the module 2 state machine go back to INIT state and queue the module 1 m1e2 event.
Module 1 process the event and go back to INIT state.

If the user type an invalid input the program will terminate !!!
