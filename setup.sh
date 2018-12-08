#!/usr/bin/bash
# Setup dev env

echo Setting up dev env...
rustup run nightly rustup component add rust-src llvm-tools-preview
rustup run nightly cargo install cargo-xbuild cargo-binutils