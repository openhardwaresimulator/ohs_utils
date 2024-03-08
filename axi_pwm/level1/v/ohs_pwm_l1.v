/**
  Module name: pwm_l1
  Author: P.Trujillo
  Date: March 2024
  Revision: 1.0
  History: 
    1.0: Module created
**/

`default_nettype none
`define S_AXI_DATA_WIDTH 32

module ohs_pwm_l1 (
	input wire aclk, 
	input wire resetn, 

	input wire [`S_AXI_DATA_WIDTH-1:0] pwm_period,
	input wire [`S_AXI_DATA_WIDTH-1:0] pwm_comparator,
	output reg [`S_AXI_DATA_WIDTH-1:0] pwm_counter,

	output wire pwm
);

	/**********************************************************************************
	*
	* PWM Sawtooth generator
	*
	**********************************************************************************/
	always @(posedge aclk)
		if (!resetn || (pwm_counter >= pwm_period))
			pwm_counter <= {`S_AXI_DATA_WIDTH{1'b0}};
		else 
			pwm_counter <= pwm_counter + 1;

	/**********************************************************************************
	*
	* Output signal comparator
	*
	**********************************************************************************/
	assign pwm = (pwm_counter < pwm_period)? 1'b1: 1'b0;

endmodule
