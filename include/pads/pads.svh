// Copyright 2026 Mosaic SoC. All rights reserved.

`ifndef PADS_SVH
`define PADS_SVH

`define DEF_REG2PAD_FUNC(__REG_T) \
  function automatic tc_io_pkg::pad_cfg_t reg2pad(input tc_io_pkg::cell_t cell_key, input __REG_T cfg_reg); \
    tc_io_pkg::pad_cfg_t pad; \
    pad = '0; \
    return pad; \
  endfunction

`define ASSIGN_IMPL_I(__IMPL) \
  assign __IMPL = '0;

`endif
