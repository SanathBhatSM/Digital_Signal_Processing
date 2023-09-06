//C Program To Generate Square Wave Using DSK6713 Kit

#define CHIP_6713 1
#include"dsk6713.h"
#include"dsk6713_aic23.h"
#include"math.h"
#define PI 3.1416
DSK6713_AIC23_Config Config={0x0017,0x0017, 0x01f9, 0x01f9,0x0011,0x0000,0x0000,0x0043, 0x0081, 0x0001 };
DSK6713_AIC23_CodecHandle hCodec;

void main()
{
	int t;
	float x;
	Uint32 val;
	//Open Codec (Codec Stands for Coder-Decoder)
	hCodec=DSK6713_AIC23_openCodec(0, &Config);

	while(1)
	{

		for(t=0;t<1000;t++)
		{
			//Generate High Value
			x=0.5;

			//Convert 'x' into Uint32 data type
			val=(Uint32)(x*pow(2,16));

			//Input 'val' to 'write' function to display the waveform in DSO
			DSK6713_AIC23_write(hCodec, val);

		}
		for(t=0;t<1000;t++)
				{
					//Generate Low Value
					x=0;

					//Convert 'x' into Uint32 data type
					val=(Uint32)(x*pow(2,16));

//Input 'val' to 'write' function to display the waveform in DSO
					DSK6713_AIC23_write(hCodec, val);

				}


	}
}

