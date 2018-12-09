use driver_core::constants::MMIO_BASE;

const MINI_UART_OFFSET: u32  = 0x21_5000;
pub const MINI_UART_BASE: u32 = MMIO_BASE + MINI_UART_OFFSET;