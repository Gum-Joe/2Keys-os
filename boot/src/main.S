// Main boot file
// Ideals cores & loads main function

#include "constants.S" // Doesn't actually do anything, is included in Rust code

.section ".text.boot" // So this get placed at start of kernal

.globl _boot_start
_boot_start: // Start exectuion here
	// These lines get CPUID and runs our code if the current core is core 0
	// Else it halts that core (so the kernal only runs once)
	mrs	x0, mpidr_el1 // Loads a value from sys register to one of general purpose register (x0 to x30)
	and	x0, x0,#0xFF // This checks the CPUID
	cbz	x0, master // If last result is 0, jump to master
	// Hangs if else
	b	core_hang

// Halt cores
core_hang: 
	bne halt
	// b core_hang // Ininfity loop

// Master function that loads our Rust start function
master:
	// These lines setup our stack & jump to the rust kernel_main
	mov	sp, STACK_MEMORY
	bl	_exec_start // Start rust execition