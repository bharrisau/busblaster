module system(
  input ACBUS6,
  input FT_TCK,
  input ACBUS5,
  input FT_TDI,
  input ACBUS4,
  input FT_TMS,
  input ADBUS5,
  output FT_TDO,
  input ACBUS2,
  input FT_nTRST,
  input ACBUS3,
  input FT_nSRST_OUT,
  output FT_nSRST_IN,
  output FT_RTCK,
  input ACBUS7,

  input RTCK,
  input TDO,
  output TCK,
  output TDI,
  inout TMS,
  inout nSRST,
  output nTRST,
  output LED
);

assign FT_TDO       = (ADBUS5 == 1'b1) ? TDO : TMS;
assign FT_nSRST_IN  = nSRST;
assign FT_RTCK      = RTCK;

assign TCK          = (ACBUS6 == 1'b1) ? 1'bz : FT_TCK;
assign TDI          = (ACBUS5 == 1'b1) ? 1'bz : FT_TDI;
assign TMS          = (ACBUS4 == 1'b1) ? 1'bz : ((ADBUS5 == 1'b1) ? FT_TMS : FT_TDI);
assign nSRST        = (ACBUS3 == 1'b1) ? 1'bz : FT_nSRST_OUT;
assign nTRST        = (ACBUS2 == 1'b1) ? 1'bz : FT_nTRST;
assign LED          = ~ACBUS7;

endmodule