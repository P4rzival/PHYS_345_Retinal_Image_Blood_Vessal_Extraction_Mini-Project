run("Convolve...", "text1=[-1 -1 -1\n-1 9 -1\n-1 -1 -1] normalize");
selectWindow("01_test-1.tif");
selectWindow("01_test-2.tif");
run("8-bit");
selectWindow("01_test-1.tif");
run("8-bit");
run("Mean...", "radius=40");
saveAs("Tiff", "/home/travis/Desktop/BlurringBackground.tif");
selectWindow("01_test-2.tif");
saveAs("Tiff", "/home/travis/Desktop/BlurringEye.tif");
selectWindow("BlurringBackground.tif");
imageCalculator("Subtract create", "BlurringBackground.tif","BlurringEye.tif");
selectWindow("Result of BlurringBackground.tif");
//run("Brightness/Contrast...");
run("Apply LUT");
run("Close");
selectWindow("BlurringEye.tif");
selectWindow("BlurringBackground.tif");
selectWindow("Result of BlurringBackground.tif");
makeRectangle(319, 406, 14, 11);
selectWindow("BlurringBackground.tif");
close();
selectWindow("BlurringEye.tif");
close();
saveAs("Tiff", "/home/travis/Desktop/PHYS 345/Mini_Project/Normal_Eye/Result of BlurringBackground.tif");
selectWindow("Result of BlurringBackground.tif");
