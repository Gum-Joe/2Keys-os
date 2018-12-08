// Code that includes boot code
#![no_std] // don't link the Rust standard library
#![feature(global_asm)] 

extern crate r0;

// This macro sets up a function as entry point
#[macro_export]
macro_rules! set_entry {
    ($path:path) => {
        #[export_name = "main"]
        pub unsafe fn __main() -> ! {
            // type check the given path
            let f: fn() -> ! = $path;

            f() // Run
        }
    };
}

// This here zeros out bss section and start execution
#[no_mangle]
pub unsafe extern "C" fn _exec_start() -> ! {
    extern "C" {
        // Boundaries of the .bss section, provided by the linker script
        static mut __bss_start: u64;
        static mut __bss_end: u64;
    }

    // Zeroes the .bss section
    r0::zero_bss(&mut __bss_start, &mut __bss_end);

    extern "Rust" {
        fn main() -> !;
    }

    main(); // BEGIN MAIN EXECUTION
}
global_asm!(include_str!("./constants.S")); // Include constants
global_asm!(include_str!("./main.S")); // Include boot code


