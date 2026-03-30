// Copyright 2026 Mosaic SoC. All rights reserved.

package tc_sram_pkg;

  /// Enum to control the initialization value of the sram
  typedef enum int {
    INIT_ZEROS,  /// Each bit gets initialized with 1'b0.
    INIT_ONES,   /// Each bit gets initialized with 1'b1.
    INIT_RANDOM, /// Each bit gets random initialized with 1'b0 or 1'b1.
    INIT_X,      /// Each bit gets initialized with 1'bx.
    INIT_NONE    /// The memory does not get initialized.
  } sim_init_e;

  /// Convert the init value to a sting
  function string sim_init_str(sim_init_e init);
    case (init)
      INIT_ZEROS:  return "zeros";
      INIT_ONES:   return "ones";
      INIT_RANDOM: return "random";
      INIT_X:      return "x";
      INIT_NONE:   return "none";
      default:     return "unknown";
    endcase
  endfunction

endpackage
