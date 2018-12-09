#![no_std] // don't link the Rust standard library
#![no_main] // disable all Rust-level entry points

#[macro_use]
extern crate twokeys_os_boot;
extern crate uart;

use core::panic::PanicInfo;

set_entry!(_rust_start); // Set entry point

/// This function is called on panic.
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

// Kernel load
#[no_mangle]
fn _rust_start() -> ! {
    let uart = uart::uart1::MiniUart::new();

    // set up serial console
    uart.init();

    // uart.getc(); // Press a key first before being greeted
    uart.puts("Hello Rustacean!\n");

    loop {}
}

