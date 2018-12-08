# Make file for OS

# Set the target platform
TARGET_JSON = aarch64-unknown-none
RUSTUP = rustup run nightly # Put before cargo
END_FILE = target/$(TARGET)/debug/twokeys-os
OBJCOPY = $(RUSTUP) cargo objcopy --
OBJCOPY_PARAMS = --strip-all -O binary
FINAL_OUTPUT_DIR = target
IMAGE_OUTPUT = twokeys-os.img
IMAGE_FINAL_OUTPUT = kernel8.img

# Builds the kernel
build:
	$(RUSTUP) cargo xbuild --target=$(TARGET_JSON)

# Creates image
image: build
	$(OBJCOPY) target/$(TARGET_JSON)/debug/twokeys-os $(IMAGE_OUTPUT)
	cp $(IMAGE_OUTPUT) $(IMAGE_FINAL_OUTPUT)