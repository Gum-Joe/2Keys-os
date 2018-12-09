// Entry point for uart
#![no_std] // don't link the Rust standard library
#![feature(asm)]

// For uart1.rs
#[macro_use]
extern crate register; // For accesing CPU registies
extern crate driver_core;

mod constants;
pub mod uart1;
pub mod uart;