open(File.openDialog("Choose Image to Process with Experiment 1"));
run("Duplicate...", " ");

//Dialog.create("Select Original Image to Delete");
//Dialog.addImageChoice("Select Original Image to Delete")
//imageToDelete = Dialog.getImageChoice();
//Dialog.show();
selectWindow(File.name);
currImage = File.nameWithoutExtension;

close();
run("8-bit");
currImage1 = currImage + "-1.tiff";
//selectWindow(currImage1);

saveLoc = getDir("Choose directory to save image");

saveAs("Tiff", saveLoc + currImage1 );

run("Duplicate...", " ");

currImage2 = currImage + "-Background.tiff";
//selectWindow("01_test-2.tif");
run("Mean...", "radius=40");
saveAs("Tiff", saveLoc + currImage2);
imageCalculator("Subtract create", currImage2,currImage1);
//selectWindow("Result of 01_test-Background.tiff");
//run("Brightness/Contrast...");
run("Apply LUT");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction.tif");
run("Duplicate...", " ");
run("Convolve...", "text1=[1 1 1\n1 9 1\n1 1 1\n] normalize");
//run("Brightness/Contrast...");
run("Apply LUT");
//run("Close");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction-ConvolvedWithSmoothingKernel.tif");
//close();
