/*
 * xy_shift_channels.ijm
 * ______________________________________________Description________________________________________________
 * A macro to shift in x and y multichannel images.
 * it does not work on stacks
 * NOTE:
 * 1) save this macro in the same folder as the image. In this way it will be able to iterate infinite times. 
 * 2) image will get cropped according to the shift
 * _________________________________________________________________________________________________________
 * 
 * Author: Aurora Panzera, Light Microscopy Facility, MPI for Developmental Biology
 */

  
  // Variables
getDimensions(width, height, channels, slices, frames);
//name = getTitle();
//filename = replace(getTitle(),"\\..*","");
dir = getDirectory("image");


Stack.setDisplayMode("composite");

 for (i=1; i<=channels; i++) {
  Dialog.create("Ch"+i+": shift" );

  Dialog.addNumber("X Shift:",0);
  Dialog.addNumber("Y Shift:", 0);
  Dialog.show();
  xshift = Dialog.getNumber();
  yshift = Dialog.getNumber();
 
  setBatchMode(true);
  run("Select All");
  setBackgroundColor(0, 0, 0);
  run("Cut");
  setKeyDown("none");
  makeRectangle(xshift, yshift, getWidth, getHeight);
  run("Paste");
  run("Crop");
  setBatchMode(false);
  } 

Dialog.create("happy?");
Dialog.addChoice("satisfied:", newArray("yes", "no"));
Dialog.show();
   iterate = Dialog.getChoice();
   if (iterate=="no")
     runMacro(dir+"\xy_shift_channels.ijm");
else{
waitForUser("", "Operation successful!");
Stack.setDisplayMode("color");
  } 