# 🔍 1010 Sequence Detector (Verilog)

This project implements a **4-bit sequence detector** that detects the binary pattern `1010`. It includes both **Moore** and **Mealy** finite state machine (FSM) designs, with support for **overlapping** and **non-overlapping** detection.

Developed using **Verilog HDL**, tested through custom testbenches, and simulated in **Xilinx Vivado**.

---

## 🎯 Project Objectives

- Design **Moore FSM** for detecting sequence `1010`
- Design **Mealy FSM** for detecting sequence `1010`
- Support both **overlapping** and **non-overlapping** detection logic
- Write and simulate separate **testbenches** for each FSM type

---

## 📁 File Structure

| File | Description |
|------|-------------|
| `mealy_1010.v` | Mealy FSM for sequence 1010 (with overlap) |
| `moore_1010.v` | Moore FSM for sequence 1010 (with overlap) |
| `mealy_nonoverlap.v` | Mealy FSM (non-overlapping version) |
| `moore_nonoverlap.v` | Moore FSM (non-overlapping version) |
| `mealy_tb.v` | Testbench for Mealy FSM |
| `moore_tb.v` | Testbench for Moore FSM |
| `mealy_nonoverlap_tb.v` | Testbench for non-overlapping Mealy FSM |
| `moore_nonoverlap_tb.v` | Testbench for non-overlapping Moore FSM |
| `waveform.png` | Simulation waveform output (optional) |

---

## 🧠 FSM Design Overview

### ✅ Moore FSM

- Output depends only on **current state**
- More predictable; usually needs more states

### ✅ Mealy FSM

- Output depends on **current state and input**
- Can detect sequences faster with fewer states

### 🔄 Overlapping Detection

Example: Input = `10101010` → detects `1010` twice with overlaps

### 🔁 Non-Overlapping Detection

Input = `10101010` → detects only **every 4 bits** (no overlap)

---

## 🧪 Simulation

- Run testbenches in Vivado simulator
- Each testbench displays when the sequence is detected
- You can modify input sequence in `initial` block of each testbench

Sample testbench snippet:

```verilog
initial begin
  seq_in = 0;
  rst = 1;
  #10 rst = 0;
  seq_in = 1; #10;
  seq_in = 0; #10;
  seq_in = 1; #10;
  seq_in = 0; #10;
end
