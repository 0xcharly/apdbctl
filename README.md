# apdbctl

Apple Pro Display XDR Brightness control

## Build

### Using CMake

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

### Using Nix

```bash
nix build
```

## Usage

```bash
# Get current brightness
apdbctl get

# Set brightness to a specific value (0-100)
apdbctl set 75

# Set brightness using percentage notation
apdbctl set 50%

# List available displays
apdbctl list
```

## Requirements

- CMake 3.19 or later
- hidapi library
- C11 compatible compiler
