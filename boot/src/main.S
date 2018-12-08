// Main boot file
// Ideals cores & loads main function

#include "memory.S"

.section ".text.boot" // So this get placed at start of kernal

.globl _boot_start
_boot_start: // Start exectuion here
	// These lines get CPUID and runs our code if the current core is core 0
	// Else it halts that core (so the kernal only runs once)
	mrs	x0, mpidr_el1 // Loads a value from sys register to one of general purpose register (x0 to x30)
	and	x0, x0,#0xFF // This checks the CPUID
	cbz	x0, master // If last result is 0, jump to master
	// Hangs if else
	b	proc_hang

// Basically an infinity loop
proc_hang: 
	b proc_hang

// Master function that loads our Rust start function
master:
	// These lines setup our stack & jump to the rust kernel_main
	mov	sp, 0x8000
  bl	_exec_start // Start rust execition