open("/home/travis/Desktop/Normal_Eye2_8bit.tif");
//Only for Certain testing is line 3
open("/home/travis/Desktop/Normal_Eye2_Background.tif");
run("Enhance Contrast...", "saturated=0");
run("Duplicate...", " ");
run("Mean...", "radius=90");
saveAs("Tiff", "/home/travis/Desktop/PHYS 345/Pics_for_345/Retinal_image_Background2.tif");
selectWindow("Normal_Eye2_8bit.tif");
imageCalculator("Subtract create", "Normal_Eye2_8bit.tif","Normal_Eye2_Background.tif");
selectWindow("Result of Normal_Eye2_8bit.tif");
run("8-bit");
setAutoThreshold("Default dark");
//run("Threshold...");
setThreshold(2, 12);
