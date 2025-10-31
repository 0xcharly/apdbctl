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

## Troubleshooting

The Apple Pro Display XDR advertises 4 different HID devices. Only one of them is capable of controlling the brightness.

### HID Report Descriptor

```
Report Descriptor: (79 bytes)

0x05, 0x80,        // Usage Page (Monitor Pages)
0x09, 0x01,        // Usage (0x01)
0xA1, 0x01,        // Collection (Application)
0x85, 0x01,        //   Report ID (1)
0x06, 0x82, 0x00,  //   Usage Page (Monitor Pages)
0x09, 0x10,        //   Usage (0x10)
0x16, 0x90, 0x01,  //   Logical Minimum (400)
0x27, 0x50, 0xC3, 0x00, 0x00,  //   Logical Maximum (49999)
0x67, 0xE1, 0x00, 0x00, 0x01,  //   Unit (System: SI Linear, Luminous Intensity: Candela)
0x55, 0x0E,        //   Unit Exponent (-2)
0x75, 0x20,        //   Report Size (32)
0x95, 0x01,        //   Report Count (1)
0xB1, 0x42,        //   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,Null State,Non-volatile)
0x05, 0x0F,        //   Usage Page (PID Page)
0x09, 0x50,        //   Usage (0x50)
0x15, 0x00,        //   Logical Minimum (0)
0x26, 0x20, 0x4E,  //   Logical Maximum (20000)
0x66, 0x10, 0x01,  //   Unit (Length: Centimeter, Mass: Gram)
0x55, 0x0D,        //   Unit Exponent (-3)
0x75, 0x10,        //   Report Size (16)
0xB1, 0x42,        //   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,Null State,Non-volatile)
0x06, 0x82, 0x00,  //   Usage Page (Monitor Pages)
0x09, 0x10,        //   Usage (0x10)
0x16, 0x90, 0x01,  //   Logical Minimum (400)
0x27, 0x50, 0xC3, 0x00, 0x00,  //   Logical Maximum (49999)
0x67, 0xE1, 0x00, 0x00, 0x01,  //   Unit (System: SI Linear, Luminous Intensity: Candela)
0x55, 0x0E,        //   Unit Exponent (-2)
0x75, 0x20,        //   Report Size (32)
0x95, 0x01,        //   Report Count (1)
0x81, 0x02,        //   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)
0xC0,              // End Collection
```
