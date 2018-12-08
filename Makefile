# Make file for OS

# Set the target platform
TARGET_JSON = aarch64-unknown-none
RUSTUP = rustup run nightly # Put before cargo
END_FILE = target/$(TARGET)/debug/twokeys-os
OBJCOPY = $(RUSTUP) cargo objcopy --
OBJCOPY_PARAMS = --strip-all -O binary
FINAL_OUTPUT_DIR = target/images
IMAGE_OUTPUT = $(FINAL_OUTPUT_DIR)/twokeys-os.img
IMAGE_FINAL_OUTPUT = $(FINAL_OUTPUT_DIR)/kernel8.img
QEMU_TARGET = system-aarch64
QEMU_ARGS = -M raspi3 -kernel $(IMAGE_FINAL_OUTPUT)

# Builds the kernel
build:
	$(RUSTUP) cargo xbuild --target=$(TARGET_JSON)

# Creates image
image: build
	mkdir -p $(FINAL_OUTPUT_DIR)
	$(OBJCOPY) target/$(TARGET_JSON)/debug/twokeys-os $(IMAGE_OUTPUT)
	cp $(IMAGE_OUTPUT) $(IMAGE_FINAL_OUTPUT)

qemu: image
	qemu-$(QEMU_TARGET) $(QEMU_ARGS)

qemu_windows:
	qemu-$(QEMU_TARGET) $(QEMU_ARGS)
