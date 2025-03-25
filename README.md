# SnowPixel
Yet another 8x8 neopixel matrix... But hear me out, this one is a little special ❄️ 

This is a small 20x20x0.8mm module that can be tiled in any shape without any wiring by soldering them together with the castellated holes.

The built in solder jumpers in the data pads let the user decide whether the module sends and receives the data straight accross or at a 90 degree angle.

The modules are meant to be fitted on a 3D printed grid to create proper 2x2mm square pixels.

The leds used are XL-1010RGBC-WS2812B 1x1mm leds.

This project is meant mainly as a test to push the pcb fab's specs to the limit and try a couple 3D printing ideas to obtain a thin, seamless display.

<p align="center">
  <img src="./images/snowpixel_top.png" style="width: 40%; height: auto;" />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="./images/snowpixel_bottom.png" style="width: 40%; height: auto;" /> 
</p>

## 3D print

There are two OpenSCAD models, one is meant as a standalone configuration, the other is meant for using the modules as smd parts on a bigger board.  

Both are meant to be printed in black PET on a white PET film substrate.

There are also two models which can be printed more easily in PLA by doing the first <x> in white PLA and the rest in black.
