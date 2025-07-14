# UART_PROTOCOL_PROJECT

This project presents a SystemVerilog-based implementation of a UART (Universal Asynchronous Receiver/Transmitter) protocol, featuring full-duplex asynchronous communication with integrated even parity error detection. The design comprises modular components including a transmitter, receiver, and baud rate generator, and is functionally verified through a comprehensive SystemVerilog testbench simulated on the EDAPlayground platform.

## Design Highlights
**Parameterized 8-Bit UART Communication**:
Implements asynchronous serial data transmission supporting 8-bit payloads per frame, ensuring efficient byte-level communication between digital systems.

**Framing Structure**:
Each transmission frame adheres to the standard UART protocol format, consisting of 1 start bit, 8 data bits, 1 even parity bit, and 1 stop bit, offering a balanced trade-off between overhead and reliability.

**Even Parity-Based Error Detection**:
Integrates even parity generation and verification to facilitate basic error detection, enhancing data integrity in environments susceptible to single-bit disturbances.

**Programmable Baud Rate Generator**:
Utilizes a counter-driven baud rate divider, configurable to standard rates (e.g., 9600, 115200 bps), enabling flexible integration with diverse communication peripherals.

**Modular SystemVerilog Architecture**:
The design is fully modularized in synthesizable SystemVerilog, comprising discrete components for the transmitter, receiver, and baud generator, promoting design clarity and reusability.

**Formal Verification via Simulation**
Comprehensive simulation is conducted using EDAPlayground, leveraging the Icarus Verilog backend and EPWave waveform analyzer for signal-level verification and protocol validation.

## Frame format
| Start Bit |    Data Bits    |      Parity Bit       | Stop Bit(s) (1 or 2) |                             

 ## Toolchain
**Language**: SystemVerilog

**Simulator**: EDAPlayground

**Waveform Viewer**: EPWave

(Optional synthesis possible using Vivado or Synopsys tools)







