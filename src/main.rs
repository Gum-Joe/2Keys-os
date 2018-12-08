#![no_std] // don't link the Rust standard library
#![no_main] // disable all Rust-level entry points

#[macro_use]
extern crate twokeys_os_boot;

use core::panic::PanicInfo;

set_entry!(_start); // Set entry point

/// This function is called on panic.
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

// Kernel load
#[no_mangle]
pub extern "C" fn _start() -> ! {
    loop {}
}

