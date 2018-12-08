# Make file for OS

# Set the target platform
TARGET_JSON = aarch64-unknown-none
RUSTUP = rustup run nightly # Put before cargo
END_FILE = target/$(TARGET)/debug/twokeys-os
OBJCOPY = $(RUSTUP) cargo objcopy --
BJCOPY_PARAMS = --strip-all -O binary

# Builds the kernel
build:
	$(RUSTUP) cargo xbuild --target=$(TARGET_JSON)

# Creates image
kernel8.img: build
	$(OBJCOPY) $(OBJCOPY_PARAMS) target/$(TARGET_JSON)/debug/twokeys-os twokeys-os.img