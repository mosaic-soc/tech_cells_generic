// Copyright 2026 Mosaic SoC. All rights reserved.

// Author: Giuseppe Sarda <giuseppe@mosaic-soc.com>

// Functional model; configuration, retention, orientation, pulls, and bus keepers are ignored.
module tc_generic_io_cell import tc_io_pkg::*; #(
  parameter cell_t ImplKey = CNONE,  // Reference to specific implementation (e.g. family of cells)
  parameter orientation_t Orientation = H  // Orientation of the cell
) (
  input  logic output_enable_i,  // Output enable signal. Active high
  input  logic output_i,  // Output signal from the chip to the pad
  output logic input_o,  // Input signal from the pad to the chip
  input  pad_cfg_t cfg_i,  // Configuration input signals
  input  impl_in_t impl_i,  // Implementation input signals
  inout  logic inout_io  // Bidirectional IO signal
);
  assign inout_io = output_enable_i ? output_i : 'z;
  assign input_o = inout_io;
endmodule
