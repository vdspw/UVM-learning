module fifo (
  input clk,
  input reset, //clk and reset are the global signals
  input rreq, wreq,
  input [7:0] wdata,
  input [7:0] rdata,
  output f,e //full and empty flags
);
  
  
  
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////
class transaction;
  
  bit clk;
  bit rst;
  
  rand bit rreq,wreq; // read and write request
  
  rand bit [7:0] wdata;
  bit [7:0] rdata;
  bit e; //empty flag
  bit f; // full flag
  
  constraint cntl_wr { wreq dist { 0:=30; 1:=70; }; }
  constraint cntl_rd { rreq dist { 1:=70; 0:=30; }; }
  constraint wr_rd {wreq != rreq }
  
endclass
