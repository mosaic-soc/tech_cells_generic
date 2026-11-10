// Copyright 2026 Mosaic SoC. All rights reserved.

`ifndef PADS_SVH
`define PADS_SVH

`define DEFINE_REG2PAD_FUNC(__REG_T)
  function automatic pad_cfg_t ref2pad(
    input __REG_T cfg);
    pad_cfg_t pad;
    pad = '0;
    return pad;
  endfunction

`define ASSIGN_IMPL_I(__IMPL) \
  // ASSIGN_IMPL_I does nothing here. impl_i is: __IMPL

// Functional dummy pads with the same interface as tech_cells_tsmc12.
// Technology configuration, retention, orientation, pulls, and bus keepers
// are ignored. Outputs drive only while their active-high enable is asserted.

`define PAD_I(__PAD, __C, __CFG, __IMPL, __HV) \
  tc_io u_``__PAD ( \
    .i_o(__C), \
    .io_io(__PAD), \
    .oe_i(1'b0), \
    .o_i(1'b0), \
    .impl_i(1'b0) \
  );

`define PAD_O(__PAD, __I, __OE, __CFG, __IMPL, __HV) \
  tc_io u_``__PAD ( \
    .i_o(), \
    .io_io(__PAD), \
    .oe_i(__OE), \
    .o_i(__I), \
    .impl_i(1'b0) \
  );

`define PAD_IO(__PAD, __I, __OE, __C, __CFG, __IMPL, __HV) \
  tc_io u_``__PAD ( \
    .i_o(__C), \
    .io_io(__PAD), \
    .oe_i(__OE), \
    .o_i(__I), \
    .impl_i(1'b0) \
  );

`define PAD_IO_PU(__PAD, __I, __OE, __C, __CFG, __IMPL, __HV) \
  `PAD_IO(__PAD, __I, __OE, __C, __CFG, __IMPL, __HV)

`define PAD_GPIO(__PAD, __I, __OE, __C, __CFG, __IMPL, __HV) \
  `PAD_IO(__PAD, __I, __OE, __C, __CFG, __IMPL, __HV)

`endif
