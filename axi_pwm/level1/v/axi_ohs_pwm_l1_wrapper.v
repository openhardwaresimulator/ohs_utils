/**
  Module name: ohs_boost_l1_wrapper
  Author: P.Trujillo
  Date: March 2024
  Revision: 1.0
  History: 
    1.0: Module created
**/

`default_nettype none
`define S_AXI_DATA_WIDTH 32
`define S_AXI_ADDR_WIDTH 4 /* 3 parameters needed x 4 bytes */

module ohs_pwm_l1_wrapper (
	/* AXI4 Lite interface */
	input wire s_axi_aclk, 
	input wire s_axi_aresetn, 

  input wire [`S_AXI_ADDR_WIDTH - 1:0] s_axi_awaddr,
  input wire s_axi_awvalid,
	output wire s_axi_awready,
  
	input wire [`S_AXI_DATA_WIDTH-1:0] s_axi_wdata,
	input wire [`S_AXI_DATA_WIDTH/8-1:0] s_axi_wstrb,
	input wire s_axi_wvalid,
  output wire s_axi_wready,
	
	output wire [1:0] s_axi_bresp,
	output reg s_axi_bvalid,
	input wire s_axi_bready,

	input wire [`S_AXI_ADDR_WIDTH - 1:0] s_axi_araddr,
  input  wire s_axi_arvalid,
  output wire s_axi_arready,

  output wire [`S_AXI_DATA_WIDTH-1:0] s_axi_rdata,	
  output wire [1:0] s_axi_rresp,
	output reg s_axi_rvalid,
	input wire s_axi_rready,

	/* Model external interface */
	/* PWM output */
  output wire pwm
);

	/**********************************************************************************
	*
	* Wrapper interconnection signals
	*
	**********************************************************************************/

	wire [`S_AXI_DATA_WIDTH-1:0] pwm_period;
  wire [`S_AXI_DATA_WIDTH-1:0] pwm_comparator;
  wire [`S_AXI_DATA_WIDTH-1:0] pwm_counter;

	/**********************************************************************************
	*
	* AXI Interface
	*
	**********************************************************************************/

	axi_ohs_comm boost_comm_inst0 (
	.s_axi_aclk(s_axi_aclk), 
	.s_axi_aresetn(s_axi_aresetn), 
	/* address write if */
  .s_axi_awaddr(s_axi_awaddr),
  .s_axi_awvalid(s_axi_awvalid),
	.s_axi_awready(s_axi_awready),
  /* data write if */
	.s_axi_wdata(s_axi_wdata),
	.s_axi_wstrb(s_axi_wstrb),
	.s_axi_wvalid(s_axi_wvalid),
  .s_axi_wready(s_axi_wready),
	/* handshaking */
	.s_axi_bresp(s_axi_bresp),
	.s_axi_bvalid(s_axi_bvalid),
	.s_axi_bready(s_axi_bready),
	/* address read if */
	.s_axi_araddr(s_axi_araddr),
  .s_axi_arvalid(s_axi_arvalid),
  .s_axi_arready(s_axi_arready),
	/* data read if */
  .s_axi_rdata(s_axi_rdata),	
  .s_axi_rresp(s_axi_rresp),
	.s_axi_rvalid(s_axi_rvalid),
	.s_axi_rready(s_axi_rready),
	/* model configuration registers */
	.pwm_period(pwm_period),
	.pwm_comparator(pwm_comparator),
	/* model visualization signals */
	.pwm_counter(pwm_counter)
);

	/**********************************************************************************
	*
	* Electrical model
	*
	**********************************************************************************/




endmodule