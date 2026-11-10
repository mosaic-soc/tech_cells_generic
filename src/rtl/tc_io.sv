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
  typedef enum logic { ONONE = 0} orientation_t;
  /// Type for the implementation input signals
  typedef logic pad_cfg_t;
  typedef logic impl_in_t;
endpackage

module tc_io import tc_io_pkg::*; #(
  parameter cell_t ImplKey = CNONE,  // Reference to specific implementation (e.g. family of cells)
  parameter orientation_t Orientation = ONONE,  // Orientation of the cell
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
