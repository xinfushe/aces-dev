
// <ACEStransformID>urn:ampas:aces:transformId:v1.5:IDT.ARRI.Alexa-v2-logC-EI500-CCT4700.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRI V2 LogC (EI500, 4700K)</ACESuserName>

// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 500
//  and CCT of adopted white set to 4700K
// Written by v2_IDT_maker.py v0.05 on Friday 19 December 2014

float
normalizedLogC2ToRelativeExposure(float x) {
	if (x > 0.124610)
		return (pow(10,(x - 0.391007) / 0.253569) - 0.089004) / 5.061087;
	else
		return (x - 0.124610) / 5.449261;
}

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	float r_lin = normalizedLogC2ToRelativeExposure(rIn);
	float g_lin = normalizedLogC2ToRelativeExposure(gIn);
	float b_lin = normalizedLogC2ToRelativeExposure(bIn);

	rOut = r_lin * 0.788969 + g_lin * 0.137209 + b_lin * 0.073821;
	gOut = r_lin * 0.067712 + g_lin * 1.069232 + b_lin * -0.136944;
	bOut = r_lin * 0.040314 + g_lin * -0.294560 + b_lin * 1.254246;
	aOut = 1.0;

}
