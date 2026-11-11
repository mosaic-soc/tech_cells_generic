// Copyright 2026 Mosaic SoC. All rights reserved.

// Author: Giuseppe Sarda <giuseppe@mosaic-soc.com>

// Functional model; configuration, retention, orientation, pulls, and bus keepers are ignored.
module tc_inout_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  input logic output_i,
  input logic output_enable_i,
  output logic input_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire inout_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .output_i(output_i),
    .output_enable_i(output_enable_i),
    .input_o(input_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .inout_io(inout_io)
  );
endmodule
