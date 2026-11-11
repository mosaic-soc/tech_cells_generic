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
