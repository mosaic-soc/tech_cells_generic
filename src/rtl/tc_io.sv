// Copyright 2026 Mosaic SoC. All rights reserved.

// Author: Giuseppe Sarda <giuseppe@mosaic-soc.com>

package tc_io_pkg;
  /// Type for the cell implementation key (e.g. cell name) to be used in a case construct
  /// E.g. case (ImplKey) is
  ///        INPUTONLY_CELL_SKY180: begin
  ///          ... <instance of the INPUTONLY_CELL_SKY180 cell> ...
  ///        end
  ///      endcase
  typedef enum int { CNONE = 0} cell_t;
  /// Type for the cell orientation (e.g. "H" or "V")
  typedef enum logic { H = 0, V = 1} orientation_t;
  /// Type for the implementation input signals
  typedef logic pad_cfg_t;
  typedef logic impl_in_t;
endpackage

module tc_generic_io_cell import tc_io_pkg::*; #(
  parameter cell_t ImplKey = CNONE,  // Reference to specific implementation (e.g. family of cells)
  parameter orientation_t Orientation = H  // Orientation of the cell
) (
  input  logic oe_i,  // Output enable signal
  input  logic o_i,  // Input signal
  output logic i_o,  // Output signal
  input  pad_cfg_t cfg_i,  // Implementation input signals
  input  impl_in_t impl_i,  // Implementation input signals
  inout  logic io_io  // Bidirectional IO signal
);
  assign io_io = oe_i ? o_i : 'z;
  assign i_o = io_io;
endmodule

// Functional pad wrappers ignore technology configuration, retention, orientation,
// pulls, and bus keepers. Output enables are active high.
// I pad wrapper.
module tc_i_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  output logic i_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire io_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .o_i(1'b0),
    .oe_i(1'b0),
    .i_o(i_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .io_io(io_io)
  );
endmodule

// O pad wrapper; output enables are active high.
module tc_o_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  input logic o_i,
  input logic oe_i,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire io_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .o_i(o_i),
    .oe_i(oe_i),
    .i_o(),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .io_io(io_io)
  );
endmodule

// IO pad wrapper; output enables are active high.
module tc_io_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  input logic o_i,
  input logic oe_i,
  output logic i_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire io_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .o_i(o_i),
    .oe_i(oe_i),
    .i_o(i_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .io_io(io_io)
  );
endmodule

// IO_PU pad wrapper; output enables are active high.
module tc_io_pu_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  input logic o_i,
  input logic oe_i,
  output logic i_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire io_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .o_i(o_i),
    .oe_i(oe_i),
    .i_o(i_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .io_io(io_io)
  );
endmodule

// GPIO pad wrapper; output enables are active high.
module tc_gpio_cell import tc_io_pkg::*; #(
  parameter orientation_t Orientation = H
) (
  input logic o_i,
  input logic oe_i,
  output logic i_o,
  input pad_cfg_t cfg_i,
  input impl_in_t impl_i,
  inout wire io_io
);
  tc_generic_io_cell #(.Orientation(Orientation)) u_io_cell (
    .o_i(o_i),
    .oe_i(oe_i),
    .i_o(i_o),
    .cfg_i(cfg_i),
    .impl_i(impl_i),
    .io_io(io_io)
  );
endmodule
