// Copyright 2026 Mosaic SoC. All rights reserved.

// Author: Giuseppe Sarda <giuseppe@mosaic-soc.com>

// Functional model; configuration, retention, orientation, pulls, and bus keepers are ignored.
module tc_input_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  output logic input_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire inout_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .output_i(1'b0),
    .output_enable_i(1'b0),
    .input_o(input_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .inout_io(inout_io)
  );
endmodule
